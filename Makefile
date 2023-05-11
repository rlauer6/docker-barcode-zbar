MANIFEST = \
   package.lst \
   qr-decode.pl \
   2020-01-japh.png \
   Dockerfile

docker.log: $(MANIFEST)
	docker build -f Dockerfile . -t qrcode-reader 2>&1 | tee $@
