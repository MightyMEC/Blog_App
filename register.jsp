<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            background: linear-gradient(to right, #4e54c8, #8f94fb); 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background: #2a2a72; 
            padding: 40px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            color: #fff;
        }
        h1 {
            margin-bottom: 30px;
            color: #fff;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #ddd;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #fff;
            color: #333;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            border: 2px solid #4e54c8;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #4e54c8; 
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #2a2a72; 
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>Register</h1>
        <form action="register" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="Admin">Admin</option>
                <option value="Viewer">Viewer</option>
            </select><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
