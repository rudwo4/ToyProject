<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/headerSetting.jsp" %>
<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
      <!-- banner -->
      <section class="banner_main">
   	  <!-- wedo  section -->
      <div class="wedo ">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>What is RPA?</h2>
                     <p style="color:white; font-size:20px">사용자 PC에서 이루어지는 정형적 반복적인 업무를 프로세스화하여 소프트웨어(Robot)가 대신 수행하도록 자동화 하는 것</p>
                  </div>
               </div>
            </div>
            <div class="row">
                  <div class="row">
                     <div class="col-md-4 margin_bottom">
                        <div class="work">
                           <figure><img src="https://cdn-icons-png.flaticon.com/512/1728/1728431.png"/></figure>
                        </div>
                        <div class="work_text">
                           <a href="/community/userApply"><h3>라이선스 신청<br><span class="blu">License Request</span></h3>
                           <p style="color:white; font-size:20px">RPA 과제 실행을 위한 <br> Automaiton Anywhere<br>RPA Designer<br>라이선스를 신청합니다.</p>
                           </a>
                        </div>
                     </div>
                     <div class="col-md-4 margin_bottom">
                        <div class="work">
                           <figure><img src="https://cdn-icons-png.flaticon.com/512/3976/3976631.png"  /></figure>
                        </div>
                        <div class="work_text">
                           <a href="/community/userApply"><h3>교육 신청<br><span class="blu">RPA Education Register</span></h3>
                           <p style="color:white; font-size:20px">RPA 오프라인 교육 일정을<br>확인하고 신청하세요.</p>
                           </a>
                        </div>
                     </div>
                     <div class="col-md-4 margin_bottom">
                        <div class="work">
                           <figure><img src="https://cdn-icons-png.flaticon.com/512/4245/4245734.png"  /></figure>
                        </div>
                        <div class="work_text">
                           <a href="/task/worklist"><h3>현업 과제<br><span class="blu">Worksite Scenario</span></h3>
                           <p style="color:white; font-size:20px"><b>현업에서 필요한 과제를 등록하고<br>공방의 도움을 받아 개발할 수 있습니다.</b></p>
                           </a>
                        </div>
                     </div>
                  </div>
            </div>
         </div>
      </div>
      </section>
      <!-- end banner -->
      <!-- three_box -->
      <div class="three_box">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div class="box_text">
                     <p>
                     	<a href='/community/notice'><img style="max-width:20%"src="https://cdn-icons-png.flaticon.com/512/7803/7803013.png" />
                     		<b>Notice</b>
                     	</a>
                     </p>
                     <c:forEach items="${list}" var="list">
                     	<p>- <a class="text-primary" href= '/community/noticePage?bno=<c:out value="${list.bno}"/>&tbn=community'>${list.title}</a></p>
                     </c:forEach>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="box_text">
                     <a href='/qna/qna'><img style="max-width:20%" src="https://cdn-icons-png.flaticon.com/512/3382/3382313.png" />
                     	<b>RPA Q&A</b>
                     </a>
                     <c:forEach items="${faqlist}" var="faqlist">
                     	<p>- <a class="text-primary" href= '/qna/qnaPage?bno=<c:out value="${faqlist.bno}"/>&tbn=qna'>${faqlist.title}</a>
                     		<c:if test="${faqlist.reply_cnt!=0}">
								<span class="badge bg-primary rounded-pill">
									<span style="color:white">
									&nbsp;${faqlist.reply_cnt}
									</span>
								</span>
							</c:if>
                     	</p>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--  footer -->
      <%@ include file ="../common/footer.jsp" %>
      <!-- end footer -->
   </body>
</html>