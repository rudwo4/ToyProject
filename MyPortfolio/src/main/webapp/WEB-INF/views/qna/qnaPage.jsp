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
						<div class="col-md-6" style="font-size:20px">등록자 : ${pageInfo.writer}	|	등록일시 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${pageInfo.reg_date}"/>	|	
							<c:if test="${pageInfo.status=='N'}"><span class="btn btn-light">답변 대기</span></c:if>
							<c:if test="${pageInfo.status=='Y'}"><span class="btn btn-secondary">답변 완료</span></c:if>
						</div>
						<div class="col-md-6">
						<div align = "right">
							<c:if test="${pageInfo.writer==loginId}">
								<input type ="submit" class="btn btn-primary disabled" value = "modify" onclick="javascript: form.action= '/qna/qnaUpdatePage'"/>
								<input type ="submit" class="btn btn-dark disabled" value = "delete" onclick="javascript: form.action= '/qna/deletePage'"/>
							</c:if>
						</div>
						</div>
					</div>
				</div>
			</form>
				<hr>
				<div>
					<div>${pageInfo.content}</div>
				</div>
				<hr>
					<div id="write">
						<button type="button" class="btn btn-dark disabled" onclick="history.go(-1)">go to list</button>
					</div>
				<hr>
				<c:if test="${tbn=='qna'}">
				<div class = "input_wrap" id="reply">
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
				<hr>
				<div class = "input_wrap">
					<label>reply</label>
					<textarea id="replytext" name="reply" placeholder="댓글을 남겨주세요."></textarea>
					<div id="write">
						<br>
						<input type ="button" value = "saveReply" class="btn btn-primary disabled" onclick="saveReply()"/>
					</div>
				</div>
				<hr>
				</c:if>
		  </article>
		</main>	
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
<script>
 	function saveReply(){
 		let sendData = {
				"writer":"${loginId}",
				"reply": $('#replytext').val(),
				"bno":"${pageInfo.bno}",
		};
		$.ajax({
			type:'post',
			url:'/qna/enterReply',
			data: sendData,
			dataType:'html',
			async:false,
			success : function(html){
				$("#reply").html(html);
				$('#replytext').val("");
			}
		});
 	};
 	
 	function deleteReply(replybno){
 		var chk = confirm("Delete Y/N");
 		
 		if(chk){
 			let sendData = {
 					"writer":"${loginId}",
 					"replybno": replybno,
 					"bno":"${pageInfo.bno}",
 			};
 			$.ajax({
 				type:'post',
 				url:'/qna/deleteReply',
 				data: sendData,
 				dataType:'html',
 				async:false,
 				success : function(html){
 					$("#reply").html(html);
 				}
 			});	
 		}
 	}
</script>
</html>