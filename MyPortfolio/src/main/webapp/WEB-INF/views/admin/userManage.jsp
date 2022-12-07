<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 240;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        #modal .modal-window {

            background: rgba( 210, 236, 216 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );

            width: 400px;
            height: 300px;
            position: relative;
            top: 0px;
            padding: 10px;
        }

        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }

        #modal .title h2 {
            display: inline;
        }

        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
    </style>
<%@ include file="../common/headerSetting.jsp" %>
<body class="main-layout">
      <%@ include file="../common/headerInner.jsp" %>
      <main>
      <%@ include file="../common/snb_title.jsp" %>
      	<article>
      		<figure>
			    <h1>회원 정보 관리</h1>
			    > RPA 회원 정보 관리사항을 확인해보세요
			</figure>
	      	<div class="alsert alert-dismissible alert-success" id="write">
	      		<br>
		      	<form id="/task/taskPage" method ="get">
			      <fieldset>
			    	<div class="form-group">
		      		<strong>가입 일자</strong>
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
					<tr class="table-success">
						<th width="10%">이름</th>
						<th width="15%">ID</th>
						<th width="15%">권한 상태</th>
						<th width="25%">가입 일자</th>
						<th width="10%">게시글 수</th>
						<th width="10%">댓글 수</th>
						<th width="15%">회원 탈퇴</th>
					</tr>
				</thead>	
				<c:forEach items="${list}" var="list">
					<tr>
						<td onclick ="userInfo('${list.id}')">${list.username}</td>
						<td onclick ="userInfo('${list.id}')"><c:out value="${list.id}"/></td>
						<td>${list.role}</td>
						<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${list.reg_date}"/></td>
						<td>${list.boardCnt}</td>
						<td>${list.replyCnt}</td>
						<td><button class="btn btn-danger" onclick="userDelete('${list.id}')">탈퇴</button></td>
					</tr>
				</c:forEach>
			</table>
			<div id="paging">
				<div>
				  <ul class="pagination" id="pageInfo">
				    <c:if test="${map.showPrev}">
						<li class="page-item">
							<a class="page-link" href="/admin/userManage?pageNum=${map.currentPage-1}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Prev</a>
						</li>
					</c:if>
					<c:forEach var ="num" begin="${map.beginPage}" end="${map.endPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/userManage?pageNum=${num}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">${num}</a>
						</li>
					</c:forEach>	
				    <c:if test="${map.showNext}">
						<li class="page-item">
							<a class="page-link" href="/admin/userManage?pageNum=${map.currentPage+1}&startDate=${map.ph.startDate}&endDate=${map.ph.endDate}&keyword=${map.ph.keyword}">Next</a>
						</li>
					</c:if>
				  </ul>
				    <div id="modal" class="modal-overlay">
				    	<div class="modal-window">
				            <div class="title">
				                <h2>User Information</h2>
				            </div>
				            <div class="close-area">X</div>
				            <div class="content" id="content">
				            </div>
				        </div>    
				    </div>
				</div>
			</div>
      	</article>
      </main>
      <!--  footer -->
      <%@ include file ="../common/footerJS.jsp" %>
      <!-- end footer -->
   </body>
<script type="text/javascript">
const modal = document.getElementById("modal")

function modalOn() {
    modal.style.display = "flex"
}

function isModalOn() {
    return modal.style.display === "flex"
}

function modalOff() {
    modal.style.display = "none"
}


function userInfo(id){
	modalOn()
	$.ajax({
		type:"get",
		url:"/admin/userInfo?id="+id,
		success:function(data){
			$('#content').html(data);
		},
		error:function(status,error){
			console.log(status,error)
		}
	});
}

const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
})

window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})

function userDelete(id){
	var check = confirm("회원 탈퇴 하겠습니다");
	if(check){
		window.location.href="/admin/userDelete?id="+id;
	}
}
</script>
</html>