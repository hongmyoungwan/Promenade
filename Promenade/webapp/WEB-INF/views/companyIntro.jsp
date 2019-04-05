<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/resources/js/createID.js"></script>
<script type="text/javascript" src="/resources/jquery.dataTables.js"></script>
<body>
<div class="title_box">
	<jsp:include page="include/submenu.jsp"></jsp:include><br>
				<h3>[회사 소개]</h3>
			</div>
			<!--title box  -->
			<div class="tip_box" style="border: 0; height:150px;  margin-top: 50px;">
				<ul>
				
				</ul>
			</div>
			
			<!-- lst_table01 -->
		<section id="content">
			<div class="lst_table01 mt10">
			    <table id="subAdminTable" border="1" summary="회사 소개 ">
			        <caption></caption>
			        <colgroup>
			            <col style="width:15%;">
			            <col style="width:auto;">
			            <col style="width:15%;">
			        </colgroup>
			        <thead>
			        <tr>
			            <th scope="col">상품담당자</th>
			            <th scope="col">발주 및 CS</th>
			            <th scope="col">정산</th>
			        </tr>
			        </thead>
			        <tbody>
			        	<tr>
				      		<td>오세원 대표 / 010-3475-0813</td>
				      		<td>강현우 팀장 / 010-2985-4986</td>
				      		<td>강현우 팀장 / 010-2985-4986</td>
			      		</tr>
			        </tbody>
			    </table>
			</div>
			</section>
			<!-- //lst_table01 -->
			
</body>
</html>