#-*- mode: makefile-gmake; -*-

# make NOCACHE=1 to disable Docker caching
TAG = qrcode-reader

MANIFEST = \
   package.lst \
   qr-decode.pl \
   2020-01-japh.png \
   Dockerfile

# build_time is used to disable caching for last step in Dockerfile
docker.log: $(MANIFEST)
	build_time=$$(date +%s); \
	test -n "$$NOCACHE" && NOCACHE="--no-cache"; \
	docker build $$NOCACHE \
            --build-arg CACHEBUST="$$build_time" \
           -f Dockerfile . -t $(TAG) 2>&1 | tee $@
	if grep -i 'just another perl hacker' $@; then \
	  echo "Success!"; \
	else \
	  echo "ERROR: check the 'docker.log' file!"; \
	fi

PHONY: clean

clean:
	rm -f docker.log
