<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no" />
	
	<link rel="stylesheet" href="/resources/css/common.css"/>
	<script src="js/webjars/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="resources/jquery.placeholder.js" ></script>
	<script type="text/javascript" src="resources/js/common.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
<title>로그인</title>
</head>
<body class="login">
<div id="wrap">
	<!-- header -->
	<header id="header">
	<div class="logo_area">
		<a href="/"><img src="resources/images/logo.png"
			style="margin-top: 0; width: 300px; height: 100px"></a><br>
		<br>
	</div>
	<div align="center">

	</div>
	
	</header>	
	<!-- container -->
	<section id="container">
		<!-- content -->
		<section id="content">
			<!-- login -->
			<div class="login_box">
				<h2 class="login_tit">로그인</h2>
				<div class="login_formbox ">
					<ul>
						<li>
							<input type="text" name="" id="mngId" placeholder="아이디를 입력해주세요">
							
						</li>
						<li>
							<input type="password" name="" id="pw" placeholder="비밀번호를 입력해주세요" onkeypress="enterKeySearch(event)"><br>
							<span id="hiddenTag" style="display:none; color:#c20014;"><strong>비밀번호 정보가 유효하지 않습니다</strong></span>
						</li>
					</ul>
					<!-- <ul>
						<li class="id_rmb">
							<input type="checkbox" name="" id="rmdid"> 
							<label for="rmdid">ID저장</label>
						</li>
						<li class="auto_login">
							<input type="checkbox" name="" id="atlog"> 
							<label for="atlog">자동로그인</label>
						</li>
					</ul> -->
					<ul style="margin-top: 50px;">
						<li class="login_btn" onclick="javascript:Join()">
							<a href="#">가입하기</a> 
						</li>
						<li class="login_btn" onclick="javascript:loginPush()" >
							<a href="#">로그인</a> 
						</li>
					</ul>
				</div>
				<div class="login_btnbox">
					<p><a href="/partnerFindPassWord">비밀번호를 잊어버리셨나요?</a></p>
				</div>
			</div>
			<!-- //login -->
		</section>
		<!-- //content -->
	</section>
	<!-- //container -->
</div>

</body>
</html>