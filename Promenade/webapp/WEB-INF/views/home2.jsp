<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no" />

<script src="/js/webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/common.js"></script>
<script type="text/javascript" src="/resources/js/home.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
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
      height:auto;
  }
   .mainContentsTable td {
    border-style: groove;
    border: 0.2px solid #000000;
    		text-align:center;
    height:45px;
     width: 280px;
  }
 
  .mainContentsTable td .showDetailItem{
  
  	background-color : #265583;
  	padding :5 20% 5 20% ;
  	color: white;
  }
	footer {
		color:white;
	}
  	footer a:link{
		color:white;
	}
 
</style>
</head>
<body>

<!-- 1번 -->


<div align="center"><a href="/"><img src="/resources/images/logo.png" style="margin-top:80px;width: 300px; height: 100px"></a><br><br> </div>
	<jsp:include page="include/submenu.jsp"></jsp:include>
<div class="row">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  	<div class="row">
  		<div style="text-align: center; font-size: 20pt;"><strong>BEST</strong></div>
  	 <div id="myCarousel" class="carousel slide "  data-ride="carousel" data-interval="2000">
    <!-- Indicators -->
 
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active" align="center">
       	<table class="mainContentsTable">
       	<tr>
       		<td><img src="/resources/images/items/1/sum.jpg"  >
       		</td>
       		<td><img src="/resources/images/items/2/sum.jpg" >
       		</td>
       		<td><img src="/resources/images/items/3/sum.jpg"   >
       		</td>
       		<td><img src="/resources/images/items/4/sum.jpg"   >
       		</td>
       	</tr>
       	<tr>
	       	<td id="name1">
	       		상품명 : 에디슨 바지걸이 3개 
	       	</td>
	       	<td id="name2">
	       		상품명 : 여행용헤드레스트
	       	</td>
	       	<td id="name3">
	       		상품명 : 목화때수건 4종 1세트
	       	</td>
	       	<td id="name4">
	       		상품명 : 멀티워시키트
	       	</td>
       	</tr>
       	<tr>	
       		<td id="price1">
	       		판매가 : 9,900원
	       	</td>
	       	<td  id="price2">
	       		판매가 : 19,900원
	       	</td>
	       	<td  id="price3">
	       		판매가 : 8,900원
	       	</td>
	       	<td  id="price4">
	       		판매가 : 9,900원
	       	</td>
       	</tr>
       	<tr>	
       		<td id="sprice1">
	       		공급가 : 7,900원
	       	</td>
	       	<td id="sprice2">
	       		공급가 : 15,900원
	       	</td>
	       	<td id="sprice3">
	       		공급가 : 6,900원
	       	</td>
	       	<td id="sprice4">
	       		공급가 : 7,900원
	       	</td>
       	</tr>
       	<tr>	
       		<td id="sfee1">
	       		배송비 : 2,500원
	       	</td>
	       	<td id="sfee2">
	       		배송비 : 2,500원
	       	</td>
	       	<td id="sfee3">
	    	   	배송비 : 2,500원
	       	</td>
	       	<td id="sfee4">
	       		배송비 : 2,500원
	       	</td>
       	</tr>
       	<tr>
       		<td><span class="showDetailItem" data-num="1"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="2"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="3"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="4"><strong>자세히보기</strong></span></td>
       	</tr>
       	</table>
      
      </div>
      
       <div class="item " align="center">
            	<table class="mainContentsTable">
       	<tr>
       		<td><img src="/resources/images/items/5/sum.jpg"  >
       		</td>
       		<td><img src="/resources/images/items/6/sum.jpg" >
       		</td>
       		<td><img src="/resources/images/items/7/sum.jpg"   >
       		</td>
       		<td><img src="/resources/images/items/8/sum.jpg"   >
       		</td>
       	</tr>
       	<tr>
	       	<td id="name5">
	       		상품명 : 에디슨 바지걸이 3개
	       	</td>
	       	<td id="name6">
	       		상품명 : 여행용헤드레스트
	       	</td>
	       	<td id="name7">
	       		상품명 : 목화때수건 4종 1세트
	       	</td>
	       	<td id="name8">
	       		상품명 : 멀티워시키트
	       	</td>
       	</tr>
       	<tr>	
       		<td id="price5">
	       		판매가 : 9,900원
	       	</td>
	       	<td id="price6">
	       		판매가 : 19,900원
	       	</td>
	       	<td id="price7">
	       		판매가 : 8,900원
	       	</td>
	      	<td id="price8">
	       		판매가 : 9,900원
	       	</td>
       	</tr>
       	<tr>	
       		<td id="sprice5">
	       		공급가 : 7,900원
	       	</td>
	       	<td id="sprice6">
	       		공급가 : 15,900원
	       	</td>
	       	<td id="sprice7">
	       		공급가 : 6,900원
	       	</td>
	       	<td id="sprice8">
	       		공급가 : 7,900원
	       	</td>
       	</tr>
       	<tr>	
       		<td id="sfee5">
	       		배송비 : 2,500원
	       	</td>
	       <td id="sfee6">
	       		배송비 : 2,500원
	       	</td>
	       <td id="sfee7">
	    	   	배송비 : 2,500원
	       	</td>
	       	<td id="sfee8">
	       		배송비 : 2,500원
	       	</td>
       	</tr>
       	<tr>
       		<td><span class="showDetailItem" data-num="5"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="6"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="7"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="8"><strong>자세히보기</strong></span></td>
       	</tr>
       	
       	</table>
      
      </div>
       
  
    </div>
		    <ol class="carousel-indicators" style="top: 680px;">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      
			    </ol>
    <!-- Left and right controls -->
    <!-- <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a> -->
  </div>
