<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>enroll Board</h1>
<form action="/board/enroll" method ="post">
	<div class = "input_wrap">
		<label>Title</label>
		<input name = "title">
	</div>
	<div class = "input_wrap">
		<label>Content</label>
		<textarea rows="3" name = "content"></textarea>
	</div>
	<div class = "input_wrap">
		<label>Writer</label>
		<input name = "writer">
	</div>
	<button class = "btn">submit</button>
</form>
</body>
</html>