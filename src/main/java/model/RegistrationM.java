package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class RegistrationM {

	Connection con;
	HttpSession ssn;

	public RegistrationM(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagnemt", "root", "simmy");
			ssn = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String Registration(String name, String phone, String email, String pwd) {
		String status = "";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select * from Events where Phone_Number='" + phone + "' or email='" + email + "';");
			boolean b = rs.next();
			if (b) {
				status = "existed";
			} else {
				PreparedStatement ps = con.prepareStatement("insert into Events values(0,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, email);
				ps.setString(4, pwd);
				int a = ps.executeUpdate();
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String login(String mail, String pass) {
		String name = "", emails = "";
		String status = "", id = "";

		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();

			rs = st.executeQuery("select * from Events where Email='" + mail + "' and Password='" + pass + "';");
			boolean b = rs.next();
			if (b == true) {
				id = rs.getString("UserId");
				name = rs.getString("Username");
				emails = rs.getString("Email");
				ssn.setAttribute("uname", name);
				ssn.setAttribute("email", emails);
				ssn.setAttribute("id", id);
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public String ForgotPassword(String mail, String pw) {
		String status = "";
		try {
			Statement st = con.createStatement();
			int rspw = st.executeUpdate("update Events set Password='" + pw + "' where Email='" + mail + "';");
			if (rspw > 0)
				status = "success";
			else
				status = "failure";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String update(String name, String pno, String email) {
		String status = "";
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			st.executeUpdate("update events set Username='" + name + "',Phone_Number='" + pno + "',Email='" + email
					+ "' where UserId= '" + ssn.getAttribute("id") + "' ");
			ssn.setAttribute("uname", name);
			status = "success";
		} catch (Exception e) {
			status = "failure";
			e.printStackTrace();
		}

		return status;
	}

	public User getInfo() {
		Statement st = null;
		ResultSet rs = null;
		User s = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from Events where UserId= '" + ssn.getAttribute("id") + "'");
			boolean b = rs.next();
			if (b == true) {
				s = new User();
				s.setName(rs.getString("Username"));
				s.setphone(rs.getString("Phone_Number"));
				s.setemail(rs.getString("Email"));
			} else {
				s = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return s;
	}

	public String delete(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from Events where UserId='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public ArrayList<User> getUserDetails() {
		Statement st;
		ResultSet rs;
		ArrayList<User> al = new ArrayList<User>();
		try {
			st = con.createStatement();
			String qry = "select *,date_format(date,'%b %d, %Y') as Date from Events where UserId not in(1);";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User p = new User();
				p.setId(rs.getString("UserId"));
				p.setName(rs.getString("Username"));
				p.setemail(rs.getString("Email"));
				p.setphone(rs.getString("Phone_Number"));
				p.setdate(rs.getString("Date"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<User> getUserinfo(String id) {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<User> al = new ArrayList<User>();
		try {
			st = con.createStatement();
			String qry = "select * from Events where UserId = '" + id + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User p = new User();
				p.setId(rs.getString("UserId"));
				p.setName(rs.getString("Username"));
				p.setemail(rs.getString("Email"));
				p.setphone(rs.getString("Phone_Number"));
				p.setdate(rs.getString("Date"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	
	public ArrayList<Themes> getThemeInfo(String category) {
	    ArrayList<Themes> al = new ArrayList<Themes>();
	    Statement st = null;
	    ResultSet rs = null;

	    try {
	        st = con.createStatement();
	        String qry = "SELECT * FROM Event_Themes WHERE theme_category = '" + category + "';";
	        rs = st.executeQuery(qry);

	        while (rs.next()) {
	            Themes t = new Themes();
	            t.setT_id(rs.getString("theme_id"));
	            t.setT_img(rs.getString("theme_img"));
	            t.setT_name(rs.getString("theme_name"));
	            t.setT_cost(rs.getString("theme_cost"));
	            t.setT_info(rs.getString("theme_desc"));
	            al.add(t);
	        }

	        if (al.isEmpty()) {
	            System.out.println("No themes found for category: " + category);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return al;
	}

	
	public boolean bookTheme(String themeId, String customerName, String customerEmail) {
        boolean bookingSuccess = false;
        PreparedStatement preparedStatement = null;

        try {
            // Assuming you have a method in RegistrationM for handling bookings
            String insertQuery = "INSERT INTO Bookings (theme_id, customer_name, customer_email, booking_date) VALUES (?, ?, ?, NOW())";
            preparedStatement = con.prepareStatement(insertQuery);

            preparedStatement.setString(1, themeId);
            preparedStatement.setString(2, customerName);
            preparedStatement.setString(3, customerEmail);

            // Execute the insert statement
            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the booking was successful
            bookingSuccess = (rowsAffected > 0);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions or log errors
        } finally {
            // Close database resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return bookingSuccess;
    }

}
