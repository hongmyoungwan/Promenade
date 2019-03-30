<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" id="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no" />

<script src="js/webjars/jquery/3.3.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/common.js"></script>
<script type="text/javascript" src="resources/js/home.js"></script>

<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<title>Home</title>

<style>
.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #000000;
}

.carousel-indicators li {
	border-color: #000000;
}

.carousel-indicators li.active {
	background-color: #000000;
}

.mainContentsTable tr td img {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
	width: 100%;
	height: auto;
}

.mainContentsTable td {
	border-style: groove;
	border: 0.2px solid #000000;
	text-align: center;
	height: 45px;
	width: 280px;
}

.mainContentsTable td .showDetailItem {
	background-color: #265583;
	padding: 5 20% 5 20%;
	color: white;
}

footer {
	color: white;
}

footer a:link {
	color: white;
}

.top8 {
	width: 242px;
	height: 242px;
}
</style>
<script type="text/javascript">





</script>
</head>
<body>
	<%
	
		ArrayList<HashMap<String,Object>>list=null;  
		list=(ArrayList<HashMap<String,Object>>)request.getAttribute("list");
	
	%>
	<!-- 1번 -->


	<div align="center">
		<a href="/"><img src="resources/images/logo.png"
			style="margin-top: 80px; width: 300px; height: 100px"></a><br>
		<br>
	</div>
	<jsp:include page="include/submenu.jsp"></jsp:include>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="row">
				<div style="text-align: center; font-size: 20pt;">
					<strong>BEST</strong>
				</div>
				<div id="myCarousel" class="carousel slide " data-ride="carousel"
					data-interval="2000">
					<!-- Indicators -->

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active lst_table01" align="center">
							<table class="mainContentsTable">
								<tbody>

									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index<4}">
												<td><img class="top8" src="${val.contents_img}"></td>
											</c:if>

										</c:forEach>
										</c:if>
									</tr>
									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index<4}">
												<td>상품명: ${val.contents_name}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">

											<c:if test="${status.index<4}">
												<td>판매가: ${val.price}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>

									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">

											<c:if test="${status.index<4}">
												<td>공급가: ${val.s_price}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>

									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">

											<c:if test="${status.index<4}">
												<td>배송비: ${val.s_fee}</td>
											</c:if>

										</c:forEach>
										</c:if>
									</tr>
									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">

											<c:if test="${status.index<4}">
												
												<td><span class="showDetailItem"
													id="${val.contents_no}"><strong>자세히보기</strong></span></td>
											</c:if>

										</c:forEach>
										</c:if>
									</tr>

								</tbody>
							</table>

						</div>

						<div class="item lst_table01" align="center">
							<table class="mainContentsTable">
								<tbody>
									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index>=4}">
												<td><img class="top8" src="${val.contents_img}"></td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
									<tr>
									<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index>=4}">
												<td>상품명: ${val.contents_name}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
									<tr>
										<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index>=4}">
												<td>판매가: ${val.price}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
									<tr>
									<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index>=4}">
												<td>공급가:${val.s_price}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
									<tr>
									<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index>=4}">
												<td>배송비:${val.s_fee}</td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
									<tr>
									<c:if test="${!empty list}">
										<c:forEach var="val" items="${list}" varStatus="status">
											<c:if test="${status.index>=4}">
												<td><span class="showDetailItem"
													id="${val.contents_no}"><strong>자세히보기</strong></span></td>
											</c:if>
										</c:forEach>
										</c:if>
									</tr>
								</tbody>
							</table>

						</div>


					</div>
					<ol class="carousel-indicators" style="top: 680px;">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>

					</ol>

				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 150px;">
		<div class="row">
			<div style="text-align: center; font-size: 20pt;">
				<strong>Normal</strong>
			</div>
			<div class="normalItem ">
				<div class="item active " align="center">
					<table>
					
					<%int length = list.size()/4; %>
					<%for(int i=0; i<4;i++){ %>
						<tr>
						<%for(int j=0;j<length;j++){ %>
							<td>	
								<table>
								<tr>
									<td>
										<img alt="이미지" src="">
									</td>
								</tr>
								<tr>
									<td>
									</td>
								</tr>
								<tr>
									<td>
									</td>
								</tr>
								<tr>
									<td>
									</td>
								</tr>
								<tr>
									<td>
									</td>
								</tr>
								</table>
							</td>
						<%}%>
						</tr>
					
					<%} %>
					</table>
				</div>

			</div>
		</div>
	</div>

	<!-- copyright -->
	<footer class="page-footer center-on-small-only stylish-color-dark" style="background-color: #949596;">
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
</body>
</html>
