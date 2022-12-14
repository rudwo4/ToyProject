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
			    <h1>과제 진행 확인</h1>
			    > RPA 회원 정보 테스트 요청중 인 현업 과제 확인해보세요
			</figure>
      		<div>테스트 요청중 과제</div> <div><b>Total</b><span class="text-danger">	<b>${total}</b></span></div>
      		<table class="table table-hover">
				<thead>
					<tr class="table-primary">
						<th width="5%">Number</th>
						<th width="30%">Subject</th>
						<th width="10%">Status</th>
						<th width="10%">Writer</th>
						<th width="15%">register Date</th>
						<th width="30%">Go-Live Check</th>
					</tr>
				</thead>	
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.rownum}<!--<c:out value="${list.rownum}"/>--></td>
						<td id="title"><span class="hit"><a href= '/task/taskPage?bno=<c:out value="${list.bno}"/>&tbn=worklist'><c:out value="${list.title}"/></a></span></td>
						<td>${list.status}</td>
						<td><c:out value="${list.writer}"/></td>
						<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.reg_date}"/></td>
						<td>
							<button onclick="golivechk('complete',${list.bno},'${list.writer}','${list.title}')" class="btn btn-primary" >테스트 완료</button> |
							<button onclick="golivechk('fail',${list.bno},'${list.writer}','${list.title}')"class="btn btn-danger">추가 개발 필요</button>
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
	function golivechk(result,bno,writer,title){
		
		var check = confirm("Is this your Decision?");
		
		if(check){
			window.location.href="/admin/golivechk?result="+result+"&bno="+bno+"&writer="+writer+"&title="+title;	
		}
	}
</script>   
</html>