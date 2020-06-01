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

@WebServlet(value = "/ServletActorList")
public class ServletActorList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		StringBuffer sb = new StringBuffer();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
			PreparedStatement ps = con.prepareStatement("select first_name, last_name from actor");
			ResultSet rs = ps.executeQuery();
		
			//out.write("<%@ include  file=\"/_connectDB/Nav.jsp\" %>".getBytes());
			//sb.append("<A href=\"/_connectDB/ActorsMenu.jsp\">Click here to go back</A>");
			//sb.append("<input type='button' onClick=\"location.href='/_connectDB/ActorsMenu.jsp'\" value='Go Back'>");
			sb.append("<h2>Here's what your fellow workers have said:</h2>");
			sb.append(("<table border='1'>\r\n" + "	<tr>\r\n" + "		<th>First Name </th>\r\n"
					+ "		<th>Last Name</th>\r\n" + "	</tr>"));
			while (rs.next())

				sb.append(("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "</tr>")
						);
			sb.append("</table>");

			con.close();
		req.setAttribute("ActorList", sb.toString());
		RequestDispatcher rd = req.getRequestDispatcher("/ServletActorList.jsp");
		  rd.forward(req, resp);
		}catch (Exception e) {
			System.out.println(e);
		}
	}
}
