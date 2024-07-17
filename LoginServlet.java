// src/main/java/LoginServlet.java
package BlogApp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

//@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Authenticate user
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (BCrypt.checkpw(password, hashedPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", email);
                    session.setAttribute("role", rs.getString("role"));
                    if ("Admin".equals(rs.getString("role"))) {
                        response.sendRedirect("/MiniProject/adminDashboard");
                    } else {
                        response.sendRedirect("viewerDashboard.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp?error=Invalid%20password");
                }
            } else {
                response.sendRedirect("login.jsp?error=User%20not%20found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
