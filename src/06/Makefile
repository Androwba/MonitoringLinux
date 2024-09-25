filenames := *.html
files := $(strip $(foreach f,$(filenames),$(wildcard $(f))))

go:
	goaccess -f ../04/nginx1.log ../04/nginx2.log ../04/nginx3.log ../04/nginx4.log \
    ../04/nginx5.log  --log-format=COMBINED

web:
	goaccess ../04/*.log -o index.html --log-format=COMBINED && xdg-open index.html

clean:
ifneq ($(files),)
	rm -f $(files)
endif