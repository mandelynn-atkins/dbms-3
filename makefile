.PHONY: program1 program2 program3 program4 program5 program6
HOST=localhost
DATABASE=student
USER=root
PASSWORD=coursework
export HOST DATABASE USER PASSWORD
program1:
	ruby ./program1/program1.rb $(HOST) $(DATABASE) $(USER) $(PASSWORD)
program2:
	python ./program2/program2.py $(HOST) $(DATABASE) $(USER) $(PASSWORD)
program3:
	tclsh ./program3/program3.tcl $(HOST) $(DATABASE) $(USER) $(PASSWORD)
program4:
	make -C program4
program5:
	dmcs program5/program5.cs -r:System.Data.dll -r:/usr/lib/cli/MySql.Data-6.4/MySql.Data.dll
	mono program5/program5.exe $(HOST) $(DATABASE) $(USER) $(PASSWORD)
program6:
	g++ -DIBPP_LINUX -o program6/program6.exe -lfbclient -libpp program6/program6.cpp
	./program6/program6.exe

