FROM amazonlinux:2

RUN amazon-linux-extras install epel -y
RUN amazon-linux-extras install testing -y

# copy support files, test qrcode image, perl script
COPY package.lst .
COPY 2020-01-japh.png .
COPY qr-decode.pl .

# install RPMs
RUN  yum install -y $(cat package.lst)

# build libzbar
RUN mkdir git; \
    cd git; \
    git clone https://github.com/mchehab/zbar
RUN cd git/zbar; \
    autoreconf -vfi; \
    ./configure --with-imagemagick; \
    make && make install; \
    make
    
# install Barcode::ZBar
RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm -v Barcode::ZBar

# test
RUN perl -wc qr-decode.pl && perl qr-decode.pl 2020-01-japh.png
