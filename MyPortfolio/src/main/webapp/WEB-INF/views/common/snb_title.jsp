<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
#container{
	width: 90%;
	margin: 0 auto;
}
#replytext{
	height:100px;
	width: 100%;
}
#list{
	text-align: center;
}
#write{
	text-align: right;
}
.table > thead{
	background-color: #b3c6ff;
}
/* Bootstrap 수정 */
.table > thead {
	background-color: #b3c6ff;
}
.table > thead > tr > th {
	text-align: center;
}
.table-hover > tbody > tr:hover {
	background-color: #e6ecff;
}
.table > tbody > tr > td {
	text-align: center;
}
.table > tbody > tr > #title {
	text-align: left;
}
		
#paging {
	text-align: center;
}
		
.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}
		
	/* 애니메이션 지점 설정하기 */
	/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@keyframes blink {
	from {color: white;}
	30% {color: yellow;}
	to {color: red; font-weight: bold;}
	/* 0% {color:white;}
	30% {color: yellow;}
	100% {color:red; font-weight: bold;} */
}

aside{
	flex:1;
	background: white;
	padding: 20px;
	border-radius: 0 16px 16px 0;
}
article{
	flex:8;
	padding:32px;
	border-radius: 16px 0 0 16px;
	background:white;
	border-color:naby;
	border-style:solid;
}
main{
	display: flex;
	gap:32px;
	padding:14px;
}
body{
	line-height:1.6;
}
</style>
<body>
	<aside>
		<nav>
			<c:if test="${title==1}">
				<h2>Community</h2>
					<ul>
						<li><a href="/community/notice" class="list-group-item list-group-item-action">Notice</a></li>
						<li><a href="/community/download" class="list-group-item list-group-item-action">자료실</a></li>
						<li><a href="/community/userApply" class="list-group-item list-group-item-action">RPA License Request</a></li>
					</ul>
			</c:if>
			<c:if test="${title==2}">	
				<h2>study RPA</h2>
					<ul>
						<li><a href="/study/basic" class="list-group-item list-group-item-action">RPA Basic</a></li>
						<li><a href="/study/advanced" class="list-group-item list-group-item-action">RPA Advanced</a></li>
						<li><a href="/study/edu" class="list-group-item list-group-item-action">RPA Education Request</a></li>
					</ul>
			</c:if>
			<c:if test="${title==3}">
				<h2>RPA Task</h2>
					<ul>
						<li><a href="/task/worklist" class="list-group-item list-group-item-action">Work List</a></li>
						<li><a href="" onclick="error()" class="list-group-item list-group-item-action">Work List History</a></li>
					</ul>
			</c:if>
			<c:if test="${title==4}">	
				<h2>RPA Q&A</h2>
					<ul>
						<li><a href="/qna/faq" class="list-group-item list-group-item-action">FAQ</a></li>
						<li><a href="/qna/qna" class="list-group-item list-group-item-action">Q&A</a></li>
					</ul>
			</c:if>
			<c:if test="${title==5}">	
				<h2>개인정보 설정</h2>
					<ul>
						<li><a href="/user/myInfo" class="list-group-item list-group-item-action">개인정보조회</a></li>
						<li><a href="/user/renewalPw" class="list-group-item list-group-item-action">비밀번호 변경</a></li>
					</ul>
			</c:if>
			<c:if test="${title==6}">	
				<h2>관리자 페이지</h2>
					<ul>
						<li><a href="/admin/adminTask" class="list-group-item list-group-item-action">과제 진행 확인</a></li>
						<li><a href="/admin/adminQnA" class="list-group-item list-group-item-action">문의 사항 확인</a></li>
						<li><a href="/admin/userManage" class="list-group-item list-group-item-action">회원 정보 관리</a></li>
					</ul>
			</c:if>			
		</nav>
	</aside>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var session = '<c:out value="${loginId}"/>';
	
	if(session==''||session==null){
		alert("세션이 만료되었습니다.");
		window.location.href="/user/login"
		return false;
	}
});
</script>
</html>