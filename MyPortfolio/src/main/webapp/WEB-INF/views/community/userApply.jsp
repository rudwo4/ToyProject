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
  	  <figure>
		<h1>A360 사용 신청</h1>
		> RPA 과제 개발을 위해서 A360 시스템 사용자 등록 & Creator 사용 신청을 합니다. Chrome 사용을 권장합니다.
	  </figure>
	  <br><br>
  	  <div class="row">
  	  	<div class="col-md-4">
  	  		<div class="card border-primary mb-3" style="max-width: 20rem; height: 250px;">
			  <div class="card-header">Step1. 사용자 등록</div>
			  <div class="card-body">
			    <h4 class="card-title"><span class="badge bg-primary ronded-pill" style="color:white; font-size:30px;">1</span>
			    	<button type="button" class="btn btn-outline-primary" onclick='CRid'>A360 사용자 등록</button>
			    </h4>
			    <p class="card-text">-사용자 등록 완료 후 임시 비밀번호가<br>메일로 전송됩니다.<!-- id create API --></p>
			  </div>
			</div>
		</div>
  	  	<div class="col-md-4">
  	  		<div class="card border-primary mb-3" style="max-width: 20rem; height: 250px;">
			  <div class="card-header">Step2. Creator 사용 신청</div>
			  <div class="card-body">
			    <h4 class="card-title"><span class="badge bg-primary ronded-pill" style="color:white; font-size:30px;">2</span>
			    	<button type="button" class="btn btn-outline-primary" onclick='CRid'>A360 Creator 사용 신청</button>
			    </h4>
			    <p class="card-text">-Creator 사용 신청을 합니다.<!-- id create API --></p>
			  </div>
			</div>
		</div>
		<div class="col-md-4">
  	  		<div class="card border-primary mb-3" style="max-width: 20rem; height: 250px;">
			  <div class="card-header">Step3. Creator 사이트 접속</div>
			  <div class="card-body">
			    <h4 class="card-title"><span class="badge bg-primary ronded-pill" style="color:white; font-size:30px;">3</span>
			    	<button type="button" class="btn btn-outline-primary" onclick='CRid'>A360 Creator 사이트 접속</button>
			    </h4>
			    <p class="card-text">-A360 Bot Agent 매뉴얼은<br>필히 읽어 보시길 바랍니다.<br>
			    	<a href="">-A360 Bot Agent 매뉴얼 Link</a><br>
			    	-A360 Login 화면으로 이동합니다.
			    </p>
			  </div>
			</div>
  	  	</div>  	  	
  	  </div>
  	  <p>* 문의사항은 Q&A에 등록하기 바랍니다.</p>
  	  </article>
    </main>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
</html>