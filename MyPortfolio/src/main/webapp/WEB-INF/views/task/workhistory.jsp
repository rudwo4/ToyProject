<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>    
<body class="main-layout">
   	  <%@ include file="../common/headerInner.jsp" %>
      <!-- list  -->
      <main>
	  <%@ include file="../common/snb_title.jsp" %>
	    <article>
	      <figure>
			 <h1>현업 과제 실행 이력</h1>
			 > 현업과제를 실행 이력을 확인 할 수 있습니다.
		  </figure>
		    <div class="alsert alert-dismissible alert-primary" id="write">
		    <br>
	      	<form id="/task/workhistory" method ="get">
		      	<!-- 
		      	<label>category</label>
		      	<select id = "category" name = "category">
		      		<option>Select</option>
		      		<option value="system">System</option>
		      		<option value="education">education</option>
		      		<option value="other">other</option>
		      	</select>
		      	 -->
		      	<label>reg_date</label>
		      	<input type="date" name="startDate" id="startDate" value="${map.ph.startDate}">~<input type="date" name = "endDate" id="endDate" value="${map.ph.endDate}">
				<input type ="text" name="keyword" placeholder = "search" value="${map.ph.keyword}">
		      	<button>search</button>
	      	</form>
	      </div>
	      <table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">Number</th>
						<th width="50%">Subject</th>
						<th width="10%">Writer</th>
						<th width="20%">register Date</th>
						<th width="10%">update Date</th>
					</tr>
				</thead>	
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.rownum}<!--<c:out value="${list.rownum}"/>--></td>
					<td><span><a href= '/task/taskPage?bno=<c:out value="${list.bno}"/>&tbn=${map.ph.tableName}'><c:out value="${list.title}"/></a></span></td>
					<td><c:out value="${list.writer}"/></td>
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.reg_date}"/></td>
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.up_date}"/></td>
				</tr>
			</c:forEach>
		</table>
			<div id ="write"> 
				<button onclick='window.location="/task/taskEnroll?tbn=${map.ph.tableName}"'>enroll</button>
			</div>
			<div id = "paging">
				<div>
					<ul id="pageInfo">
						<c:if test="${map.showPrev}">
							<li><a href="/task/workhistory?pageNum=${map.currentPage-1}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Prev</a></li>
						</c:if>
						<!-- 
						<c:set var="beginPage" value="${map.beginPage}"/>
						<c:set var="endPage" value="${map.endPage}"/>
						 -->
						<c:forEach var ="num" begin="${map.beginPage}" end="${map.endPage}">
							<li><a href="/task/workhistory?pageNum=${num}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">${num}</a></li>
						</c:forEach>
						<c:if test="${map.showNext}">
							<li><a href="/task/workhistory?pageNum=${map.currentPage+1}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
      <!-- end list -->
      	</article>
      </main>
      <%@ include file="../common/footerJS.jsp" %>
   </body>
<script>
	$(document).ready(function(){
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result){
			if(result ===""){return;}
			if(result ==="enroll Success"){
				alert("Success!!");
			}
			if(result ==1){
				alert("delete Success!!");
			}
		}
	});
</script>
</html>