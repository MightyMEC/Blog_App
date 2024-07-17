<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Post</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #ff9966, #ff5e62);;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

h2 {
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

input[type="text"], textarea, input[type="file"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
	font-size: 14px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Create a New Post</h2>
		<form action="${pageContext.request.contextPath}/createPost"
			method="post" enctype="multipart/form-data">
			<label for="title">Title:</label> <input type="text" name="title"
				id="title" required><br>
			<br> <label for="content">Content:</label>
			<textarea name="content" id="content" rows="5" required></textarea>
			<br>
			<br> <label for="file">Upload Image/Video:</label> <input
				type="file" name="file" id="file" required><br>
			<br> <input type="submit" value="Create Post">
		</form>
	</div>
</body>
</html>
