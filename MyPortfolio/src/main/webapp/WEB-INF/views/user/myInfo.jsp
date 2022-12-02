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
      		<div class="col-md-4"><h1>개인정보 관리</h1></div>
      		<div class="row">
      			<div class="col-md-2"><img height="320" width="200"src="../../../resources/images/tes1.jpg" /></div>
      			<div class="col-md-6">
				<table class="table table-hover">
		      		<tbody>
		      			<tr class="table-info">
		      				<td><Strong>Name</Strong></td><td>${info.username}</td>
		      			</tr>
		      			<tr>
		      				<fmt:parseDate value="${info.birth}" var="birthday" pattern="yyyy-MM-dd"/>
		      				<td><Strong>birth</Strong></td><td><fmt:formatDate pattern = "yyyy/MM/dd" value="${birthday}"/></td>
		      			</tr>
		      			<tr class="table-info">	
		      				<td><Strong>ID</Strong></td><td>${info.id}</td>
		      			</tr>
		      			<tr>	
		      				<td><Strong>Email</Strong></td><td>${info.email}</td>
		      			</tr>
		      			<tr class="table-info">	
		      				<td><Strong>PhoneNumber</Strong></td><td>${info.phoneNumber}</td>
		      			</tr>
		      		</tbody>
      			</table>      		
      			</div>
      		</div>
      		<hr>
      		<div><strong>교육 예약 내역</strong></div>
      		<c:set var ="booking" value="${booking}"/>
	      	<c:if test="${booking=='[]'}">
	      		예약 내역이 없습니다
	      	</c:if>
      		<table class="table">
      			<c:forEach var ="booking" items="${booking}">
	      			<tr>
	      				<td>강의명 : ${booking.title}</td>
	     				<td>강의 담당자 : ${booking.writer}</td>
	      				<td>
	      					교육 일자 : 
	      					<fmt:parseDate value="${booking.eduStartDate}" var="eduStartDate" pattern="yyyy-MM-dd"/>
	      					<fmt:parseDate value="${booking.eduEndDate}" var="eduEndDate" pattern="yyyy-MM-dd"/>
	      					<fmt:formatDate pattern = "yyyy/MM/dd" value="${eduStartDate}"/>
	      					~
	      					<fmt:formatDate pattern = "yyyy/MM/dd" value="${eduEndDate}"/>
	      				</td>
	      			</tr>
      			</c:forEach>
      		</table>
      		<hr>
      		<div><strong>나의 문의 사항</strong></div>
      		<hr>
      		<c:set var ="qna" value="${qna}"/>
	      	<c:if test="${qna=='[]'}">
	      		문의 내역이 없습니다
	      	</c:if>
	      	<b>최근 6개월 이내 문의 사항만 표시됩니다</b>
	      		<div class="container mt-5">
		      		<div class="row">
			      		<c:forEach var ="qna" items="${qna}">
				      		<div class="card border-primary mb-3" style="max-width: 20rem;">
			  					<div class="card-header"><a href = "/qna/qnaPage?bno=${qna.bno}&tbn=qna"><strong>${qna.title}</strong>(${qna.reply_cnt})</a></div>
			  					<div class="card-body">
							    <h4 class="card-title">등록일자 : <fmt:formatDate pattern = "yyyy/MM/dd" value="${qna.reg_date}"/></h4>
							    <p class="card-text">${qna.content}</p>
							  	</div>
							</div>
							&nbsp;&nbsp;&nbsp;
			      		</c:forEach>
		      		</div>
	      		</div>
      	</article>
      </main>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
</html>