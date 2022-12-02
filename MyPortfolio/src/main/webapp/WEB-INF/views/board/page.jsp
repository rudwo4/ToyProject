<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>list page</h1>
	<form method = "post">
		<div>
			<label>bno</lael>
			<input name = "bno" readonly="readonly" value ='<c:out value="${pageInfo.bno}"/>'>
		</div>
		<div>
			<label>title</label>
			<input name = "title" value ='<c:out value="${pageInfo.title}"/>'>
		</div>
		<div>
			<label>content</label>
			<input name = "content" value ='<c:out value="${pageInfo.content}"/>'>
		</div>
		<div>	
			<label>writer</label>
			<input name = "writer" readonly="readonly" value ='<c:out value="${pageInfo.writer}"/>'>
		</div>
		<div>
			<label>reg_date</label>
			<input name = "reg_date" readonly="readonly" value ='<fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.reg_date}"/>'>
		</div>	
		<div>	
			<label>up_date</label>
			<input name = "up_date" readonly="readonly" value ='<fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.up_date}"/>'>
		</div>
		<div>
			<button type="button" onclick="history.back()">go to list</button>
			<input type ="submit" value = "modify" onclick="javascript: form.action= '/board/updatePage'"/>
			<input type ="submit" value = "delete" onclick="javascript: form.action= '/board/deletePage'"/>
		</div>
	</form>
</body>
</html>