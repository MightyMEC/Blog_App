<!DOCTYPE html>
<html>
<head>
    <title>Post Detail</title>
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
        .post-container {
            background: #2a2a72; /* Darker background */
            padding: 30px;
            width: 600px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            color: #fff;
        }
        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #fff;
        }
        p {
            font-size: 18px;
            line-height: 1.8;
            color: #ccc;
        }
        img {
            display: block;
            margin: 20px auto;
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
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
