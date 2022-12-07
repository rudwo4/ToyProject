<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<body>
<table class="table table-hover">
	<tbody>
		<tr class="table-light">
			<td><Strong>Name</Strong></td><td>${user.username}</td>
		</tr>
		<tr class="table-dark">
			<td><Strong>birth</Strong></td>
			<td id="birth">
				<fmt:parseDate value="${user.birth}" var="birth" pattern="yyyy-MM-dd"/>
				<fmt:formatDate pattern = "yyyy/MM/dd" value="${birth}"/>
			</td>
		</tr>
	    <tr class="table-light">	
	    	<td><Strong>ID</Strong></td><td id="id">${user.id}</td>
		</tr>
	    <tr class="table-dark">	
	    	<td><Strong>Email</Strong></td><td id="email">${user.email}</td>
	    </tr>
		<tr class="table-light">	
	    	<td><Strong>PhoneNumber</Strong></td><td id="phone">${user.phoneNumber}</td>
		</tr>
	</tbody>
</table>
<!--  footer -->
<!-- end footer -->
</body>
</html>