<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<meta charset="utf-8" />
<meta name="viewport" id="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no" />
 <link rel="stylesheet" type="text/css" href="resources/css/reset.css"> 
 	<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css"> 
<script src="js/webjars/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common_h.css">
<link rel="stylesheet" type="text/css" href="resources/css/jquery.Jcrop.css">
<script type="text/javascript" src="resources/js/common.js"></script>
<script type="text/javascript"	src="resources/jquery.form.min.js"></script>
<script type="text/javascript" src="resources/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/jquery.Jcrop.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">


<title>상품등록</title>
<style type="text/css">
.add_img>ul {
	padding-inline-start: 10px;
}
</style>

</head>
<body>
<%
	ArrayList<HashMap<String,Object>> groupCategory = (ArrayList<HashMap<String,Object>> )request.getAttribute("groupCategory");


%>

	<div id="wrap">
		<section id="content">
			<!-- title area -->

			<div align="center">
				<a href="/"><img src="resources/images/logo.png"
					style="margin-top: 80px; width: 300px; height: 100px"></a><br>
				<br>
			</div>
			<jsp:include page="include/submenu.jsp"></jsp:include>
	<!-- 		<div class="tit_area">
				<ul>
					<li><h2>
							<a href="/contentsMng">상품조회/수정</a>
						</h2></li>
					<li><h2>
							<a href="/contentsReg" style="color: #404040;">상품등록</a>
						</h2></li>
					<li><h2>
							<a href="/massContentsReg">상품대량등록</a>
						</h2></li>
					<li><h2>
							<a href="/feeMng">수수료관리</a>
						</h2></li>
				</ul>
			</div>
 -->
			<!-- //title area -->
			<div class="title_box">
				<h3>[상품정보]</h3>
			</div>
			<div class="title_con">
				<ul>
					<li>상품명</li>
					<li><input type="text" id="contentsNm" value="테스트상품"	style="width: 500px;"></li>
				</ul>
				<div class="subtit_area">
					<div>카테고리</div>
					<div class="select_box">
						<div class="sbtn">
							<select name="groupCategory" id="groupCategory">
						        <option value="">그룹 카테고리</option>
						        <%for(HashMap<String,Object> box : groupCategory){ %>
						        <option value="<%=box.get("group_category_cd") %>"><%=box.get("group_category_nm") %></option>
						        <%} %>
						  
						    </select>
						 <select name="category" id="category">
								<option value="all">대분류 카테고리</option>

							</select> <select name="subCategory" id="subCategory">
								<option value="">소분류 카테고리</option>
							</select>

						</div>
					</div>
				</div>
				<ul>
					<li>상품 이미지</li>
					<li>최대 3개까지 등록 가능(최소 1개 등록)</li>
					<li class="add_img" style="width: 87.5%; margin: 0 21.25%;">
						<ul>
							<li><img class="g_img" id="goodsImgView1"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="goodsImgCancel1" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="goodsImgUploadBtn"
								id="goodsImg1" value="이미지 변경" style="width: 160px;"></li>
						</ul>
						<ul>
							<li><img class="g_img" id="goodsImgView2"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="goodsImgCancel2" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="goodsImgUploadBtn"
								id="goodsImg2" value="이미지 변경" style="width: 160px;"></li>
						</ul>
						<ul>
							<li><img class="g_img" id="goodsImgView3"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="goodsImgCancel3" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="goodsImgUploadBtn"
								id="goodsImg3" value="이미지 변경" style="width: 160px;"></li>
						</ul>
					</li>
				</ul>
				<ul></ul>
			</div>
			<div class="title_box">
				<h3>[제안서]</h3>
			</div>
			<div class="title_con">
				
					<form name="proposalForm"  id="proposalForm" enctype="multipart/form-data" method="post" style="text-align: center;">
							<input type="file" id="proposal" name="proposal"value="" onchange="javascript:sendFile()">
						</form>
				
				
			</div>
			
			<div class="title_box">
				<h3>[상품가격]</h3>
			</div>
			<div class="title_con">
				<ul>
					<li style="width: 8%;">공급가</li>
					<li><input type="text" id="discountMon">
					<b style="margin-left: 10px;">원</b></li>
					<li	style="width: 8%; margin-left: 3%; font-size: 1.1em; font-weight: bold;"
						class="discountMon">판매가</li>
					<li class="discountMon" >
					<input type="text" id="sellAmt"><b style="margin-left: 10px;">원</b></li>
					
					<li	style="width: 8%; margin-left: 3%; font-size: 1.1em; font-weight: bold;"
						class="s_fee">배송비</li>
					<li class="s_fee" >
					<input type="text" id="s_fee"><b style="margin-left: 10px;">원</b></li>

				</ul>
			
				

				
			</div>
			<div class="title_box">
				<h3>[상품 추가정보]</h3>
			</div>
			<div class="title_con">
				<ul>
					<li>상품정보</li>
					<li>표시하고자 하는 상품 정보를 입력해주세요</li>
					<li style="margin-left: 16%;">
						<textarea id="goodsInfo" rows="5" cols="100" >
						
						</textarea>
					</li>
				</ul>
				<ul>
					<li>상세 이미지</li>
					<li>상품 상세에 노출되는 이미지. 최대 5개 까지 등록 가능</li>
					<li class="add_img" style="width: 100%; margin: 0 2.1%;">
						<ul>
							<li><img id="detailImgView1"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="detailImgCancel1" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="detailImgUploadBtn"	id="detailImg1" value="이미지 변경" style="width: 160px;"></li>
						</ul>
						<ul>
							<li><img id="detailImgView2"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="detailImgCancel2" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="detailImgUploadBtn"
								id="detailImg2" value="이미지 변경" style="width: 160px;"></li>
						</ul>
						<ul>
							<li><img id="detailImgView3"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="detailImgCancel3" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="detailImgUploadBtn"
								id="detailImg3" value="이미지 변경" style="width: 160px;"></li>
						</ul>
						<ul>
							<li><img id="detailImgView4"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="detailImgCancel4" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="detailImgUploadBtn"
								id="detailImg4" value="이미지 변경" style="width: 160px;"></li>
						</ul>
						<ul>
							<li><img id="detailImgView5"
								src="resources/images/items/imkImgDump.png" width="100%"
								height="100%"></li>
							<li><img id="detailImgCancel5" class="img_cancel"
								src="resources/images/items/pop_del.png"></li>
							<li><input type="button" class="detailImgUploadBtn"
								id="detailImg5" value="이미지 변경" style="width: 160px;"></li>
						</ul>
					</li>
				</ul>
				<ul></ul>
				<ul>
					<li>상품정보공시</li>
					<li style="float: right;"><select name="goodsDetailInfoSelect"
						id="goodsDetailInfoSelect">
							<option value="0">선택해주세요</option>
							<option value="1">상품이미지참고</option>
							<option value="2">상세정보별도표기</option>

					</select></li>
					<li style="float: right; margin-right: 10px;">자동 채우기</li>
					<li id="gosiList" style="width: 100%; margin-left: 4%;"></li>
				</ul>
				<ul style="height: 0;"></ul>
			</div>
			
			
			<div class="title_box">
				<h3>[판매자 정보]</h3>
			</div>
			<!--title box  -->
			<div class="title_con">
				<ul>
					<li>판매자명</li>
					<li><input type="text" id="sellerNm" value="홍길동"
						placeholder="홍길동" style="width: 600px;"></li>
				</ul>
				<ul>
					<li>판매자 이메일</li>
					<li><input type="text" id="sellerEmail" value="cs@abc.com"
						placeholder="cs@abc.com" style="width: 600px;"></li>
				</ul>
				<ul>
					<li>판매자 연락처</li>
					<li><input type="text" id="phoneNum1" list="phoneNo" value="">
						<datalist name="" id="phoneNo">
							<option value="">선택</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="010">010</option>
							<option value="">직접입력</option>
						</datalist> <input type="text" id="phoneNum2" value="3333" maxlength="4">
						<input type="text" id="phoneNum3" value="2222" maxlength="4"></li>
				</ul>
			</div>
			
			<div class="title_con">
				<ul>
					<li>권한</li>
					<li><input type="text" id="authority" value=""
						placeholder="권한 숫자로 ex) 0,1,2  " style="width: 600px;"></li>
				</ul>
				
			</div>
			<div style="margin: 20px 0; text-align: center;">
				<a href="#"><input type="button" name="" id="inputbtn_w"
					value="미리보기" style="width: 160px; height: 40px;"></a> <a
					href="#"><input type="button" name="addContent" id="inputbtn_w"
					value="등록하기"
					style="width: 160px; height: 40px; background: #c20014; color: #fff;"
					onclick="javascript:sendDatas()"></a> <a href="#"><input
					type="button" name="" id="inputbtn_w" value="취소"
					style="width: 160px; height: 40px; background: #404040; color: #fff;"></a>
			</div>
			<!-- //sub title area -->
		</section>
		<!-- //content -->
	</div>

	<!-- 상품이미지 LayerPop -->
	<div id="goodsImgDiv" class="layerpop_wrap goods_layout" style="display:none;">
	<input type="hidden" id="goodsImgIdx">
    <div class="layerpop_mask"></div>
    <div class="layerpop" id="goodsImgPop">
        <div class="layerpop_container">
            <div class="layerpop_header">
                <div class="layerpop_tit"><strong>상품 이미지 등록</strong></div>
                <div class="layerpop_close"><a href="javascript:imgLayout.hideLayout('goods')">닫기</a></div>
            </div>
            <div class="layerpop_content _style">
                <!-- layer content -->
               	<div class="layerpop_tit"><strong>상품 이미지 등록하기</strong></div>
               	<p class="layerpop_txt">2MB 이하의 JPG, JPEG, PNG 등록 가능 (480*480 / 1:1 비율)</p>

               	<ol class="layer_lst01 mt10">
               		<li>1) 파일선택을 클릭해 이미지를 찾습니다</li>
               		<li>2) 선택된 이미지가 아래 편집 영역에 나타납니다</li>
               		<li>3) 마우스로 이미지을 클릭 후 드래그하여 영역을 선택합니다</li>
               		<li>4) 편집완료 버튼을 눌러 이미지를 등록합니다</li>
               	</ol>

               	<div class="layerimg_select mt15" id="goodsImgSelectDiv">
               		<div class="select_btn">               	
               			<form name="goodsImgFileForm" id="goodsImgFileForm" enctype="multipart/form-data" method="post" style="text-align: center;">
							<!-- <input class="imgFile" type="file" name="goodsImg" id="goodsImg" onchange="javascript:tempPrepareTargetImg(event)"/> -->
							<input class="imgFile" type="file" name="goodsImg" id="goodsImg" onchange="javascript:imgLayout.prepareTargetImg('goods')"/>
               				<a  style="position: relative; bottom: 25px;" class="btn btn_d03"><span>파일선택</span></a>
               			</form>
               		</div>
               	</div>
               	<div class="layerimg_select mt15" style="display:none; " id="goodsImgCropDiv">
               	</div> 

                <div class="btn_bbox">
					<a class="btn btn_b01" href="javascript:imgLayout.savaCropImg('goods', true, 480, 480)"><strong>편집완료</strong></a>
					<a class="btn btn_b02" href="javascript:imgLayout.hideLayout('goods')"><strong>취소</strong></a>
				</div>
				<!-- //layer content -->
            </div>
        </div>
    </div>
