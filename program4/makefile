all: run
.PHONY: run
HOST=localhost
DATABASE=students
USER=root
PASSWORD=coursework
export HOST DATABASE USER PASSWORD

program4.class: program4.java
	javac program4.java
# Note the in the line above, put a literal <tab> character to indent "javac program4.java"
run: program4.class
	java -cp ./:/usr/share/java/mysql.jar program4 $(HOST) $(DATABASE) $(USER) $(PASSWORD)
# Note the in the line above, put a literal <tab> character to indent  "java -cp ..."
