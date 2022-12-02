<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.sub_menu{
	border: 1px solid black;
	border-top:none;
	background:white;
}

.sub_menu li:hover a{
	border-bottom: 2px solid black;
}
</style>
<body>
	<!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="../../../resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="/"><img src="../../../resources/images/logo.png" alt="#" /></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto" id="gnb">
                              <li class="nav-item">
                                 <a class="nav-link" href="/community/notice" onclick="return loginChk()">Community</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="/study/basic" onclick="return loginChk()">Study RPA</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="/task/worklist" onclick="return loginChk()">Task</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="/qna/faq" onclick="return loginChk()">RPA Q&A</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="/board/contact">Contact Us </a>
                              </li>
                              <li class="nav-item d_none">
                                 <a class="nav-link" id="link"><i class="fa fa-user-circle padd_right" aria-hidden="true"></i>${loginOut}</a>
                                 <ul class="sub_menu">
                                 	<li class="nav-item dropdown">
 	                                	<a class="dropdown-item" href="/user/myInfo">My Info</a>
 	                                </li>
                                 	<c:if test="${sessionAuth=='ADMIN'}">
                                 	<li class="nav-item dropdown">
                                 		<a class="dropdown-item" href="/admin/adminTask">admin Page</a>
                                 	</li>
                                 	</c:if> 
                                 	<li class="nav-item dropdown">
                                 		<a class="dropdown-item" onclick="logoutChk()">logOut</a>
                                 	</li>
                                 </ul>
                              </li>
                              <!-- 
                              <li class="nav-item d_none">
                                 <a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                              </li>
                               -->
                           </ul>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- end header inner -->
      <!-- end header -->
<script>
$(document).ready(function(){
	$('.sub_menu').hide();
	let result = '<c:out value="${loginOutLink}"/>';
	
    $('#link').click(function(){
    	if(result=="/user/logout"){
    		$('.sub_menu').slideToggle();    			
		}else{
			window.location.href="${loginOutLink}"
		}
    });
});

function logoutChk(){
	let result = '<c:out value="${loginOutLink}"/>';
	var chk=confirm('Logout Y/N');
	if(chk){
		window.location.href="${loginOutLink}"
	}
}

function loginChk(){
	let result = '<c:out value="${loginOutLink}"/>';
	
	if(result=="/user/login"){
		alert("Login Please!!!");
		window.location.href="/user/login"
		return false;
	}
}
</script>
</body>
</html>