package BlogApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/editPost")
public class EditPostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        BlogPost post = getPostById(postId);

        if (post != null) {
            request.setAttribute("post", post);
            request.getRequestDispatcher("editPost.jsp").forward(request, response);
        } else {
            response.sendRedirect("adminDashboard.jsp"); // Redirect to dashboard if post not found
        }
    }

    private BlogPost getPostById(int id) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM posts WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new BlogPost(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getString("file_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
