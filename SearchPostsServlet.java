// src/main/java/SearchPostsServlet.java
package BlogApp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet("/searchPosts")
public class SearchPostsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        // Search blog posts in the database
        List<BlogPost> posts = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM posts WHERE title LIKE ? OR content LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + query + "%");
            stmt.setString(2, "%" + query + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                BlogPost post = new BlogPost(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getString("file_name"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("posts", posts);
        request.getRequestDispatcher("viewerDashboard.jsp").forward(request, response);
    }
}
