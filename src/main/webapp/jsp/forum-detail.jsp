<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forum Details</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.forum-container {
	background: #fff;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 600px;
}

h1 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
	text-align: center;
}

.forum-detail {
	font-size: 18px;
	line-height: 1.6;
	color: #444;
	padding: 15px;
	border-bottom: 1px solid #ddd;
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

.forum-author {
	font-style: italic;
	color: #555;
}

.forum-date {
	color: #888;
	font-size: 13px;
	text-align: right;
}

.back-link {
	display: block;
	text-align: center;
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #007BFF;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: 0.3s ease;
}

.back-link:hover {
	background-color: #0056b3;
}
a {
	text-decoration: none;
	color: #007BFF;
	margin-right: 10px;
}

a:hover {
	text-decoration: underline;
}

.action-links a {
	padding: 5px 10px;
	border-radius: 5px;
	background: #f0f0f0;
	color: #555;
	margin-right: 5px;
}

.action-links a:hover {
	background: #ddd;
}

</style>
</head>
<body>
	<div class="forum-container">
		<h1>Forum Post</h1>

		<div class="forum-detail">${forum.detail}</div>

		<div class="forum-meta">
			<span class="forum-author">ผู้เขียน: ${forum.author}</span> <span
				class="forum-love">❤️ ${forum.love} likes</span> 
				<a href="/deleteForum/${forum.id}" style="color: red;">Delete</a> 
				<a href="/editForum/${forum.id}" style="color: orange;">Update</a>
		</div>

		<div class="forum-date">วันที่โพสต์: ${forum.date}</div>
	</div>


	<a href="/forum" class="back-link">⬅️ กลับไปยังรายการทั้งหมด</a>
</body>
</html>