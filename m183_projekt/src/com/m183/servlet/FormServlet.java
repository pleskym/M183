package com.m183.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.m183.db.MySqlDB;

public class FormServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Logger logger = Logger.getLogger("Log");
        FileHandler fh;
        fh = new FileHandler("C:/Log/LogFile.log", 5000, 1);
        logger.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);
        logger.info("Logger started");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String room = request.getParameter("room");
		int roomInt = Integer.parseInt(room);
		String date = request.getParameter("date");
		String duration = request.getParameter("duration");
		logger.info("Set parameters");
		
		try {
			String sql = "INSERT INTO reservation (name, rommNr, date, duration, email) VALUES (?, ?, ?, ?, ?)";
			Connection c = MySqlDB.getConnection();
			PreparedStatement p = c.prepareStatement(sql);
			p.setString(1, name);
			p.setInt(2, roomInt);
			p.setString(3, date);
			p.setString(4, duration);
			p.setString(5, email);
			ResultSet rs = p.executeQuery();
			logger.info("DB request");
			
			RequestDispatcher rd = request.getRequestDispatcher("Sent.jsp");
			logger.info("User logged in");
			rd.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("Form.jsp");
			request.setAttribute("error", "true");
			logger.warning("Wrong login");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
