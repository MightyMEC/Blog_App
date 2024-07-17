package BlogApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/updatePost")
public class UpdatePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE posts SET title = ?, content = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, postId);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("adminDashboard");
            } else {
                response.getWriter().println("Failed to update post with ID " + postId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Failed to update post with ID " + postId + ". SQLException: " + e.getMessage());
        }
    }
}
