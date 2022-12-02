<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<script src="../../../resources/js/ckeditor/ckeditor.js"></script>
<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
      <form action="/study/studyEnroll?tbn=${tbn}" method ="post">
		<div class="row"> 
				<div class="col-md-12">
				<br>
					<div class="input-group mb-3">
			    	  <span class="input-group-text">Subject</span>
			      	<input class="form-control form-control-lg" type="text" name = "title" value ='<c:out value="${pageInfo.title}"/>'>
		      		</div>	  
					<div class="row">
						<div class="col-md-6" style="font-size:15px">등록자 : ${loginId}
							<c:if test='${tbn=="edu"}'>
									|	
								<Strong>교육 기간</Strong>
								<input type="date" name="eduStartDate">~<input type="date" name="eduEndDate">
								<Strong>신청 기간</Strong>
								<input type="date" name="regStartDate">~<input type="date" name="regEndDate">
							</c:if>
						</div>
						<div class="col-md-6">
						<div align = "right">
							<button type ="button" class="btn btn-primary disabled">Submit</button>
							<button type ="button" class="btn btn-dark disabled" onclick="history.back()">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class = "input_wrap">
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
</html>
