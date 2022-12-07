<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<script src="../../../resources/js/ckeditor/ckeditor.js"></script>
<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
      <form action="/task/taskEnroll?tbn=${tbn}" method ="post">
		<div class="row"> 
				<div class="col-md-12">
				<br>
					<div class="input-group mb-3">
			    	  <span class="input-group-text">Subject</span>
			      	<input class="form-control form-control-lg" type="text" name = "title" value ='<c:out value="${pageInfo.title}"/>'>
		      		</div>	  
					<div class="row">
						<input type="hidden" name="writer" value="${loginId}">
						<div class="col-md-6" style="font-size:15px">등록자 : ${loginId}</div>
						<div class="col-md-6">
						<div align = "right">
							<button type ="submit" class="btn btn-primary disabled">Submit</button>
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
			    	{filebrowserUploadUrl:'/task/imageUpload',
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
