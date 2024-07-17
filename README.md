# Blog Application

This is a simple blog application built using Java Servlets and JSP. The application supports basic CRUD operations for blog posts and includes user roles such as Admin and Viewer.

## Project Structure

BlogApp/
├── src/
│ ├── main/
│ │ ├── java/
│ │ │ └── BlogApp/
│ │ │ ├── AdminDashboardServlet.java
│ │ │ ├── BlogPost.java
│ │ │ ├── CreatePostServlet.java
│ │ │ ├── DatabaseConnection.java
│ │ │ ├── DeletePostServlet.java
│ │ │ ├── EditPostServlet.java
│ │ │ ├── LoginServlet.java
│ │ │ ├── RegisterServlet.java
│ │ │ ├── UpdatePostServlet.java
│ │ │ └── ViewerDashboardServlet.java
│ │ ├── resources/
│ │ └── webapp/
│ │ ├── createPost.jsp
│ │ ├── editPost.jsp
│ │ ├── login.jsp
│ │ ├── postDetail.jsp
│ │ ├── register.jsp
│ │ ├── viewerDashboard.jsp
│ │ ├── adminDashboard.jsp
│ │ └── WEB-INF/
│ │ └── web.xml
└── pom.xml

css
Copy code

## Requirements

- JDK 8 or higher
- Apache Tomcat 9 or higher
- Maven 3.6 or higher
- MySQL database

## Setup

1. **Clone the Repository**
    ```bash
    git clone https://github.com/MahendraJuvvalapati/BlogApp.git
    cd BlogApp
    ```

2. **Configure the Database**
    - Create a MySQL database named `blogapp`.
    - Execute the following SQL script to create the necessary tables:
      ```sql
      CREATE TABLE users (
          id INT AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(50),
          email VARCHAR(50),
          password VARCHAR(50),
          role VARCHAR(10)
      );

      CREATE TABLE posts (
          id INT AUTO_INCREMENT PRIMARY KEY,
          title VARCHAR(100),
          content TEXT,
          file_name VARCHAR(100)
      );
      ```

3. **Update Database Configuration**
    - Update the `DatabaseConnection.java` file with your MySQL database credentials:
      ```java
      private static final String URL = "jdbc:mysql://localhost:3306/blogapp";
      private static final String USERNAME = "yourusername";
      private static final String PASSWORD = "yourpassword";
      ```

4. **Build the Project**
    ```bash
    mvn clean install
    ```

5. **Deploy to Tomcat**
    - Copy the generated WAR file from the `target` directory to the Tomcat `webapps` directory.
    - Start the Tomcat server.

## Usage

### Accessing the Application

- Open your browser and navigate to `http://localhost:8080/BlogApp/`

### Admin Dashboard

- URL: `http://localhost:8080/BlogApp/adminDashboard`
- Allows the admin to create, edit, and delete blog posts.

### Viewer Dashboard

- URL: `http://localhost:8080/BlogApp/viewerDashboard`
- Allows viewers to view and search for blog posts.

### Login

- URL: `http://localhost:8080/BlogApp/login.jsp`
- Users can log in with their email and password.

### Register

- URL: `http://localhost:8080/BlogApp/register.jsp`
- New users can register by providing their name, email, password, and role (Admin or Viewer).

## JSP Pages Styling

All JSP pages use a gradient background and have a consistent modern look. Below is the CSS styling used across the pages:

```css
body {
    background: linear-gradient(to right, #ff9966, #ff5e62);
    font-family: Arial, sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

h1, h2 {
    margin-top: 30px;
}

form {
    margin-top: 20px;
}

input[type="text"], input[type="email"], input[type="password"], input[type="submit"], textarea, select {
    padding: 10px;
    margin: 10px;
    border: none;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

table {
    width: 80%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

td {
    background-color: #fff;
}

a {
    text-decoration: none;
    color: #007bff;
}

a:hover {
    text-decoration: underline;
}
