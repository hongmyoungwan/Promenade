<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	
<style type="text/css">
.downLoad{
	padding: 25px 10px;
	color: white;
	
	width: 100%;
	height: 80px;
    border-radius: 5px;
    text-align: center;
    margin-bottom: 0px;
}
</style>
<title>상품 상세보기</title>
<%
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute("data");
%>
</head>
<body>
	<div align="center">
		<a href="/"><img src="/resources/images/logo.png"
			style="margin-top: 80px; width: 300px; height: 100px"></a><br>
		<br>
	</div>
	<jsp:include page="include/submenu.jsp"></jsp:include>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="row">
				<div style="text-align: center; font-size: 20pt;">
					<strong>상품이름</strong>
				</div>
				<div class="col-sm-1"></div>

				<div>
					<table style="text-align: center; width: 1224px;">
						<colgroup>
							<col style="width: 50%"></col>
							<col style="width: 50%"></col>
						</colgroup>
						<tr>
							<td rowspan="5"><img alt="썸낼" src="${data.contents_img}"width="100%" height="auto"></td>
							<td>${data.contents_name}</td>
						</tr>
						<tr>
							<td>${data.price}</td>
						</tr>
						<tr>
							<td>${data.s_price}</td>
						</tr>
						<tr>
							<td>${data.s_fee}</td>
						</tr>
						<tr>
							<td><span class="downLoad" style="background-color: #265583; float: left;"><strong>제안서</strong><br><strong>다운로드</strong></span>
							<span class="downLoad" style="background-color: black; float: left;"><strong>이미지</strong><br><strong>다운로드</strong></span>
							<span class="downLoad" style="background-color: gray; float: left;"><strong>문의하기</strong></span></td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty data.contents_img_detail1}"><img alt="디테일"	src="${data.contents_img_detail1}" width="600"></c:if> </td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty data.contents_img_detail2}"><img alt="디테일"	src="${data.contents_img_detail2}" width="600"></c:if></td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty data.contents_img_detail3}"><img alt="디테일"	src="${data.contents_img_detail3}" width="600"></c:if></td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty data.contents_img_detail4}"><img alt="디테일"	src="${data.contents_img_detail4}" width="600"></c:if></td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty data.contents_img_detail5}"><img alt="디테일"	src="${data.contents_img_detail5}" width="600"></c:if></td>
						</tr>
						
						
					</table>

				</div>
			</div>

		</div>
	</div>
</body>
</html>