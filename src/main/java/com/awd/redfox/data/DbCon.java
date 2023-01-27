package com.awd.redfox.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
   private static Connection connection =null;
   public static Connection getConnection() throws ClassNotFoundException, SQLException {
       if (connection==null){
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection=DriverManager.getConnection("jdbc:mysql://localhost:/redfox_movies","root","qwertyui");
           System.out.println("Connected");
       }
       return connection;
   }
}
