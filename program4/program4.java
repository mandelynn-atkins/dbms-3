import java.sql.*; 
public class program4 {
   public static void main(String args[]){
   try {
      Statement stmt;
      //Register the JDBC driver for MySQL. 
      Class.forName("com.mysql.jdbc.Driver"); 
      //Define URL of database server 
      String url = "jdbc:mysql://"+args[0]+":3306/"+args[1];
      //Get a connection to the database 
      Connection con = DriverManager.getConnection(url,args[2],args[3]); 
      //Get a Statement object 
      con.setAutoCommit(true);
      stmt = con.createStatement(); 
      stmt.executeUpdate("create table Grades (TNumber char(8), CourseID char(7), Grade char(1), foreign key (TNumber) references Students(TNumber))");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00003256', 'CSC4300', 'A')");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00012345', 'MAT1910', 'B')");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00012345', 'CSC2110', 'D')");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00001423', 'BIO1010', 'D')");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00015366', 'CSC2110', 'C')");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00003256', 'CSC4100', 'A')");
      stmt.executeUpdate("INSERT INTO Grades VALUES ('00003256', 'CSC2110', 'A')");
   }
   catch (Exception ex) {
   System.out.println(ex.getMessage());
   }
}
}
