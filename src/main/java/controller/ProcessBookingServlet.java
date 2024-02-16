package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/processBooking")
public class ProcessBookingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String themeName = request.getParameter("themeName");
        String themeCost = request.getParameter("themeCost");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Error loading MySQL JDBC driver");
        }
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EventManagement", "root", "simmy")) {
            String sql = "INSERT INTO Bookings (customer_name, email, mobile, address, city, pincode) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, customerName);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, mobile);
                preparedStatement.setString(4, address);
                preparedStatement.setString(5, city);
                preparedStatement.setString(6, pincode);

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("confirmation.jsp");
                } else {
                    response.sendRedirect("error.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}