<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
	<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
		<main>  
	 	<%@ include file="../common/snb_title.jsp" %>
		  <article>
			<form method = "post">
					<input type="hidden" name="tableType" value="${tbn}">
					<input type="hidden" name="bno"value="${pageInfo.bno}">
				<div>
					<p class="text-primary" style="font-size:30px">${pageInfo.title}</p>
					<br>
					<div class="row">
						<div class="col-md-8" style="font-size:20px">등록자 : ${pageInfo.writer}	|	등록일시 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.reg_date}"/>
							|	진행 상태 : 
							<c:choose>
								<c:when test="${pageInfo.status eq 'register'}"><span class="badge bg-success" style="color:white">Register</span></c:when>
								<c:when test="${pageInfo.status eq 'develop'}"><span class="badge bg-info" style="color:white">Develop</span></c:when>
								<c:when test="${pageInfo.status eq 'test'}"><span class="badge bg-warning" style="color:white">Test</span></c:when>
								<c:when test="${pageInfo.status eq 'golive'}"><span class="badge bg-primary" style="color:white">Go-Live</span></c:when>
							</c:choose>
						</div>		
						<div class="col-md-4">
						<div align = "right">
							<input type ="submit" class="btn btn-primary disabled" value = "modify" onclick="javascript: form.action= '/task/taskUpdatePage'"/>
							<input type ="submit" class="btn btn-dark disabled" value = "delete" onclick="javascript: form.action= '/task/deletePage'"/>
						</div>
						</div>
					</div>
				</div>
				<hr>
				<div>
					<div>${pageInfo.content}</div>
				</div>
				<hr>
				<div id="write">
					<button type="button" class="btn btn-dark disabled" onclick="history.back()">go to list</button>
				</div>
			</form>
		 </article>
	  </main>	
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
</html>