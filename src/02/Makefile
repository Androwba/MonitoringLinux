PARAETERS=az az.az 10Mb

create:
	@sudo ./main.sh $(PARAETERS)
log:
	@cd ../03/ && sudo ./main.sh 1
time:
	@cat logFile02.log | head -n1 
	@cat logFile02.log | tail -n3
	@cd ../03/ && sudo ./main.sh 2
mask:
	@cat logFile02.log | head -n2
	@cd ../03/ && sudo ./main.sh 3

space:
	@df -h / | awk '{ print $$4 }'
clean:
	rm -rf *.log

.PHONY: create