<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Forum Post</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 320px;
            text-align: center;
        }

        h1 {
            color: #333;
            border-bottom: 2px solid #007BFF;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #FF4500;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        a:hover {
            background-color: #cc3700;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Forum Post</h1>

        <form action="/updateForum" method="POST">
            <input type="hidden" id="id" name="id" value="${forum.id}">
            <input type="text" id="detail" name="detail" value="${forum.detail}" placeholder="What on your mind">
            <input type="text" id="author" name="author" value="${forum.author}" placeholder="Writer">
            <input type="submit" value="Update">
        </form>

        <a href="/forumDetail/${forum.id}">Cancel</a>
    </div>
</body>
</html>