package com.m183.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.m183.db.MySqlDB;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//Logger
		Logger logger = Logger.getLogger("Log");
        FileHandler fh;
        fh = new FileHandler("C:/Log/LogFile.log", 5000, 1);
        logger.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);
        logger.info("Logger started");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String user = request.getParameter("user");
		String password = request.getParameter("password");		
		
		try {
			String code = "geheim";
			String sql = "SELECT username, password FROM user WHERE username = ? AND password = AES_ENCRYPT"
					+ "(?, '" + code  + "')";
			Connection c = MySqlDB.getConnection();
			PreparedStatement p = c.prepareStatement(sql);
			p.setString(1, user);
			p.setString(2, password);
			ResultSet rs = p.executeQuery();
			logger.info("Check for user - password combination");
			
			//Falls Login existiert
			if (rs.next()) {
				RequestDispatcher rd = request.getRequestDispatcher("Form.jsp");
				logger.info("User logged in");
				session.setAttribute("user", user);
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				request.setAttribute("error", "true");
				logger.warning("Wrong login");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("error", "true");
			System.out.print(e);
			logger.warning("Couldn't get data from database.");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
