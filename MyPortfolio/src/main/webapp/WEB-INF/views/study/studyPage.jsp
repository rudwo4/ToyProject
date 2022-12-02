<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<script src="../../../resources/js/ckeditor/ckeditor.js"></script>	
	<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
	  <main>  
	  <%@ include file="../common/snb_title.jsp" %>
		<article>
			<form method = "post" enctype="multipart/form-data">
					<input type="hidden" name="tableType" value="${tbn}">
					<input type="hidden" name="bno"value="${pageInfo.bno}">
				<div>
					<p class="text-primary" style="font-size:30px">${pageInfo.title}</p>
					<br>
					<div class="row">
						<div class="col-md-8" style="font-size:20px">
							<c:if test="${tbn!='edu'}">
							등록자 : ${pageInfo.writer}	|	등록일시 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.reg_date}"/>
							</c:if>
							<c:if test="${tbn=='edu'}">
							<fmt:parseDate value="${pageInfo.eduStartDate}" var="eduStartDate" pattern="yyyy-MM-dd"/>
							<fmt:parseDate value="${pageInfo.eduEndDate}" var="eduEndDate" pattern="yyyy-MM-dd"/>
							<fmt:parseDate value="${pageInfo.regStartDate}" var="regStartDate" pattern="yyyy-MM-dd"/>
							<fmt:parseDate value="${pageInfo.regEndDate}" var="regEndDate" pattern="yyyy-MM-dd"/>
							등록자 : ${pageInfo.writer}	|	등록 일시 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${eduStartDate}"/>~<fmt:formatDate pattern = "yyyy/MM/dd" value="${eduEndDate}"/>	|	교육 일시 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${regStartDate}"/>~<fmt:formatDate pattern = "yyyy/MM/dd" value="${regEndDate}"/>
							</c:if>
						</div>
						<div class="col-md-4">
						<div align = "right">
							<input type ="submit" class="btn btn-primary disabled"value = "modify" onclick="javascript: form.action= '/study/studyUpdatePage'"/>
							<input type ="submit" class="btn btn-dark disabled"value = "delete" onclick="javascript: form.action= '/study/deletePage'"/>
						</div>
						</div>
					</div>
				</div>
				<hr>
				<div>
					<div>${pageInfo.content}</div>
				</div>
				<hr>
				<div id ="write">
					<button type="button" class="btn btn-dark disabled" onclick="history.back()">go to list</button>
				</div>
				<hr>
			</form>
	 	</article>
	  </main>	
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
</html>