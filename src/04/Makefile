filenames := *.log temp

files := $(strip $(foreach f,$(filenames),$(wildcard $(f))))

create:
	./main.sh

clean:
ifneq ($(files),)
	rm -f $(files)
endif

rebuild: clean
	$(MAKE) create
