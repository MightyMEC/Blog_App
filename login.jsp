<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background: linear-gradient(to right, #4e54c8, #8f94fb); /* New gradient background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form {
            background: #2a2a72;
            padding: 30px;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #fff;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #ddd;
            font-weight: bold;
        }
        input[type="email"], input[type="password"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="email"], input[type="password"] {
            background-color: #fff;
            color: #333;
            border: 1px solid #444;
        }
        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #4e54c8;
            outline: none;
        }
        input[type="submit"] {
            background-color: #4e54c8; 
            color: white;
            padding: 15px 25px;
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
    <form action="login" method="post">
        <h1>Login</h1>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
