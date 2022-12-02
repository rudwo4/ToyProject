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
         <div id="banner1" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#banner1" data-slide-to="0" class="active"></li>
               <li data-target="#banner1" data-slide-to="1"></li>
               <li data-target="#banner1" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container-fluid">
                     <div class="carousel-caption">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="text-bg">
                                 <h1>라이선스 신청</h1>
                                 <span>License Request</span>
                                 <p>RPA 과제 실행을 위한 Automaiton Anywhere RPA Designer 라이선스를 신청합니다.</p>
                                 <a href="/community/userApply">More Info </a>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div>
                                 <figure><img src="../../../resources/images/robot.png" width="600px" height="300px"/></figure>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container-fluid">
                     <div class="carousel-caption">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="text-bg">
                                 <h1>교육 신청</h1>
                                 <span>RPA Education Register</span>
                                 <p>RPA 오프라인 교육 일정을 확인하고 신청하세요.</p>
                                 <a href="/study/edu">More Info </a>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div >
                                 <figure><img src="../../../resources/images/car.png" width="10px" height="10px"/></figure>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container-fluid">
                     <div class="carousel-caption">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="text-bg">
                                 <h1>현업 과제</h1>
                                 <span>Worksite Scenario</span>
                                 <p>현업에서 필요한 과제를 등록하고,공방의 도움을 받아 개발할 수 있습니다.</p>
                                 <a href="/task/worklist">More Info </a>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="text_img">
                                 <figure><img src="../../../resources/images/car.png" /></figure>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
            <i class="fa fa-chevron-left" aria-hidden="true"></i>
            </a>
            <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
            <i class="fa fa-chevron-right" aria-hidden="true"></i>
            </a>
         </div>
      </section>
      <!-- end banner -->
      <!-- three_box -->
      <div class="three_box">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div class="box_text">
                     <h3>Notice</h3>
                     <i><a href='/community/notice'><img src="../../../resources/images/thr.png" /></a></i>
                     <c:forEach items="${list}" var="list">
                     	<p><a href= '/community/noticePage?bno=<c:out value="${list.bno}"/>&tbn=community'>${list.title}</a></p>
                     </c:forEach>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="box_text">
                     <h3>RPA Q&A</h3>
                     <i><a href='/qna/qna'><img src="../../../resources/images/thr1.png" /></a></i>
                     <c:forEach items="${faqlist}" var="faqlist">
                     	<p><a href= '/qna/qnaPage?bno=<c:out value="${faqlist.bno}"/>&tbn=qna'>${faqlist.title}</a></p>
                     </c:forEach>
                  </div>
               </div>
               <!-- 
               <div class="col-md-4">
                  <div class="box_text">
                     <h3>AUTO DIAGNOSE</h3>
                     <i><img src="../../../resources/images/thr2.png" /></i>
                     <p>ipsum dolor sit amet, consectetur adipiscing elit, sed d veniam, adipiscing elit, sed d veniam</p>
                  </div>
               </div>
                -->
            </div>
         </div>
      </div>
      
      <div class="about">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div class="box_text">
                     <h3>Task</h3>
                     <table>
						<tr>
							<td>Whole Task</td>
							<td>Reg/Revies</td>
							<td>develop</td>
						</tr>
						<tr >
							<td rowspan="3">96</td>
							<td>5</td>
							<td>0</td>
						</tr>
						<tr>
							<td>Test</td>
							<td>Go-Live</td>
						</tr>
						<tr>
							<td>6</td>
							<td>58</td>
						</tr>                     
                     </table>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="box_text">
                     <h3>Task Status</h3>
                     	<p>info</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- three_box -->
      <!-- about -->
      <!-- 
      <div  class="about">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>About Our Car Service </h2>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row">
                  <div class="col-md-10 offset-md-1">
                     <div class="about_img">
                        <div class="about_box">
                           <h3>Dolor sit amet, consectetur adipiscing elit,  </h3>
                           <p>dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud </p>
                           <a class="read_more">Read More</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end about -->
      <!-- wedo  section -->
      <!-- 
      <div class="wedo ">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>What We Do</h2>
                     <p>It is a long established fact that a reader will be distracted by the </p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-10 offset-md-1">
                  <div class="row">
                     <div class="col-md-6 margin_bottom">
                        <div class="work">
                           <figure><img src="../../../resources/images/img1.png"  /></figure>
                        </div>
                        <div class="work_text">
                           <h3>Quick repair<br><span class="blu">Total Service</span></h3>
                        </div>
                     </div>
                     <div class="col-md-6 margin_bottom">
                        <div class="work">
                           <figure><img src="../../../resources/images/img2.png"  /></figure>
                        </div>
                        <div class="work_text">
                           <h3>Quick repair<br><span class="blu">Total Service</span></h3>
                        </div>
                     </div>
                     <div class="col-md-6 margin_bottom">
                        <div class="work">
                           <figure><img src="../../../resources/images/img3.png"  /></figure>
                        </div>
                        <div class="work_text">
                           <h3>Quick repair<br> <span class="blu">Total Service</span></h3>
                        </div>
                     </div>
                     <div class="col-md-6 margin_bottom">
                        <div class="work">
                           <figure><img src="../../../resources/images/img4.png"  /></figure>
                        </div>
                        <div class="work_text">
                           <h3>Quick repair<br><span class="blu">Total Service</span></h3>
                        </div>
                     </div>
                  </div>
                  <a class="read_more" href="#">See More</a>
               </div>
            </div>
         </div>
      </div>
      <!-- end wedo  section -->
      <!-- testimonial -->
      <!--
      <div class="testimonial">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Testimonial</h2>
                     <p>It is a long established fact that a reader will be distracted by the </p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div id="myCarousel" class="carousel slide testimonial_Carousel " data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <div class="container">
                              <div class="carousel-caption ">
                                 <div class="row">
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <i><img src="../../../resources/images/tes.jpg" /></i>
                                          <h4>JCKOLO</h4>
                                          <span>(It is a long )</span>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as </p>
                                       </div>
                                    </div>
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <i><img src="../../../resources/images/tes1.jpg" /></i>
                                          <h4>ROCOYO</h4>
                                          <span>(It is a long )</span>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption">
                                 <div class="row">
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <i><img src="../../../resources/images/tes.jpg" /></i>
                                          <h4>JCKOLO</h4>
                                          <span>(It is a long )</span>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as </p>
                                       </div>
                                    </div>
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <i><img src="../../../resources/images/tes1.jpg" /></i>
                                          <h4>ROCOYO</h4>
                                          <span>(It is a long )</span>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption">
                                 <div class="row">
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <i><img src="../../../resources/images/tes.jpg" /></i>
                                          <h4>JCKOLO</h4>
                                          <span>(It is a long )</span>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as </p>
                                       </div>
                                    </div>
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <i><img src="../../../resources/images/tes1.jpg" /></i>
                                          <h4>ROCOYO</h4>
                                          <span>(It is a long )</span>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                     </a>
                     <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end testimonial -->
      <!--  footer -->
      <%@ include file ="../common/footer.jsp" %>
      <!-- end footer -->
   </body>
</html>