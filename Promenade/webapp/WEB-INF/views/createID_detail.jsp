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
</head>
<body>
<div class="title_box">
	<jsp:include page="include/submenu.jsp"></jsp:include><br>
				<h3>[수수료 관리]</h3>
			</div>
			<!--title box  -->
			<div class="tip_box">
				<ul>
					
					
				</ul>
			</div>
			<div class="title_con">
				<ul>
					<li>관리자 ID</li>
					<li><input type="text" id="mngId" value="" style="width: 770px;"></li>
				</ul>
				<ul>
					<li>초기 비밀번호</li>
					<li><input type="password" id="pw"value="" style="width: 770px;"></li>
				</ul>
				<ul>
					<li>이름</li>
					<li><input type="text" id="name" value="" style="width: 770px;"></li>
				</ul> 
				<ul>
					<li>권한 번호</li>
					<li><input type="text" id="auth" value="" style="width: 770px;"></li>
				</ul>
			</div>
			<div style="clear:both; width:100%; margin:40px auto;text-align: center;">
				<input type="button" name="" id="btn_r" value="저장" style="width:180px; height:50px; margin: 0 410px; color: #fff;" onclick="javascript:addSubManager()">
			</div>
			
			<script type="text/javascript">
			
			
			function addSubManager(){
				var mngId = $("#mngId").val();
				var pw = $("#pw").val();
				var auth = $("#auth").val();
				var name =$("#name").val();
				$.myAjax({
					url:"/addPartner",
					data:{
						id:mngId,
						pw:pw,
						auth:auth,
						name:name
					},
					success:function(resultText){
						
					}
				});
				
			}
			
			</script>
</body>
</html>