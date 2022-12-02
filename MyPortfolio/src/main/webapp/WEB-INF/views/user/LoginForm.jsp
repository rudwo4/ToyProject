<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<body class="main-layout">
	<%@ include file="../common/headerInner.jsp" %>
		<div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-4">
                     <div class="titlepage">
                        <h2>Login</h2>
                     </div>
                  </div>
                  <div class="col-md-8">
                     <ul class="location_icon">
                        <li><a onclick="window.open('findPw','find_Password','width=430,height=500')"><i class="fa fa-envelope" aria-hidden="true"></i></a> 비밀번호 찾기</li>
                        <li><a onclick="location.href='signUp'"><i class="fa fa-joomla" aria-hidden="true"></i></a>회원가입</li>
                     </ul>
                  </div>
                  <div class="col-md-6">
                     <form id="request" class="main_form" action="/user/login" method="post" onsubmit="return formCheck(this);">
                        <div class="row">
                           <div class="col-md-12 ">
                              <input type="text" class="contactus" placeholder="login ID" name="id" autofocus> 
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" type="password" name="pwd" placeholder="비밀번호"> 
                           </div>
                           <div class="">
                           		<div class="col-sm-col-xl-6 col-lg-6 col-md-6 col-sm-12">
                              		<button class="btn btn-primary disabled">로그인</button>
                           		</div>
                           </div>
                           <div class="col-md-6">
                           		<input type="hidden" name="toURL" value="">
							  	<fieldset class="form-group">
							  	<div class="form-check">
							  		<input class="form-check-input" type="checkbox" name="rememberId" value="on">
                           			<label class="form-check-label" for="flexCheckDefault">
                           				<p class="lead">아이디 기억</p>
                           			</label>
                           		</div>
	                           		<c:if test="${not empty param.msg}">
										<i class="fa fa-exclamation-circle"></i>
										<p class="text-danger">${param.msg}</p>
									</c:if>
								</fieldset>
                           </div>
                        </div>
                     </form>
                  </div>
                  <div class="col-md-6">
                     <div class="map">
                        <figure><img src="../../../resources/images/map.jpg" alt="#"></figure>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>Copyright 2019 All Right Reserved By <a href="https://html.design/"> Free  html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
 <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
</body>
<script>
	$(document).ready(function(){
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result){
			if(result ===""){return;}
			if(result ==="Success"){
				alert("signUp Success Login Please!!");
			}
		}
	});		
	
	function formCheck(frm) {
			let msg ='';
			if(frm.id.value.length==0) {
				setMessage('id를 입력해주세요.', frm.id);
				return false;
			}
			if(frm.pwd.value.length==0) {
				setMessage('password를 입력해주세요.', frm.pwd);
				return false;
			}
			return true;
		}
		function setMessage(msg, element){
			document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
			if(element) {
				element.select();
			}
		}
			
	</script>
</html>