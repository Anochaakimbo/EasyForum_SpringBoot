<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forum Page</title>
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

.container {
	width: 80%;
	max-width: 800px;
	background: #fff;
	padding: 20px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

h1 {
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
	color: #333;
	text-align: center;
}

form {
	margin-bottom: 20px;
	display: flex;
	justify-content: center;
	gap: 10px;
}

input[type="text"] {
	flex-grow: 1;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

p {
	padding: 10px;
	background: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 10px;
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

.new-post-form {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>What do you think?</h1>

		<form action="/searchForum" method="GET">
			<input type="text" id="keyword" name="keyword"
				placeholder="Search forums..."> <input type="submit"
				value="Search">
		</form>

		<c:if test="${param.keyword != null}">
			<p>
				ผลการค้นหาสำหรับ: "${param.keyword}" (${allForums.size()} รายการ) <a
					href="/forum">แสดงทั้งหมด</a>
			</p>
		</c:if>

		<c:forEach items="${allForums}" var="m">
			<p>
				<a href="/forumDetail/${m.id}"><strong>${m.detail}</strong></a><br>
				<span>❤️ ${m.love} | ✍️ ${m.author} | 📅 <fmt:formatDate
						value="${m.date}" pattern="MMMM d yyyy, h:mm a" />
				</span><br> <span>💬 ${commentCountMap[m.id] != null ? commentCountMap[m.id] : 0}
					Comments</span><br>
			<div class="action-links">
				<a href="/loveAdd/${m.id}">Love</a>
			</div>
			</p>
		</c:forEach>



		<form action="/insertForum" method="GET" class="new-post-form">
			<input type="text" id="detail" name="detail"
				placeholder="What on your mind"><br> <input type="text"
				id="author" name="author" placeholder="Writer"><br> <input
				type="submit" value="Submit">
		</form>
	</div>
</body>
</html>
