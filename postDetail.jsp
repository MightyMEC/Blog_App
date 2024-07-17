<!DOCTYPE html>
<html>
<head>
    <title>Post Detail</title>
    <style>
        body {
            background: linear-gradient(to right, #ff9966, #ff5e62);
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .post-container {
            background: #fff;
            padding: 20px;
            width: 600px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
        }
        img {
            display: block;
            margin: 20px auto;
            max-width: 100%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="post-container">
        <h1><%= request.getAttribute("title") %></h1>
        <p><%= request.getAttribute("content") %></p>
        <% if (request.getAttribute("fileName") != null) { %>
            <img src="/uploads/<%= request.getAttribute("fileName") %>" alt="Post Image">
        <% } %>
    </div>
</body>
</html>
