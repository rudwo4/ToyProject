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
      		  <form action ="" method="post" onsubmit="return submitchk()" name="user">
	      		<div><h1><b>비밀번호 변경</b></h1></div>
	      		<hr>
	      		<div class= "col-md-12"id="write"><button class="btn btn-primary"> save </button></div>
	      		<div><h2><b>비밀번호 변경 시 주의사항</b></h2></div><br>
	      		<div><h3>영문자와 숫자,특수문자를 <strong>모두 혼용하여 8~16자로</strong>작성해주세요</h3></div><br>
	      		<div><h3>최근 변경일 : <fmt:formatDate pattern = "yyyy/MM/dd HH:MM" value="${info.modified_date}"/></h3></div><br>
	      		
	      		<table>
	      			<tr>
	      				<td><label>현재 비밀번호</label></td>
	      				<td>
	      					<div class="form-group">
						      <input type="password" class="form-control" id="recentPw" name="recentPw" placeholder="현재 비밀번호">
						    </div>
	      				</td>
	      			</tr>
	      			<tr>
	      				<td><label>새 비밀번호</label></td>
	      				<td>
	      					<div class="form-group">
						      <input type="password" class="form-control" id="renewalPw" name="renewalPw" placeholder="새 비밀번호">
						    </div>
	      				</td>
	      			</tr>
	      			<tr>
	      				<td><label>새 비밀번호 확인</label></td>
	      				<td>
	      					<div class="form-group">
						      <input type="password" class="form-control" id="renewalPwCheck" name="renewalPwCheck" placeholder="새 비밀번호 확인">
						    </div>
	      				</td>
	      			</tr>
	      		</table>
	      	</form>	
      	</article>
      </main>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
<script type="text/javascript">
$(document).ready(function(){
	let result = '<c:out value="${message}"/>';
	
	if(result==="fail"){
		alert("비밀번호가 맞지 않습니다");
	}
	if(result==="success"){
		alert("Password Chaged Success");
	}
});
function submitchk() {
	var pwchk =/^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,16}$/; 
	
	let recentPw = document.user.recentPw.value;
	let renewalPw = document.user.renewalPw.value;
	let renewalPwCheck = document.user.renewalPwCheck.value;
	
	var result = pwchk.test(renewalPw);	//renewal Pw regex Test
	
	if(renewalPw != renewalPwCheck){
		alert("비밀번호가 맞지 않습니다");
		document.user.renewalPwCheck.value ="";
		document.user.renewalPw.focus();
		return false;
	}
	else if(!result) {
		alert("비밀번호 조건이 맞지 않습니다. 확인하세요!");
		document.user.renewalPw.value ="";
		document.user.renewalPw.focus();
		return false;
	}
	else if(recentPw == renewalPw){
		alert("같은 비밀번호를 사용할 수 없습니다");
		document.user.renewalPw.value ="";
		document.user.recentPw.focus();
		return false;	
	}
}
</script>
</html>