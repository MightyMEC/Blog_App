<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
    <style>
        body {
            background: linear-gradient(to right, #4e54c8, #8f94fb); /* New gradient background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 70%;
            margin: auto;
            padding: 20px;
            background: #2a2a72; /* Darker background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #fff;
        }
        form {
            max-width: 600px;
            margin: auto;
            background: #fff; /* Light background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4e54c8; /* Button background */
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #2a2a72; /* Button hover background */
        }
        a {
            text-decoration: none;
            color: #4e54c8; /* New link color */
            display: inline-block;
            margin-top: 20px;
        }
        a:hover {
            color: #2a2a72; /* Darker color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Post</h1>
        <form action="updatePost" method="post">
            <input type="hidden" name="postId" value="${post.id}">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${post.title}" required>
            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="5" required>${post.content}</textarea>
            <input type="submit" value="Update Post">
        </form>
        <a href="adminDashboard">Cancel</a>
    </div>
</body>
</html>
