<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>    
<body class="main-layout">
   	  <%@ include file="../common/headerInner.jsp" %>
      <!-- list  -->
      <table>
		<thead>
			<tr>
				<th class= "bno_width"></th>
				<th class= "bno_width"></th>
				<th class= "bno_width"></th>
				<th class= "bno_width"></th>
				<th class= "bno_width"></th>
			</tr>
		</thead>	
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.rownum}<!--<c:out value="${list.rownum}"/>--></td>
				<td><a href= '/board/page?bno=<c:out value="${list.bno}"/>'><c:out value="${list.title}"/></a></td>
				<td><c:out value="${list.writer}"/></td>
				<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.reg_date}"/></td>
				<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.up_date}"/></td>
			</tr>
		</c:forEach>
	</table>
		<button onclick='window.location="/board/enroll"'>enroll</button>
		<div>
			<div>
				<ul id="pageInfo">
					<c:if test="${map.showPrev}">
						<li><a href="/board/list?pageNum=${map.currentPage-1}">Prev</a></li>
					</c:if>
					<!-- 
					<c:set var="beginPage" value="${map.beginPage}"/>
					<c:set var="endPage" value="${map.endPage}"/>
					 -->
					<c:forEach var ="num" begin="${map.beginPage}" end="${map.endPage}">
						<li><a href="/board/list?pageNum=${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${map.showNext}">
						<li><a href="/board/list?pageNum=${map.currentPage+1}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
      <!-- end list -->
      <%@ include file="../common/footerJS.jsp" %>
   </body>
</html>
<script>
	$(document).ready(function(){
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result){
			if(result ===""){return;}
			if(result ==="enrol Success"){
				alert("Success!!");
			}
			if(result ==1){
				alert("delete Success!!");
			}
		}
	});
</script>
</html>