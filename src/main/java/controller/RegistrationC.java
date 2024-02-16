package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.RegistrationM;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "registration", urlPatterns = { "/registration" })

public class RegistrationC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");// type of the response sent to the client or browser
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		RegistrationM reg = new RegistrationM(session);
		try {
			if (request.getParameter("submit") != null) { // submit, is the value of the name field in the jsp page

				String name = request.getParameter("username");// these are the name attribute in jsp page
				String phone = request.getParameter("phone");
				String email = request.getParameter("mailId");
				String pw = request.getParameter("password");
				String cp = request.getParameter("conPass");

				if (pw.equals(cp)) {
					String status = reg.Registration(name, phone, email, pw);

					if (status.equals("existed")) {

						request.setAttribute("status", "Existed record");
						RequestDispatcher rd = request.getRequestDispatcher("RegistrationForm.jsp");
						rd.forward(request, response);

					} else if (status.equals("success")) {

						request.setAttribute("status", "Registered Successfully");
						RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp");
						rd.forward(request, response);

					} else if (status.equals("failure")) {

						request.setAttribute("status", "Registration failed");
						RequestDispatcher rd = request.getRequestDispatcher("RegistrationForm.jsp");
						rd.forward(request, response);

					}
				} else {
					request.setAttribute("status", "Password mismatch");
					RequestDispatcher rd = request.getRequestDispatcher("RegistrationForm.jsp");
					rd.forward(request, response);
				}
			} else if (request.getParameter("login") != null) {
				String mail = request.getParameter("mailId");
				String pass = request.getParameter("password");
				String status = reg.login(mail, pass);
				if (status.equals("success")) {

					request.setAttribute("status", "Login Successful");
					RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
					rd.forward(request, response);

				} else if (status.equals("failure")) {

					request.setAttribute("status", "Login Failed");
					RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp");
					rd.forward(request, response);
				}
			} else if (request.getParameter("reset") != null) {
				String mail = request.getParameter("mailId");
				String pw = request.getParameter("password");
				String cp = request.getParameter("conPass");
				if (pw.equals(cp)) {
					String status = reg.ForgotPassword(mail, pw);
					if (status.equals("success")) {
						request.setAttribute("status", "Password Reset Successfully");
						RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp");
						rd.forward(request, response);
					} else if (status.equals("failure")) {
						request.setAttribute("status", "Password Reset Failed");
						RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
						rd.forward(request, response);
					}
				} 
				else {
					request.setAttribute("status", "Password mismatch");
					RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
					rd.forward(request, response);
				}
			} else if (request.getParameter("Signout") != null) {
				session.invalidate();
				response.sendRedirect("RegistrationForm.jsp");
			} else if (session.getAttribute("uname") != null && request.getParameter("update") != null) {
				String name = request.getParameter("username");
				String pno = request.getParameter("phone");
				String email = request.getParameter("mailId");
				RegistrationM u = new RegistrationM(session);
				String status = u.update(name, pno, email);
				if (status.equals("success")) {
					request.setAttribute("status", "Profile successfully Updated");
					RequestDispatcher rd1 = request.getRequestDispatcher("MyAccount.jsp");
					rd1.forward(request, response);
				} else {
					request.setAttribute("status", "Updation failure");
					RequestDispatcher rd1 = request.getRequestDispatcher("MyAccount.jsp");
					rd1.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
