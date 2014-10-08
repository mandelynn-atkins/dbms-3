import sys
import MySQLdb

try:
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "coursework", db = "students")
except MySQLdb.Error, e:
    print "Error %d: %s" % (e.args[0], e.args[1])
    sys.exit(1)

cursor = conn.cursor()

add_student = ("INSERT INTO Students (TNumber, FirstName, LastName, DateOfBirth) \
	          VALUES (%s, %s, %s, %s)")

student1 = ('00001234', 'Joe', 'Smith', '1950-08-12')
student2 = ('00003256', 'John', 'Doe', '1970-07-15')
student3 = ('00001423', 'Mary', 'Smith', '1992-01-01')
student4 = ('00015366', 'William', 'Williamson', '1992-05-23')
student5 = ('00012345', 'Katie', 'Did', '1992-09-27')
			 
cursor.execute(add_student, student1)
cursor.execute(add_student, student2)
cursor.execute(add_student, student3)
cursor.execute(add_student, student4)
cursor.execute(add_student, student5)

conn.commit()
