package com.harsh.pandit.MovieDatabase;

import java.sql.*;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ServletFilmAdd")
public class ServletFilmAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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

		StringBuffer sb = new StringBuffer();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
			String i = "insert into film(title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating,special_features) values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(i);
			statement.setString(1, title);
			statement.setString(2, description);
			statement.setInt(3, Integer.parseInt(release_year));
			statement.setInt(4,Integer.parseInt( language_id));
			statement.setInt(5, Integer.parseInt(original_language_id));
			statement.setInt(6, Integer.parseInt(rental_duration));
			statement.setInt(7, Integer.parseInt(rental_rate));
			statement.setFloat(8, Float.parseFloat(length));
			statement.setInt(9, Integer.parseInt(replacement_cost));
			statement.setString(10,rating);
			statement.setString(11, special_features);
			statement.execute();
			PreparedStatement ps = con.prepareStatement("select * from film");

			ResultSet rs = ps.executeQuery();
			
			sb.append("<h2> Film List with details</h2>");
			while (rs.next())

				sb.append(("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>"
						+ rs.getInt(3) + "</td>" + "<td>" + rs.getInt(4) + "</td>" + "<td>" + rs.getInt(5) + "</td>"
						+ "<td>" + rs.getInt(6) + "<td>" + rs.getInt(7) + "</td>" + "<td>" + rs.getFloat(8) + "</td>"
						+ "<td>" + rs.getInt(9) + "<td>" + "<td>" + rs.getString(10) + "</td>" + rs.getString(11) + "</td>"
						+ "</td>" + "</td>" + "</tr>"));
			sb.append("</table>");
			con.close();
			req.setAttribute("MovieAdd", sb.toString());
			RequestDispatcher rd = req.getRequestDispatcher("/ServletActorList.jsp");
			rd.forward(req, resp);
	
			 
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
