<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${updateInfo == 1}">
	<script type = "text/javascript">
		alert("modify Success");
		window.location="/qna/${tbn}";
	</script>
	<h1>${tbn}/ 123</h1>
</c:if>
<c:if test="${updateInfo!=1}">
	<script type = "text/javascript">
		alert("modify Fail");
		window.location="history.back()";
	</script>
</c:if>
</body>
</html>