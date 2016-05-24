/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnector {

    Connection con;
    Statement stmt;
    String sql;

    public void OpenConnection() throws ClassNotFoundException, SQLException {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        con = DriverManager.getConnection("jdbc:derby://localhost:1527/students", "osanda", "osanda");
    }

    public boolean isAdminExist(String u, String p) throws SQLException {
        boolean flag = false;
        sql = "select USERNAME from ADMIN where USERNAME = '" + u + "' and password = '" + p + "'";
        stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            flag = true;
        }
        return flag;
    }
    
    public boolean isTeacherExist(String u, String p) throws SQLException {
        boolean flag = false;
        sql = "select USERNAME from OSANDA.TEACHER where USERNAME = '" + u + "' and password = '" + p + "'";
        stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            flag = true;
        }
        return flag;
    }


    public void CloseConnection() throws SQLException {
        con.close();
    }

}
