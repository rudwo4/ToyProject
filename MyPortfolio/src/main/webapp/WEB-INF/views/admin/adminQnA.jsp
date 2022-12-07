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
      		<figure>
			    <h1>문의 사항 확인</h1>
			    > RPA 문의 사항을 확인해보세요
			</figure>
      		<div>테스트 요청중 과제 <b>Total</b><span class="text-danger">	<b>${total}</b></span></div>
      		<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th width="10%">Number</th>
						<th width="45%">Subject</th>
						<th width="10%">Status</th>
						<th width="10%">Writer</th>
						<th width="10%">register Date</th>
						<th width="15%">Q&A Answer Check</th>
					</tr>
				</thead>	
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.rownum}<!--<c:out value="${list.rownum}"/>--></td>
						<td id="title">
						<span class="hit">
							<a href= '/qna/qnaPage?bno=<c:out value="${list.bno}"/>&tbn=${map.ph.tableName}'><c:out value="${list.title}"/>	
								<c:if test="${list.reply_cnt!=0}">
								<span class="badge bg-primary rounded-pill">
									<span style="color:white">
									&nbsp;${list.reply_cnt}
									</span>
								</span>
								</c:if>
							</a>
						</span>
						</td>
						<td>
							<c:if test="${list.status=='N'}">
								<span class="btn btn-secondary disabled">답변 대기</span>
							</c:if>
						</td>
						<td><c:out value="${list.writer}"/></td>
						<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.reg_date}"/></td>
						<td>
							<button onclick="answerChk('${list.bno}')" class="btn btn-primary" >답변 완료</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div id="paging">
				<div>
				  <ul class="pagination" id="pageInfo">
				    <c:if test="${map.showPrev}">
						<li class="page-item">
							<a class="page-link" href="/admin/adminTask?pageNum=${map.currentPage-1}">Prev</a>
						</li>
					</c:if>
					<c:forEach var ="num" begin="${map.beginPage}" end="${map.endPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/adminTask?pageNum=${num}">${num}</a>
						</li>
					</c:forEach>	
				    <c:if test="${map.showNext}">
						<li class="page-item">
							<a class="page-link" href="/admin/adminTask?pageNum=${map.currentPage+1}">Next</a>
						</li>
					</c:if>
				  </ul>
				</div>
			</div>
      	</article>
      </main>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
<script type="text/javascript">
	function answerChk(bno){
		
		var check = confirm("Is this your Decision?");
		
		if(check){
			window.location.href="/admin/answerChk?bno="+bno;	
		}
	}
</script>   
</html>