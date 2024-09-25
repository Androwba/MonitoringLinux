filenames := *.log

files := $(strip $(foreach f,$(filenames),$(wildcard $(f))))

1: clean
	./main.sh 1

2: clean
	./main.sh 2

3: clean
	./main.sh 3

4: clean
	./main.sh 4

clean:
ifneq ($(files),)
	rm -f $(files)
endif