<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" id="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" href="/resources/css/common.css"/>
<link rel="stylesheet" href="/resources/css/reset.css"/>
<script src="/js/webjars/jquery/3.3.1/jquery.min.js"></script>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- 
<script type="text/javascript" src="resources/js/home.js"></script>
 -->

<title>Home</title>
<style>
.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #cccccc;
}
.carousel-inner{
    z-index: -100;
}
.row{
margin-left: 8%;
z-index: -100;
}
.carousel-indicators li {
	border-color: #cccccc;
}

.carousel-indicators li.active {
	background-color: #cccccc;
}


 .top8 {
	width: 242px;
	height: 242px;
}

.mainTop ul li div img {
	width: 300px;
	height: 300px;
}

.mainTop ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.mainTop ul li {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

.mainTop ul li div {
	text-align: left;
} 

.mainContentsTable td {
    border-style: none;

    text-align:center;
    height:45px;
     width: 280px;
  }
 
  .mainContentsTable td .showDetailItem{
  
  	background-color : #265583;
  	padding :5 20% 5 20% ;
  	color: white;
  }
#goodsList ul  li div img {
	width: 300px;
	height: 300px;
}



</style>
</head>
<body>
	 <%-- <%
		ArrayList<HashMap<String, Object>> list = null;
		list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
		ArrayList<HashMap<String, Object>> normalList = null;
		normalList = (ArrayList<HashMap<String, Object>>) request.getAttribute("normalList");

		String cnt = String.valueOf(request.getAttribute("totalCnt"));
		int totalCnt = Integer.parseInt(cnt);

		int size = normalList.size() / 5;
		int ent = normalList.size() % 5;
		size = ent == 0 ? size : size + 1;

	
	%> --%>
	<!-- 1번 -->

	

	<jsp:include page="include/submenu.jsp"></jsp:include><br>
	<div class="container" style="margin-top: 212px;">
	<div class="row">
		<div></div>
		<div >
			<div class="">
				<strong>BEST</strong>
				<div style="text-align: center; font-size: 20pt;"></div>
				<div id="myCarousel" class="carousel slide " data-ride="carousel"
					data-interval="2000">
				<div class="carousel-inner" role="listbox">
   					   <div class="item active" id="top1" align="center">
							
						</div>
						 <div class="item"id="top2" align="center">
						
						
						</div>
				</div>
					<div class="carousel-inner" role="listbox">
					</div>
					<ol class="carousel-indicators" style="top: 480px;">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>

					</ol>

				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div></div>

			<div class="normalItem " style="margin-top: 150px; ">
				<div class=" ">
					<strong>Normal</strong>
						<div id="goodsList">
						
						
						
						
						
						
						</div>
				

					
				</div>
			</div>
	
	</div>
	<div style="padding-top: 25px; margin: 0 auto; text-align: center" class="inner">
					
					</div>
	<!-- copyright -->
	<footer	style="background-color: #949596;">
		<hr>
		<div class="footer-copyright" align="center">
			<div class="container-fluid">
				<div id="ft_wr">
					<div id="ft_link">
						<a href="/" class="bt_home"> HOME</a>
					</div>
					<div id="ft_catch">
						<p>법인명(상호) : 주식회사 아이마마 대표자(성명) : 이강로 사업자등록번호 : 426-81-00782</p>
						<p>전화번호 : 1577-0160 이메일 : lkn2110@naver.com 주소 : 경기도 고양시 덕양구
							읍내로 15번길 프라자리치 4층</p>
					</div>
					<div id="ft_copy">
						Copyright © <b>imama-kakao.com.</b> All rights reserved.
					</div>
				</div>

			</div>
		</div>
		<!--/.Copyright-->

	</footer>
	</div>
</body>
</html>
