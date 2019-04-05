<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.header {
	top: 0;
	width: 100%;
	text-align: left;
	position: fixed;
	background-color: white;
}

nav {
	background-color: black;
	width: 100%;
	float: left;
	
}

.showDetailItem {
	background-color: #265583;
	padding: 5 35% 5 35%;
	color: white;
	margin: auto;
	text-align: center;
}
nav div ul li{
margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;


}
footer {

   left: 0;
   bottom: 0;
   width: 100%;
   background-color: red;
   color: white;
   text-align: center;
}

footer a:link {
	color: white;
}
.container-fluid ul li {
	padding: 20px 20px 20px 20px;
}
</style>
<script type="text/javascript" src="/resources/js/home.js"></script>

<header class="header">
	<div class="logo_area">

		<a href="/"><img src="resources/images/logo.png"
			style="margin-top: 0px; width: 300px; height: 100px"></a>
	</div>
<script type="text/javascript">
	$(function(){
		var auth = sessionStorage.getItem("auth");
		console.log(auth);
		if(auth==0){
			$.each($(".auth"),function(idx, val){
					$(val).show();
			});
		}
		else{
			$.each($(".auth"),function(idx, val){
				$(val).hide();
		});
		}
	});
</script>
<nav class="navbar">

	<div class="container-fluid" style="width: 100%;">

		<ul class="nav navbar-nav">
			<li><a href="/companyIntro">회사소개</a></li>
			<li><a href="javascript:search(1,'0')">전체상품</a></li>
			<li><a href="javascript:search(1,'01')">아이디어</a></li>
			<li><a href="javascript:search(1,'02')">생활</a></li>
			<li><a href="javascript:search(1,'03')">뷰티&패션</a></li>
			<li><a href="javascript:search(1,'04')">가전</a></li>
			<li><a href="javascript:search(1,'05')">스마트</a></li>
			<li><a href="javascript:search(1,'06')">유아동</a></li>
			<li><a href="javascript:search(1,'07')">반려동물</a></li>
			<li class="auths"><a href="/contentsReg">등록하기</a></li>
			<li class="auths"><a href="/sineUp">파트너 만들기</a></li>
			
		</ul>

	</div>
</nav>
</header>
</div>