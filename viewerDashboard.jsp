<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Viewer Dashboard</title>
    <style>
        body {
            background: linear-gradient(to right, #4e54c8, #8f94fb); 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        h1 {
            margin-top: 50px;
            color: #fff;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"],
        input[type="submit"] {
            padding: 12px;
            margin-right: 10px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="text"] {
            width: 250px;
            background-color: #f9f9f9;
            color: #333;
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
        h2 {
            margin-top: 30px;
            color: #fff;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            color: #333;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
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
        .empty-message {
            margin-top: 20px;
            color: #ccc;
        }
    </style>
</head>
<body>
    <h1>Viewer Dashboard</h1>
    <form action="searchPosts" method="get">
        <input type="text" name="query" placeholder="Search posts">
        <input type="submit" value="Search">
    </form>
    <h2>All Posts</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>File</th>
        </tr>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td>${post.id}</td>
                <td>${post.title}</td>
                <td>${post.content}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty post.fileName}">
                            <a href="path/to/uploads/${post.fileName}">${post.fileName}</a>
                        </c:when>
                        <c:otherwise>
                            No File
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${empty posts}">
        <p class="empty-message">No posts available.</p>
    </c:if>
</body>
</html>
