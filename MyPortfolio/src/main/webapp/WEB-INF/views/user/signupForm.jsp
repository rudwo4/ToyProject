<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<c:set var="path" value ="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>로그인+약관 동의 화면</title>
<style>
	#field{
		margin : 20 auto;
		width : 700px;
		border : 2px solid #3793FA;
	}
	
	
	.inf input {
		height : 40px;
		width : 500px;
	}
	
	#ID{
		height : 40px;
		width : 400px;
	}
	
	#certiNum{
		width : 125px;
	}
	
	#dupChk{
	   width : 95px;
	   height : 40px;
	   position: relative;
       vertical-align: top;
       padding: 0;
       font-size: 15px;
       color: white;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       background: black;
       border: 0;
       border-bottom: 2px solid #3793FA;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px #3793FA;
       box-shadow: inset 0 -2px #3793FA;
    	background : #3793FA;
        color : gray;
	}
	
</style>
</head>
<%@ include file="../common/headerSetting.jsp"%>
<%@ include file="../common/headerInner.jsp"%>
<body>
<form method="post" name="user" action = "/user/signUp" >
<fieldset id="field">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" id="idDoubleChk" value="false">
	<input type ="hidden" id="phoneDoubleChk" value="false">
	<figure>
		<h1><b>회원가입</b></h1>
	</figure>
		<table>
			<tr>
				<td><label for ="ID">아이디</label></td>
				<td>
					<input type ="text" id = "ID" name ="userid" required >	
					<input type ="button" class="btn btn-primary" id = "dupChkbtn"  value="중복확인"/>
					<div id="msg"></div>
				</td>
			</tr>
			
			<tr>
				<td><label for ="pwd">비밀번호</label></td>
				<td class = "inf"><input type ="password" id = "pwd" name ="passwd" placeholder = "(8~16자 이내 영대소문자,숫자,특수문자 가능)" required></td>
			</tr>
			
			<tr>
				<td><label for ="pwd">비밀번호 확인</label></td>
				<td class = "inf"><input type ="password" id = "pwdre" name ="userrePwd" required></td>
			</tr>
			
			<tr>
				<td><label for ="Name">이름</label></td>
				<td class = "inf"><input type ="text" id = "name" name ="userName" required></td>
			</tr>
			
			<tr>
				<td><label for ="email">이메일</label></td>
				<td class = "inf">
					<input type ="email" id = "email" name ="userEmail" required>
				</td>
			</tr>
			
			<tr>
				<td><label for ="Phone">휴대폰번호</label></td>
				<td>
					<input type ="text" id = "Phone" name ="userPhone" placeholder = "'-'을 제외한 번호만 입력하세요" required/>
					<input type ="button" id = "phoneChk" class="btn btn-primary btn-sm" value = "인증번호전송"/>
					<input type ="text" id = "certiNum" />
					<input type ="button" id = "certiChk" class="btn btn-primary btn-sm" value = "인증번호"/>
					<div id="certiMsg"></div>
				</td>
			</tr>
			<tr>
				<td><label for = "date"> 생년월일</label></td>
				<td class = "inf"><input type ="date" id = "date" name="userBirth" required></td>
			</tr>
		</table>
		<div align = "center">
		<legend>회원 약관</legend>
        ================================================================================================================<br>
        1. 회원정보는 웹사이트의 운영정보를 위해서만 사용 됩니다.<br>
        2. 웹사이트의 정상 운영을 방해하는 회원은 회원 탈퇴 처리 됩니다.<br>
        ================================================================================================================<br>
        <!-- 
        <input type = "checkbox" name = "agree" value = "YES" required> 동의함
		-->
		</div>
		
		<div align = "center">
		<table>
			<tr id = "button">
				<td>
				<!-- <input type = "submit" value = "회원가입" onclick="javascript: form.action= '/user/signUp'" checked> -->
				<input type = "submit" value = "회원가입" class="btn btn-primary" onclick = "return submit_check()" checked>
				</td>
				<td><input type = "reset" class="btn btn-danger" onclick = "location.href='login'" value = "취소"></td>
			</tr>
		</table>
		<br>
		</div>	
</fieldset>
</form>
<%@ include file="../common/footerJS.jsp" %>	
</body>
<script>
$(document).ready(function(){
	let status =""
	$('#dupChkbtn').click(function(){
		
		let key = $('#ID').val();
		$.ajax({
			type:'get',
			url:'/user/duplicateIdChk',
			data: "userid="+key,
			dataType:'text',
			async:false,
			success : function(result){
				status = result;
			}
		});
		if(status==0&&key!=""){
			$('#msg').css('color','green');
			$('#msg').html('This is Possible ID');
			$('#idDoubleChk').val("true");
		}else{
			$('#msg').css('color','red');
			$('#msg').html('This is Impossible ID');
			$('#idDoubleChk').val("false");
		}
	});
	
	
	let code = "";
	var phoneReg =/^(010|017|018|070)\d{3,4}\d{4}$/;
	$('#phoneChk').click(function(){
		let phoneNumber = $('#Phone').val();
		var result = phoneReg.test(phoneNumber);		
		if(!result){
			alert("핸드폰 입력이 잘못되엇습니다. 확인하세요!");
			document.user.userPhone.value="";
			document.user.userPhone.focus();
			return false;
		}
		
		$.ajax({
			type:'get',
			url:"phoneChk?phone="+phoneNumber,
			cache:false,
			aysnc:false,
			success:function(data){
				code = data;
				alert("send Complete! Plasee Check Auth Number!");
			}
		});
	});
	
	$('#certiChk').click(function(){
		if($('#certiNum').val()==code&&code!=""){
			$('#certiMsg').text("true Number");
			$('#certiMsg').css("color","green");
			$('#phoneDoubleChk').val("true");
			$('#certiNum').attr("disabled",false);
		}else{
			$('#certiMsg').text("Fail Number");
			$('#certiMsg').css("color","red");
			$('#phoneDoubleChk').val("false");
			$(this).attr("autofocus",true);
		}
	});
	
	let result = '<c:out value="${result}"/>';
	checkAlert(result);
	function checkAlert(result){
		if(result ===""){return;}
		if(result ==="Fail"){
			alert("signUp Fail Retry Please!!");
			}
		}
});

/**
 * validation check
 */
	function submit_check() {
		var reg1 =/^[가-힣]{2,5}$/;
		var reg2 =/^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,16}$/;
		
		var name= document.user.userName.value;
		var result1 = reg1.test(name);
		var result2 = reg2.test(document.user.passwd.value);
		
		if(document.user.passwd.value != document.user.userrePwd.value){
			alert("비밀번호가 맞지 않습니다");
			document.guest.userrePwd.value ="";
			document.guest.userrePwd.focus();
			return false;
		}
		else if(!result1) {
			alert("이름 입력이 잘못되었습니다. 확인하세요!");
			document.user.userName.value="";
			document.user.userName.focus();
			return false;
		}
		else if(!result2){
			alert("비밀번호 조건이 맞지 않습니다");
			document.guest.userrePwd.value ="";
			document.guest.userrePwd.focus();
			return false;	
		}
		else if($('#idDoubleChk').val()==="false"){
			alert("아이디를 중복 확인 하세요!");
			$('#ID').focus();
			return false;
			
		}
		else if($('#phoneDoubleChk').val()==="false"){
			alert("Phone을 인증 하세요!");
			$('#certiNum').focus();
			return false;
		}	
	}	
	
</script>
</html>