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
			    <h1>A360 기초과정</h1>
			    > A360 동영상 교육 자료
			</figure>
	      <div class="alsert alert-dismissible alert-primary" id="write">
	      <br>
	      <form id="/stody/basic" method ="get">
		    <fieldset>
			    <div class="form-group">
		      	<strong>등록일</strong>
		      	<input type="date" name="startDate" id="startDate" value="${map.ph.startDate}">~<input type="date" name = "endDate" id="endDate" value="${map.ph.endDate}">
				<strong>검색어</strong>
				<input type ="text" name="keyword" placeholder = "search" value="${map.ph.keyword}">
		      	<button class="btn btn-dark disabled btn-sm">search</button>
		      	</div>
		    </fieldset>  	
	      </form>
	      </div>
	      <div><b>Total</b><span class="text-danger">	<b>${total}</b></span></div>
	      <table class="table table-hover">
			<thead>
				<tr class="table-primary">
					<th width="10%">Number</th>
					<th width="50%">Subject</th>
					<th width="10%">Writer</th>
					<th width="15%">register Date</th>
					<th width="15%">update Date</th>
				</tr>
			</thead>	
			<c:forEach items="${list}" var="list">
				<tr class="table-bordered">
					<td>${list.rownum}<!--<c:out value="${list.rownum}"/>--></td>
					<td id="title"><span class="hit"><a href= '/study/studyPage?bno=<c:out value="${list.bno}"/>&tbn=${map.ph.tableName}'><c:out value="${list.title}"/></a></span></td>
					<td><c:out value="${list.writer}"/></td>
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.reg_date}"/></td>
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${list.up_date}"/></td>
				</tr>
			</c:forEach>
		</table>
			<div id="write">
				<c:if test="${sessionAuth=='ADMIN'}">
					<button class="btn btn-primary disabled" onclick='window.location="/study/studyEnroll?tbn=${map.ph.tableName}"'>enroll</button>
				</c:if>
			</div>
			<div id="paging">
				<div>
				  <ul class="pagination" id="pageInfo">
				    <c:if test="${map.showPrev}">
						<li class="page-item">
							<a class="page-link" href="/study/basic?pageNum=${map.currentPage-1}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Prev</a>
						</li>
					</c:if>
					<c:forEach var ="num" begin="${map.beginPage}" end="${map.endPage}">
						<li class="page-item">
							<a class="page-link" href="/study/basic?pageNum=${num}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">${num}</a>
						</li>
					</c:forEach>	
				    <c:if test="${map.showNext}">
						<li class="page-item">
							<a class="page-link" href="/study/basic?pageNum=${map.currentPage+1}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Next</a>
						</li>
					</c:if>
				  </ul>
				</div>
			</div>	
		</article>	
	  </main>	
      <!-- end list -->
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