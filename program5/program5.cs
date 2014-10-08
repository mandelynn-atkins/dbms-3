using System;
using System.Data;
using MySql.Data.MySqlClient;
public class Test {
   public static void Main(string[] args) {
      string connectionString = "Server=localhost;" +
         "Database=students;" + "User ID=root;" +
         "Password=coursework;" + "Pooling=false";
      IDbConnection dbcon = new MySqlConnection(connectionString);
      dbcon.Open();
      IDbCommand dbcmd = dbcon.CreateCommand();
      string sql = "select * from Students NATURAL LEFT OUTER JOIN Grades";
      dbcmd.CommandText = sql;
      IDataReader reader = dbcmd.ExecuteReader();
      string header = String.Format("{0,20}{1,20}{2,20}",
                                       "First Name", "Last Name", "Allowed to Take");
      Console.WriteLine(header);
      string output;
      string previous = "";
      string current = "";
      string CourseID;
      string Grade;
      while(reader.Read()) {
         string FirstName = (string) reader["FirstName"];
         string LastName = (string) reader["LastName"];
         //string CourseID = (string) reader["CourseID"];
         if (reader["CourseID"] == null) {CourseID = "null";}
         else {CourseID = (string) reader["CourseID"];}
         string TNumber = (string) reader["TNumber"];
         //string Grade = (string) reader["Grade"];
         if (reader["Grade"] == null) {Grade = "null";}
         else {Grade = (string) reader["Grade"];}
         //output = String.Format("{0,20}{1,20}", FirstName, LastName);
         //Console.WriteLine(output);
         previous = current;
         current = TNumber;

         if (previous == current) {
            continue;}
         else {
            if (CourseID == "CSC2110" && (Grade[0] == 'A' || Grade[0] == 'B' || Grade[0] == 'C')) {
               output = String.Format("{0,20}{1,20}{2,20}", FirstName, LastName, "Yes");}
            else {
               output = String.Format("{0,20}{1,20}{2,20}", FirstName, LastName, "No");}
         }
         Console.WriteLine(output);
      }
      // clean up
      reader.Close();
      dbcmd.Dispose();
      dbcon.Close();
   }
}
