<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff9966, #ff5e62); /* Gradient background */
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .actions {
            text-align: center;
        }
        .actions a {
            text-decoration: none;
            color: #007bff;
            margin: 0 5px;
            transition: color 0.3s ease;
        }
        .actions a:hover {
            color: #0056b3;
        }
        .no-posts {
            text-align: center;
            margin-top: 20px;
            font-style: italic;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <a href="createPost.jsp" style="text-decoration: none; color: #fff; background-color: #007bff; padding: 10px 20px; border-radius: 5px; display: inline-block;">Create New Post</a>
        <h2>All Posts</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>File</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="post" items="${posts}">
                <tr>
                    <td>${post.id}</td>
                    <td>${post.title}</td>
                    <td>${post.content}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty post.fileName}">
                                <a href="path/to/uploads/${post.fileName}" style="text-decoration: none; color: #333;">${post.fileName}</a>
                            </c:when>
                            <c:otherwise>
                                No File
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="actions">
                        <a href="editPost?id=${post.id}" style="text-decoration: none;">Edit</a> |
                        <a href="deletePost?id=${post.id}" onclick="return confirm('Are you sure you want to delete this post?')" style="text-decoration: none; color: #dc3545;">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${empty posts}">
            <p class="no-posts">No posts available.</p>
        </c:if>
    </div>
</body>
</html>