</div>

	<!-- 상품이미지 LayerPop -->


	<!-- 상품이미지 LayerPop -->
	<div id="detailImgDiv" class="layerpop_wrap goods_layout" style="display: none;">
		<input type="hidden" id="detailImgIdx">
		<div class="layerpop_mask"></div>
		<div class="layerpop" id="detailImgPop">
			<div class="layerpop_container">
				<div class="layerpop_header">
					<div class="layerpop_tit">
						<strong>상품 이미지 등록</strong>
					</div>
					<div class="layerpop_close">
						<a href="javascript:imgLayout.hideLayout('detail')">닫기</a>
					</div>
				</div>
				<div class="layerpop_content form_style">
					<!-- layer content -->
					<div class="layerpop_tit">
						<strong>상품 이미지 등록하기</strong>
					</div>
					<p class="layerpop_txt">2MB 이하의 JPG, JPEG, PNG 등록 가능 (480*480 /
						1:1 비율)</p>

					<ol class="layer_lst01 mt10">
						<li>1) 파일선택을 클릭해 이미지를 찾습니다</li>
						<li>2) 선택된 이미지가 아래 편집 영역에 나타납니다</li>
						<li>3) 마우스로 이미지을 클릭 후 드래그하여 영역을 선택합니다</li>
						<li>4) 편집완료 버튼을 눌러 이미지를 등록합니다</li>
					</ol>

					<div class="layerimg_select mt15" id="detailImgSelectDiv">
						<div class="select_btn">
							<form name="detailImgFileForm" id="detailImgFileForm"enctype="multipart/form-data" method="post"style="text-align: center;">
								<input class="imgFile" type="file" name="detailImg"	id="detailImg"onchange="javascript:imgLayout.prepareTargetImg('detail')" /> 
									<a  style="position: relative; bottom: 25px;" class="btn btn_d03"><span>파일선택</span></a>
						
							</form>
						</div>
					</div>
					<div class="layerimg_select mt15" style="display: none;"
						id="detailImgCropDiv"></div>

					<div class="btn_bbox">
						<a class="btn btn_b01"
							href="javascript:imgLayout.savaCropImg('detail', true, 480, 480)"><strong>편집완료</strong></a>
						<a class="btn btn_b02"
							href="javascript:imgLayout.hideLayout('detail')"><strong>취소</strong></a>
					</div>
					<!-- //layer content -->
				</div>
			</div>
		</div>
		</div>
		<script type="text/javascript" src="resources/js/contentsReg.js"></script>
</body>
</html>