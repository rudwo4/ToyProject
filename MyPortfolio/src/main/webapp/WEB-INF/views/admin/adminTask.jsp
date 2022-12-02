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
      		<div>테스트 요청중 인 현업 과제</div>
      		<table>
				<thead>
					<tr>
						<th width="10%">Number</th>
						<th width="30%">Subject</th>
						<th width="10%">Status</th>
						<th width="10%">Writer</th>
						<th width="10%">register Date</th>
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
							<button onclick="">테스트 완료</button>
							<button>추가 개발 필요</button>
						</td>
					</tr>
				</c:forEach>
			</table>
      		
      		<hr>
      		<div>교육 예약 내역</div>
      		<hr>
      		<c:set var ="booking" value="${booking}"/>
	      	<c:if test="${booking=='[]'}">
	      		예약 내역이 없습니다
	      	</c:if>
      		<table>
      			<c:forEach var ="booking" items="${booking}">
	      			<tr>
	      				<td>${booking.title}</td>
	     				<td>${booking.writer}</td>
	      				<td>${booking.eduStartDate}~${booking.eduEndDate}</td>
	      			</tr>
      			</c:forEach>
      		</table>
      		<hr>
      		<div>나의 문의 사항</div>
      		<hr>
      		<c:set var ="qna" value="${qna}"/>
	      	<c:if test="${qna=='[]'}">
	      		문의 내역이 없습니다
	      	</c:if>
	      	<b>최근 6개월 이내 문의 사항만 표시됩니다</b>
	      		<div class="container mt-5">
		      		<div class="row">
		      			<c:forEach var ="qna" items="${qna}">
		      				<div class="col-sm-4">
		      					<h3><a href = "/qna/qnaPage?bno=${qna.bno}&tbn=qna">${qna.title}(${qna.reply_cnt})</a></h3>
		      					<p>등록일자 : ${qna.reg_date}</p>
		      				</div>
		      			</c:forEach>	
		      		</div>
		      	</div>
      	</article>
      </main>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
<script type="text/javascript">
	function golivechk(result){
		
		
	}
</script>   
</html>