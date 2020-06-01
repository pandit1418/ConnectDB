package com.harsh.pandit.MovieDatabase;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ServletFilmList")
public class ServletFlimList extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String release_year = req.getParameter("release_year");
		String language_id = req.getParameter("language_id");
		String original_language_id = req.getParameter("original_language_id");
		String rental_duration = req.getParameter("rental_duration");
		String rental_rate = req.getParameter("rental_rate");
		String length = req.getParameter("length");
		String replacement_cost = req.getParameter("replacement_cost");
		String rating = req.getParameter("rating");
		String special_features = req.getParameter("special_features");
		StringBuffer sb=new StringBuffer();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
			PreparedStatement ps = con.prepareStatement("select * from film");

			ResultSet rs = ps.executeQuery();
			sb.append("<h2> Film List with details</h2>");
			sb.append("<table border='1'>" + "<tr>" + "<th>title</th>" + "<th>Description</th>"
					+ "<th>Release Year</th>" + "<th>Language Id</th>" + "<th>Original Language Id</th>"
					+ "<th>Rental Duration</th>" + "<th>Rental Rate</th>" + "<th>Length</th>"
					+ "<th>Replacement Cost</th>" + "<th>Rating</th>" + "<th>Special Features</th>"+"</tr>");
			while (rs.next())

				sb.append("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>"
						+ rs.getString(3) + "</td>" + "<td>" + rs.getInt(4) + "</td>" + "<td>" + rs.getInt(5) + "</td>"
						+ "<td>" + rs.getInt(6) + "</td>" + "<td>" + rs.getInt(7) + "</td>" + "<td>" + rs.getFloat(8)
						+ "</td>" + "<td>" + rs.getInt(9) + "</td>" + "<td>" + rs.getString(10) + "</td>" + "<td>"
						+ rs.getString(11) + "</td>" + "</tr>");
			sb.append("</table>");

			con.close();
			req.setAttribute("MoviesList", sb.toString());
			RequestDispatcher rd = req.getRequestDispatcher("/ServletFilmList.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
