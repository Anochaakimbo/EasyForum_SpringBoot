<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forum Details</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #e3f2fd;
    margin: 0;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.forum-container {
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 90%;
    max-width: 600px;
}

h1, h2, h3 {
    text-align: center;
    color: #007BFF;
}

.forum-detail {
    font-size: 18px;
    color: #444;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 5px;
    margin-bottom: 15px;
}

.forum-meta {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
}

.forum-love {
    color: #FF4500;
    font-weight: bold;
}

.forum-date {
    color: #888;
    font-size: 13px;
    text-align: right;
}

/* ปรับแต่งปุ่ม */
.action-links a, .back-link, button {
    display: inline-block;
    padding: 8px 12px;
    margin: 5px 0;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    transition: 0.3s;
}

.action-links a {
    background: #f0f0f0;
    color: #555;
}

.action-links a:hover {
    background: #ddd;
}

.back-link {
    background-color: #007BFF;
    color: white;
    text-align: center;
    margin-top: 20px;
}

.back-link:hover {
    background-color: #0056b3;
}

button {
    background: #28a745;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background: #218838;
}

/* กล่องคอมเมนต์ */
.comment-box {
    background: #ffffff;
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* ฟอร์มคอมเมนต์ */
form {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

input, textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

textarea {
    height: 80px;
}
</style>
</head>
<body>

<div class="forum-container">
    <h1>Forum Post</h1>
    
    <div class="forum-detail">${forum.detail}</div>

    <div class="forum-meta">
        <span class="forum-author">ผู้เขียน: ${forum.author}</span>
        <span class="forum-love">❤️ ${forum.love} likes</span>
    </div>
    
    <div class="forum-date">วันที่โพสต์: ${forum.date}</div>

    <div class="action-links">
        <a href="/deleteForum/${forum.id}" style="color: red;">Delete</a>
        <a href="/editForum/${forum.id}" style="color: orange;">Update</a>
    </div>
</div>

<h2>Comments</h2>

	<c:if test="${not empty comments}">
    <c:forEach items="${comments}" var="comment">
        <div class="comment-box">
            <strong>${comment.name}:</strong>
            <p>${comment.text}</p>
        </div>
    </c:forEach>
</c:if>
<c:if test="${empty comments}">
    <p>No comments yet.</p>
</c:if>

<h3>Add a Comment</h3>
<form action="/addComment/${forum.id}" method="post">
    <label>Name:</label>
    <input type="text" name="name" required>
    
    <label>Comment:</label>
    <textarea name="text" required></textarea>
    
    <button type="submit">Submit</button>
</form>

<a href="/forum" class="back-link">⬅️ กลับไปยังรายการทั้งหมด</a>

</body>
</html>
