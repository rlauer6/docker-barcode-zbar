# README

This is the README file for the `docker-zbar` project. The object of
the project is to build a Docker container that contains a Perl based
QR code reader based on `Barcode::ZBar` (although it can probably be
used to read barcodes too. ;-) )

# Requirements

* `make`
* `docker`

# Building the Container

The container is based on `amazon-linux:2`. Building the container can
be done by running the `make` against the `Makefile`. The build will
produce output the results of the build to STDOUT and a log file
(`docker.log`).

```
make
```

After all of the components have been built in the container the
`qr-decode.pl` script is run to test the QR code reader.

* The original idea for building a containerized version of a QR code
reader  was inspired by: [Reading QR Codes from
Perl](https://github.polettix.it/ETOOBUSY/2020/01/22/zbar/)
* The `qr-decode.pl` script was lifted from version 0.04 of [`Barcode::ZBar`](https://metacpan.org/Barcode::ZBar)

# TODO

* [ ] Create an Apache based webservice for reading QR codes
* [ ] Install webservice on a Fargate cluster

