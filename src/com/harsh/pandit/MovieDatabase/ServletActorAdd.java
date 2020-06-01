package com.harsh.pandit.MovieDatabase;

import java.sql.*;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ServletActorAdd")
public class ServletActorAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		/*
		 * if (first_name == null || last_name == null || "".equals(first_name) ||
		 * "".equals(last_name)) { throw new ServletException("enter full name"); }
		 */
		// out.write("Harsh Pandit".getBytes()); // default
		// out.write("<a href=\"/_connectDB/actor.jsp\"> click here to Add new
		// actor</a>".getBytes());
		StringBuffer sb = new StringBuffer();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
			String i = "insert into actor(first_name, last_name) values (?,?)";
			PreparedStatement statement = con.prepareStatement(i);
			statement.setString(1, first_name);
			statement.setString(2, last_name);
			statement.execute();
			sb.append("Actor is add into the database ");
			System.out.println("Data inserted:" + i);

			con.close();
			req.setAttribute("ActorAdd", sb.toString());
			RequestDispatcher rd = req.getRequestDispatcher("/ServletActorList.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			System.out.println(e);
		}

	}
	/*
	 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { // TODO Auto-generated method
	 * stub
	 * 
	 * resp.getOutputStream().write("Harsh Pandit POST".getBytes()); }
	 */
}