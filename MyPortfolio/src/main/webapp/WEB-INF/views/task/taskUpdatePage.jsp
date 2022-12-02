<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<script src="../../../resources/js/ckeditor/ckeditor.js"></script>	
	<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
		<form method = "post" enctype="multipart/form-data">
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
						<div class="col-md-6" style="font-size:15px">등록자 : ${pageInfo.writer}	|	등록일시 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.reg_date}"/>	|	<Strong>category : </Strong>
							<select id="status" name="status" required>
								<option value="register">Register</option>
								<option value="develop">Develop</option>
								<option value="test">Test</option>
								<option value="golive">Go-Live</option>
							</select>
						</div>
						<div class="col-md-6">
						<div align = "right">
							<input type ="submit" class="btn btn-primary disabled" value = "Save" onclick="javascript: form.action= '/task/updatePage'"/>
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
   <script>
		$(document).ready(function(){
				let status = '<c:out value= "${pageInfo.status}"/>';
				if(status ==='register'){
					$('#status').val('register').prop("selected",true);
				}else if(status == 'develop'){
					$('#status').val('develop').prop("selected",true);
				}else if(status == 'test'){
					$('#status').val('test').prop("selected",true);
				}else if(status == 'golive'){
					$('#status').val('golive').prop("selected",true);
				}
		});
</script>
</html>