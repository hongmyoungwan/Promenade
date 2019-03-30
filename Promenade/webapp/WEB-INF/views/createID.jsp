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
				<h3>[서브아이디 관리]</h3>
			</div>
			<!--title box  -->
			<div class="tip_box" style="border: 0; height:150px;  margin-top: 50px;">
				<ul>
				
				</ul>
				<div style="width:1000px;">
					<a id="subBtn" onclick="javascript:subIdCreate()"><input type="button" name="" id="btn_r" value="+ 서브아이디 등록" style="width:160px; margin-bottom:20px; float: right;"></a>
				</div>
			</div>
			
			<!-- lst_table01 -->
		<section id="content">
			<div class="lst_table01 mt10">
			    <table id="subAdminTable"border="1" summary="상품조회 및 수정에 대한 내용입니다">
			        <caption></caption>
			        <colgroup>
			            <col style="width:15%;">
			            <col style="width:auto;">
			            <col style="width:15%;">
			        </colgroup>
			        <thead>
			        <tr>
			            <th scope="col">발급일자</th>
			            <th scope="col">서브아이디</th>
			            <th scope="col">메뉴권한</th>
			        </tr>
			        </thead>
			        <tbody>
			      
			        </tbody>
			    </table>
			</div>
			</section>
			<!-- //lst_table01 -->
			
</body>
</html>