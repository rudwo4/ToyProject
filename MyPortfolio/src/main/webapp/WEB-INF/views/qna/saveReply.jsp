<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<div>
	<table>
		<c:forEach items="${reply}" var="reply">
			<tr>
				<td width="40%"><p>${reply.writer}(<fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${reply.reg_date}"/>)</p></td>
				<td width="0%"></td>
				<td width="60%" id="write">
					<c:if test="${reply.writer==loginId}">
						<button onclick="deleteReply(${reply.replybno})">X</button>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="3">${reply.content}</td>
			</tr>
		</c:forEach>
	</table>	
</div>
</body>
</html>