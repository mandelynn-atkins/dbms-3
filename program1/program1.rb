require "mysql"
begin
   dbh = Mysql.real_connect("localhost", "root", "coursework", "students")
   res = dbh.query("CREATE TABLE Students(TNumber char(8) primary key, FirstName varchar(20) not null, LastName varchar(20) not null, DateOfBirth date)")
   res = dbh.query("CREATE INDEX lname ON Students (LastName)")
   ensure
      dbh.close if dbh
end