</div>
</div>
</div>
<div style="margin-top:150px;">
  	<div class="row">
  		<div style="text-align: center; font-size: 20pt;"><strong>Normal</strong></div>
	<div class="normalItem " >
		  <div class="col-sm-1"></div>
		  <div class="col-md-10" align="center"">
		 	<table class="mainContentsTable">
       	<tr>
       		<td><img src="/resources/images/items/1/sum.jpg"  >
       		</td>
       		<td><img src="/resources/images/items/2/sum.jpg" >
       		</td>
       		<td><img src="/resources/images/items/3/sum.jpg"   >
       		</td>
       		<td><img src="/resources/images/items/4/sum.jpg"   >
       		</td>
       	</tr>
       	<tr>
	       	<td id="nname1">
	       		상품명 : 에디슨 바지걸이 3개
	       	</td>
	       	<td id="nname2">
	       		상품명 : 여행용헤드레스트
	       	</td>
	       	<td id="nname3">
	       		상품명 : 목화때수건 4종 1세트
	       	</td>
	       	<td id="nname4">
	       		상품명 : 멀티워시키트
	       	</td>
       	</tr>
       	<tr>	
       		<td id="nprice1">
	       		판매가 : 9,900원
	       	</td>
	      <td id="nprice2">
	       		판매가 : 19,900원
	       	</td>
	       	<td id="nprice3">
	       		판매가 : 8,900원
	       	</td>
	       <td id="nprice4">
	       		판매가 : 9,900원
	       	</td>
       	</tr>
       	<tr>	
       		<td id="nsprice1">
	       		공급가 : 7,900원
	       	</td>
	       <td id="nsprice2">
	       		공급가 : 15,900원
	       	</td>
	       	<td id="nsprice3">
	       		공급가 : 6,900원
	       	</td>
	       	<td id="nsprice4">
	       		공급가 : 7,900원
	       	</td>
       	</tr>
       	<tr>	
       		<td id="nsfee1">
	       		배송비 : 2,500원
	       	</td>
	       <td id="nsfee2">
	       		배송비 : 2,500원
	       	</td>
	       <td id="nsfee3">
	    	   	배송비 : 2,500원
	       	</td>
	       	<td id="nsfee4">
	       		배송비 : 2,500원
	       	</td>
       	</tr>
       	<tr>
       		<td><span class="showDetailItem" data-num="1"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="2"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="3"><strong>자세히보기</strong></span></td>
       		<td><span class="showDetailItem" data-num="4"><strong>자세히보기</strong></span></td>
       	</tr>
       	</table>
	</div>
		</div>
		</div>
	</div>
	
<!-- copyright -->
<footer class="page-footer center-on-small-only stylish-color-dark" style="background-color:#949596;">
<hr>
<div class="footer-copyright" align="center">
        <div class="container-fluid">
            <div id="ft_wr">
        <div id="ft_link">
           <a href="/" class="bt_home" > HOME</a>
	        </div>
		        <div id="ft_catch">
				<p>법인명(상호) : 주식회사 아이마마 대표자(성명) : 이강로  사업자등록번호 : 426-81-00782
				</p>
				<p>
				전화번호 : 1577-0160 이메일 : lkn2110@naver.com 주소 : 경기도 고양시 덕양구 읍내로 15번길 프라자리치 4층
				</p>
			</div>
        <div id="ft_copy">Copyright © <b>imama-kakao.com.</b> All rights reserved.</div>
    </div>

        </div>
    </div>
    <!--/.Copyright-->

</footer>
</body>
</html>
