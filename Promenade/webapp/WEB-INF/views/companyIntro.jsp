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
<script type="text/javascript" src="/resources/js/companyIntro.js"></script>
<script type="text/javascript" src="/resources/jquery.dataTables.js"></script>
<body>
<div class="title_box">
	<jsp:include page="include/submenu.jsp"></jsp:include><br>
				<h3>[회사 소개]</h3>
			</div>
			<!--title box  -->
			<div class="tip_box" style="border: 0; height:150px;  margin-top: 50px;">
				<ul>
					<li>
						<h3>회사 소개</h3>
					</li>
				</ul>
			</div>
			
			<!-- lst_table01 -->
			<section id="content">
			    <table class="table" summary="회사 소개 ">
			        <tr>
			            <th>상품담당자</th>
			            <td>오세원 대표 / 010-3475-0813</td>
			        </tr>
		        	<tr>
			      		<th>발주 및 CS</th>
			      		<td>강현우 팀장 / 010-2985-4986</td>
		      		</tr>
		      		
		      		<tr>
			      		<th>정산</th>
			      		<td>강현우 팀장 / 010-2985-4986</td>
		      		</tr>
			    </table>
			
			</section>
			<!-- //lst_table01 -->
			
		<!-- copyright -->
		<footer	style="background-color: #949596;">
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