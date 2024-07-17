<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #4e54c8, #8f94fb); /* New gradient background */
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #2a2a72; /* Darker background */
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h1, h2 {
            color: #fff;
            text-align: center;
        }
        h1 {
            margin-bottom: 10px;
        }
        h2 {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            color: #333;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #5052c8; /* New header background */
            color: #fff;
        }
        .actions {
            text-align: center;
        }
        .actions a {
            text-decoration: none;
            color: #4e54c8; /* New link color */
            margin: 0 5px;
            transition: color 0.3s ease;
        }
        .actions a:hover {
            color: #2a2a72; /* Darker color on hover */
        }
        .no-posts {
            text-align: center;
            margin-top: 20px;
            font-style: italic;
            color: #bbb;
        }
        .btn-create {
            display: block;
            width: fit-content;
            margin: 10px auto;
            padding: 10px 20px;
            background-color: #4e54c8; /* Button background */
            color: #fff;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn-create:hover {
            background-color: #2a2a72; /* Button hover background */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <a href="createPost.jsp" class="btn-create">Create New Post</a>
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
                                <a href="path/to/uploads/${post.fileName}" style="text-decoration: none; color: #4e54c8;">${post.fileName}</a>
                            </c:when>
                            <c:otherwise>
                                No File
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="actions">
                        <a href="editPost?id=${post.id}">Edit</a> |
                        <a href="deletePost?id=${post.id}" onclick="return confirm('Are you sure you want to delete this post?')" style="color: #ff4d4d;">Delete</a>
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
