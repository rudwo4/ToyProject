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
			    <h1>교육신청</h1>
			    > RPA 오프라인 교육일정을 확인하고 신청하십시오.
			</figure>
	      <div class="alsert alert-dismissible alert-primary" id="write">
	      <br>
	      <form id="/study/edu" method ="get">
		     <fieldset>
			    <div class="form-group">
		      	<Strong>교육일</Strong>
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
					<th width="40%">Subject</th>
					<th width="20%">교육 기간</th>
					<th width="20%">신청 기간</th>
					<th width="5%">신청</th>
					<th width="5%">취소</th>
				</tr>
			</thead>	
			<c:forEach items="${list}" var="list">
				<tr class="table-bordered">
					<td>${list.rownum}<!--<c:out value="${list.rownum}"/>--></td>
					<td><a href= '/study/studyPage?bno=<c:out value="${list.bno}"/>&tbn=${map.ph.tableName}'><c:out value="${list.title}"/></a></td>
					<td>
						<fmt:parseDate value="${list.eduStartDate}" var="eduStartDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${eduStartDate}" pattern="yyyy-MM-dd"/>
						~
						<fmt:parseDate value="${list.eduEndDate}" var="eduEndDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${eduEndDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<fmt:parseDate value="${list.regStartDate}" var="regStartDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${regStartDate}" pattern="yyyy-MM-dd"/>
						~
						<fmt:parseDate value="${list.regEndDate}" var="regEndDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${regEndDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td><button class="btn btn-success disabled" onclick = "eduApply('${list.bno}')">신청</button></td>
					<td><button class="btn btn-danger disabled" onclick = "eduCancle('${list.bno}')">취소</button></td>
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
							<a class="page-link" href="/study/edu?pageNum=${map.currentPage-1}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Prev</a>
						</li>
					</c:if>
					<c:forEach var ="num" begin="${map.beginPage}" end="${map.endPage}">
						<li class="page-item">
							<a class="page-link" href="/study/edu?pageNum=${num}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">${num}</a>
						</li>
					</c:forEach>	
				    <c:if test="${map.showNext}">
						<li class="page-item">
							<a class="page-link" href="/study/edu?pageNum=${map.currentPage+1}&category=${map.ph.category}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Next</a>
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
	
	
	function eduApply(bno){
		var chk = confirm("신청하기");
		let status;
		if(chk){
			let sendData = {
					"loginId":"${loginId}",
					"tbn":"${map.ph.tableName}",
					"bno":bno
			};
			
			$.ajax({
				type:'post',
				url:'/study/eduApply',
				data: sendData,
				dataType:'json',
				async:false,
				success : function(result){
					status = result;
				}
			});
		if(status==0){alert("you already applied");}
		else{alert("Succes Apply");}
		}
	}
	function eduCancle(bno){
		var chk =confirm("취소하기");
		let status;
		if(chk){
			let sendData = {
					"loginId":"${loginId}",
					"tbn":"${map.ph.tableName}",
					"bno":bno
			};
			$.ajax({
				type:'post',
				url:'/study/eduCancel',
				data: sendData,
				dataType:'json',
				async:false,
				success : function(result){
					status = result;
				}
			});
			if(status==0){alert("you already Canceled");}
			else{alert("Succes Cancel");}
		}
	}
</script>
</html>