package com.harsh.pandit.CustomerData;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ServletAddressAdd")
public class AddressMangementServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String city_id = req.getParameter("city_id");
		String district = req.getParameter("district");
		String postal_Code = req.getParameter("postal_Code");
		String phone = req.getParameter("phone");

		OutputStream out = resp.getOutputStream();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
			String i = "insert into address(address,address2,district,city_id,postal_Code,phone) values (?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(i);
			statement.setString(1, address);
			statement.setString(2, address2);
			statement.setString(3, district);
			statement.setInt(4, Integer.parseInt(city_id));
			statement.setInt(5, Integer.parseInt(postal_Code));
			statement.setLong(6,Long.parseLong(phone));
			statement.execute();

			PreparedStatement ps = con
					.prepareStatement("select address,address2,district,city_id,postal_Code,phone from address");
			ResultSet rs = ps.executeQuery();
			out.write("<h2>Address LIST:</h2>".getBytes());
			out.write(("<table border='1'>\r\n" + "	<tr>\r\n" + "		<th>address</th>\r\n"
					+ "			<th>Address</th>\r\n" + "			<th>District</th>\r\n"
					+ "			<th>City id</th>\r\n" + "			<th>postal code</th>\r\n"
					+ "			<th>phone</th>\r\n" + "	</tr>").getBytes());
			while (rs.next()) {
				out.write(("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>"
						+ rs.getString(3) + "</td>" + "<td>" + rs.getInt(4) + "</td>" + "<td>" + rs.getInt(5) + "</td>"
						+ "<td>" + rs.getLong(6) + "</td>" + "</tr>").getBytes());
			}
			out.write("</table>".getBytes());

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
