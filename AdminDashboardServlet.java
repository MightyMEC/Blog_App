package BlogApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<BlogPost> posts = new ArrayList<>();
	    try (Connection conn = DatabaseConnection.getConnection()) {
	        String sql = "SELECT * FROM posts";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            BlogPost post = new BlogPost(
	                rs.getInt("id"),
	                rs.getString("title"),
	                rs.getString("content"),
	                rs.getString("file_name")
	            );
	            posts.add(post);
	            System.out.println("Post retrieved: " + post.getTitle()); // Debugging line
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    System.out.println("Number of posts retrieved: " + posts.size()); // Debugging line
	    request.setAttribute("posts", posts);
	    request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
	}
}