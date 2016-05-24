/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DbConnector;

/**
 *
 * @author cb005482
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        RequestDispatcher rd;

        DbConnector dbcon = new DbConnector();
        try {
            dbcon.OpenConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (request.getParameter("login") != null) {
            if (request.getParameter("login").equals("admin")) {
                try {
                    if (dbcon.isAdminExist(username, password)) {
                        dbcon.CloseConnection();
                        rd = request.getRequestDispatcher("WEB-INF/redirect.jsp");
                        rd.forward(request, response);
                    } else {
                        rd = request.getRequestDispatcher("error.jsp");
                        rd.forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            if (request.getParameter("login").equals("teacher")) {
                try {
                    if (dbcon.isTeacherExist(username, password)) {
                        dbcon.CloseConnection();
                        rd = request.getRequestDispatcher("WEB-INF/redirect.jsp");
                        rd.forward(request, response);
                    } else {
                        rd = request.getRequestDispatcher("error.jsp");
                        rd.forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

}
