<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<script src="../../../resources/js/ckeditor/ckeditor.js"></script>	
	<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
		<form method = "post" enctype="multipart/form-data" action="/study/updatePage" onsubmit="return dateCheck()">
				<input type="hidden" name="tableType" value="${tbn}">
				<input type="hidden" name="bno"value="${pageInfo.bno}">
			<div class="row"> 
				<div class="col-md-12">
				<br>
					<div class="input-group mb-3">
			    	  <span class="input-group-text">Subject</span>
			      	<input class="form-control form-control-lg" type="text" name = "title" value ='<c:out value="${pageInfo.title}"/>'>
		      		</div>	  
					<div class="row">
						<div class="col-md-6" style="font-size:15px">등록자 : ${pageInfo.writer}	|	
							<c:if test="${tbn=='edu'}">
									<strong>교육일</strong>
									<fmt:parseDate value="${pageInfo.eduStartDate}" var="eduStartDate" pattern="yyyy-MM-dd"/>
									<input type="date" id="eduStartDate" name = "eduStartDate" value ="<fmt:formatDate value="${eduStartDate}" pattern='yyyy-MM-dd'/>" required>
									<fmt:parseDate value="${pageInfo.eduEndDate}" var="eduEndDate" pattern="yyyy-MM-dd"/>
									<input type="date" id="eduEndDate" name = "eduEndDate" value ="<fmt:formatDate value="${eduEndDate}" pattern='yyyy-MM-dd'/>" required>
									<strong>등록일</strong>
									<fmt:parseDate value="${pageInfo.regStartDate}" var="regStartDate" pattern="yyyy-MM-dd"/>
									<input type="date" id="regStartDate" name = "regStartDate" value ="<fmt:formatDate value="${regStartDate}" pattern='yyyy-MM-dd'/>" required>
									<fmt:parseDate value="${pageInfo.regEndDate}" var="regEndDate" pattern="yyyy-MM-dd"/>
									<input type="date" id="regEndDate" name = "regEndDate" value ="<fmt:formatDate value="${regEndDate}" pattern='yyyy-MM-dd'/>" required>
							</c:if>
							<c:if test="${tbn!='edu'}">
									<strong>등록일</strong>
									<input name = "reg_date" readonly="readonly" value ='<fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.reg_date}"/>'>
									<strong>수정일</strong>
									<input name = "up_date" readonly="readonly" value ='<fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.up_date}"/>'>
							</c:if>
						</div>
						<div class="col-md-6">
						<div align = "right">
							<input type ="submit" class="btn btn-primary disabled" value = "Save"/>
							<input type ="submit" class="btn btn-dark disabled" value = "Cancle" onclick="history.back()"/>
						</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div>
				<textarea id="content"name = "content">${pageInfo.content}</textarea>
				<script type="text/javascript">
			      CKEDITOR.replace('content',
			    	{filebrowserUploadUrl:'/study/imageUpload',
			    	 height:'300px' 
			    	});
			    </script>
			</div>
		</form>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
<script>
function dateCheck(){
	let eduStartDate = $("#eduStartDate").val();
	let eduEndDate = $("#eduEndDate").val();
	let regStartDate = $("#regStartDate").val();
	let regEndDate = $("#regEndDate").val();
	if(eduStartDate>eduEndDate){
		alert("eduDate X");
		$("#eduStartDate").focus();
		return false;
	}
	if(regStartDate>regEndDate){
		alert("regDate X");
		$("#regStartDate").focus();
		return false;
	}	
}
</script>
</html>