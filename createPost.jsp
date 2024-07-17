<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Post</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #4e54c8, #8f94fb); /* New gradient background */
    margin: 0;
    padding: 0;
    color: #fff;
}

.container {
    width: 60%;
    margin: 40px auto;
    background-color: #2a2a72; /* Darker background */
    padding: 30px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
}

h2 {
    margin-bottom: 30px;
    text-align: center;
    color: #fff;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 10px;
    color: #ddd;
}

input[type="text"], textarea, input[type="file"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #444;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
    background-color: #fff;
    color: #333;
}

input[type="text"]:focus, textarea:focus, input[type="file"]:focus {
    border-color: #4e54c8;
    outline: none;
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
</style>
</head>
<body>
    <div class="container">
        <h2>Create a New Post</h2>
        <form action="${pageContext.request.contextPath}/createPost" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" required><br>
            <br>
            <label for="content">Content:</label>
            <textarea name="content" id="content" rows="5" required></textarea>
            <br>
            <br>
            <label for="file">Upload Image/Video:</label>
            <input type="file" name="file" id="file" required><br>
            <br>
            <input type="submit" value="Create Post">
        </form>
    </div>
</body>
</html>
