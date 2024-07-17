package BlogApp;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@WebServlet("/createPost")
@MultipartConfig
public class CreatePostServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        // Get the absolute path of the web application
        String applicationPath = getServletContext().getRealPath("");
        // Construct the directory path to save the file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIRECTORY;

        // Create the directory if it does not exist
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Store blog post in the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO posts (title, content, file_name) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setString(3, fileName);
            stmt.executeUpdate();

            // Save the file on the server
            filePart.write(uploadFilePath + File.separator + fileName);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("/MiniProject/adminDashboard");
    }
}
