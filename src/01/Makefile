
THIRD_PARAM= az
SIZE=5
number_of_subfolders=4
number_of_files=5

create:
	./main.sh /home/student/DO4_LinuxMonitoring_v2.0-0/src/01/ $(number_of_subfolders) $(THIRD_PARAM) $(number_of_files) az.az $(SIZE)kb
clean:
	rm -rf *.log
	find  . -name '$(THIRD_PARAM)*' -exec rm -rf {} \;
