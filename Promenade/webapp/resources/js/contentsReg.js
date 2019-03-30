
var gosiJsonList=[];

$(function(){

	appendCalendar($('#p_frDt'));
	appendCalendar($('#p_toDt'));
	imgLayout.init();
	calculateDate('p_toDt', 'p_frDt', '7');
	
	$('.setSearchDateBtn').click(function(){
		$('.setSearchDateBtn').removeClass('btn_s01_on');
		$('.setSearchDateBtn').addClass('btn_s01');
		$(this).removeClass('btn_s01');
		$(this).addClass('btn_s01_on');
	///	setSearchDate($(this).id)
	});
	
	$("#groupCategory").on("change",function(){
		
		var groupCd=$(this).val();
		console.log("in");
		$.ajax({
			url:"/getCategory",
			type:"POST",
			data:{
				group_category_cd:groupCd
			},
			success:function(resultText){
			
				$("#category").html('<option value="">중분류 카테고리</option>');
				var temp ='';
				
				$.each( resultText.category,function(idx,val){
					temp+="<option value="+val.category_cd+">"+val.category_nm+"</option>";
			
				});
				
				$("#category").append(temp);
				
			
			},
			error:function(xhr,status,err){
				console.log(xhr,status,err);
			}
				
		
		});
	});
	
	
$("#category").on("change",function(){
		
		var categoryCd=$(this).val();
		$("#gosiList").empty();
		$.ajax({
			url:"getSubCategory",
			data:{
				categoryCd:categoryCd
			},
			type:"POST",
			success:function(resultText){
				
				$("#subCategory").html('<option value="">소분류 카테고리</option>');
				var temp ='';
				$.each( resultText.subCategory,function(idx,val){
					temp+="<option value="+val.sub_category_cd+">"+val.sub_category_nm+"</option>";
			
					});
				$("#subCategory").append(temp);
				
				$.each( resultText.gosiTitle,function(idx,val){
					var JGoti = {};
					$("#gosiList").append('<ul><li id='+val.goods_amnt_cd+' style="width:100%;">'+val.goods_anmt_title+'</li><li><input type="text" class="gosi" id="" value="" style="width:720px;"></li><br></ul>');
					JGoti.gosiCd=val.goods_anmt_cd;
					JGoti.gosiTitle=val.goods_anmt_title;
					gosiJsonList.push(JGoti);
				});
			}
				
		
		});
	});

$("input:radio[name=deliveryYN]").on("change",function(){
	
	var value=$(":input:radio[name=deliveryYN]:checked").val();
	
	if(value=='0'){
		$(".deli").hide();
	}
	else{
		$(".deli").show();
	}
});









$("input[class^='goodsImgUploadBtn']").on("click",function(){
	var id = $(this).attr('id');
	setPopup('goodsImgPop');
	imgLayout.showLayout('goods', id.charAt(id.length - 1));

});

$("input[class^='detailImgUploadBtn']").on("click",function(){
	var id = $(this).attr('id');
	setPopup("detailImgPop");
	imgLayout.showLayout('detail', id.charAt(id.length - 1));

	
});




$("input:checkbox[id='unlimit']").on("change",function(){

	if($(this).is(":checked")){
		$("#limitValue").attr("readonly",true).css("background-color","#eee");
		
	}
	else{
		$("#limitValue").attr("readonly",false);
	}


});

$("#goodsDetailInfoSelect").on("change",function(){
	var select =$("#goodsDetailInfoSelect option:selected").val();
		if(select=="1"){
			$.each($(".gosi"),function(idx,val){
				$(".gosi").eq(idx).attr("readonly",true).css("background-color","#eee");
				$(".gosi").val("상품이미지 참고");
			});
		}
		else if(select=="2"){
			$.each($(".gosi"),function(idx,val){
				$(val)[0].style.backgroundColor='white';
				$(".gosi").eq(idx).attr("readonly",false).css("backgroud-color","#ffffff");
				$(".gosi").val("");
			});
		}
		
});



$("input[name='action']").on("change",function(){
	if($(this).attr("id")=="link_ac"){
		$(".input_link_num").show();
	}else{
		$(".input_link_num").hide();
	}
	if($(this).attr("id")=="no_ac"){
		$(".input_link_num").hide();
		$(".seller_url").hide();
	}
	if($(this).attr("id")=="url_ac"){
		$(".seller_url").show();
	}
	else{
		$(".seller_url").hide();
	}
})

});



/*	if (str != 'detail')
		imgCrop.Jcrop(imgLayout.setCropOpt(str));
	$('#' + str + 'ImgCropDiv').show();
	imgLayout.setFileNm(str, src.substr(src.lastIndexOf('/')+1), idx);*/








/**
 * 이미지레이아웃
 */
var imgLayout = {
	init : function() {
		this.setEvent();
		this.x =0;
		this.y = 0;
		this.w = 0;
		this.h = 0;
	},

	setEvent : function() {
		// 상품상단 이미지
		$('.goodsImgUploadBtn').click(function() {
			var id = $(this).attr('id');
			imgLayout.showLayout('goods', id.charAt(id.length - 1));
		});

		// 상품리스트 이미지
		$('.contImgUploadBtn').click(function() {
			imgLayout.showLayout('cont');
		});

		// 상품상세 이미지
		$('.detailImgUploadBtn').click(function() {
			var id = $(this).attr('id');
			imgLayout.showLayout('detail', id.charAt(id.length - 1));
		});

		// 이미지 삭제
		$('.img_cancel').click(function() {
			imgLayout.imgInit(this.id);
		});
		
		// 이미지 확대
		$('.g_img').on('click', function(){
			if(this.src.indexOf('product_img') == -1){
				window.open(this.src);
			}
		});
	},

	showLayout : function(str, idx) {
	
	//	setPopup(str + 'ImgDiv');
		$('#' + str + 'ImgIdx').val(idx);
		$('#' + str + 'ImgDiv').show();
	
		// 이미지 존재할 시에 popup창에 보여주기
		var imgSelector = str != 'cont' ? '#' + str + 'ImgView'+idx : '#contentsImg';
	
		if($(imgSelector).attr('src').indexOf('imkImgDump') == -1){
			imgLayout.setCropImg(str, $(imgSelector).attr('src'), idx);			
		}
	},

	hideLayout : function(str) {
		$('#' + str + 'ImgDiv').hide();
		$('#' + str + 'ImgSelectDiv').show();
		$('#' + str + 'ImgCropDiv').hide();
		$('#' + str + 'Img').val('');
		$('#' + str + 'ImgIdx').val('');
	},

	imgInit : function(id) {
		if (confirm('해당이미지를 삭제 하시겠습니까?')) {
			var imgSrc = '/img/imkImgDump.jpg';
			var selector = '', btnSelector = '';
			var idx = id.charAt(id.length - 1);

			if (id.indexOf('goods') > -1) {
				imgLayout.fileNm.goodsUrl[idx] = '';
				selector = '#goodsImgView' + idx;
				btnSelector = '#goodsImgCancel' + idx;
		/*	} else if (id.indexOf('cont') > -1) {
				imgLayout.fileNm.contUrl = '';
				selector = '#contentsImg';
				btnSelector = '#contentsImgCancel';
				imgSrc = '/img/common/header_link_logo4x3.png';*/
			} else if (id.indexOf('detail') > -1) {
				imgLayout.fileNm.detailUrl[idx] = '';
				selector = '#detailImgView' + idx;
				btnSelector = '#detailImgCancel' + idx;
			}

			$(selector).removeClass('cc');
			$(selector).attr('src', imgSrc);
			$(btnSelector).hide()
		}
	},
	
	setCropImg : function(str, src, idx){
		$('#' + str + 'ImgCropDiv').html('');
		$('#' + str + 'ImgSelectDiv').hide();
		var imgCrop = $('<img id="imgCrop" />');
		imgCrop.appendTo($('#' + str + 'ImgCropDiv'));
		imgCrop.attr('src', src);
		if (str != 'detail')
			
			imgCrop.Jcrop(imgLayout.setCropOpt(str));
		$('#' + str + 'ImgCropDiv').show();

		imgLayout.setFileNm(str, src.substr(src.lastIndexOf('/')+1), idx);
	},

	prepareTargetImg : function(str) {
		console.log("str");
		var idx = $('#' + str + 'ImgIdx').val();
		if ($('#' + str + 'Img').val() != '') {
			$.myAjaxForm({
				formId : str + 'ImgFileForm',
				url : str == 'detail' ? '/uploadGoodsDetailImage.ajax' : '/uploadGoodsImage.ajax',
				success : function(responseText) {
				
						imgLayout.setFileNm(str, responseText.fileNm, idx);
						$('#' + str + 'ImgCropDiv').html('');
						$('#' + str + 'ImgSelectDiv').hide();
						var imgCrop = $('<img id="imgCrop" />');
						imgCrop.appendTo($('#' + str + 'ImgCropDiv'));
						imgCrop.attr('src', responseText.fileNmFull);
						imgCrop.css('width', responseText.imgWidth + 'px');
						imgCrop.css('height', responseText.imgHeight + 'px');
						if (str != 'detail')
							imgCrop.Jcrop(imgLayout.setCropOpt(str));
						$('#' + str + 'ImgCropDiv').show();
					
				}
			});
		}
	},

	savaCropImg : function(str, resize, w, h) {
		var idx = $('#' + str + 'ImgIdx').val();
		if (imgLayout.validFile(str, idx)) {
			$.ajax({
				url : '/saveGoodsCropImage.ajax',
				type:"POST",
				data : {
					fileNm : imgLayout.getFileNm(str, idx),
					x : imgLayout.x,
					y : imgLayout.y,
					w : imgLayout.w,
					h : imgLayout.h,
					resize : resize,
					reWidth : w,
					reHeight : h
				},
				success : function(responseText) {
						$('#' + str + 'ImgDiv').show();
						imgLayout.setImgUrl(str, responseText.fileNmFull, idx);
						imgLayout.clearCoords();
						imgLayout.hideLayout(str);
					
				}
			});
		}
	},

	setFileNm : function(str, fileNm, idx) {
		if (str == 'goods') {
			imgLayout.fileNm.goods[idx] = fileNm;
		} else if (str == 'cont') {
			imgLayout.fileNm.cont = fileNm;
		} else if (str == 'detail') {
			imgLayout.fileNm.detail[idx] = fileNm;
		}
	},

	getFileNm : function(str, idx) {
		if (str == 'goods') {
		
			return imgLayout.fileNm.goods[idx];
		} else if (str == 'cont') {
			return imgLayout.fileNm.cont;
		} else if (str == 'detail') {
			return imgLayout.fileNm.detail[idx];
		}
	},

	setImgUrl : function(str, fileNm, idx) {
		var imgSelector = '', btnSelector = '';
		if (str == 'goods') {
			imgLayout.fileNm.goodsUrl[idx] = fileNm;
			imgSelector = '#goodsImgView' + idx;
			btnSelector = '#goodsImgCancel' + idx;
		/*} else if (str == 'cont') {
			imgLayout.fileNm.contUrl = fileNm;
			imgSelector = '#contentsImg';
			btnSelector = '#contentsImgCancel';*/
		} else if (str == 'detail') {
			
			imgLayout.fileNm.detailUrl[idx] = fileNm;
			imgSelector = '#detailImgView' + idx;
			btnSelector = '#detailImgCancel' + idx;
		}
		$(imgSelector).addClass('cc');
		$(imgSelector).attr('src', fileNm);
		$(btnSelector).show()
	},

	validFile : function(str, idx) {
		if ((str == 'goods' && imgLayout.fileNm.goods[idx] == null || imgLayout.fileNm.goods[idx] == '')
				|| (str == 'detail' && imgLayout.fileNm.detail[idx] == null || imgLayout.fileNm.detail[idx] == '')
				|| (str == 'cont' && imgLayout.fileNm.cont == '')) {
			alert('이미지를 선택 해주세요.');
			return false;
		}
		return true;
	},

	fileNm : {
		goods : [],
		detail : [],
		cont : '',
		goodsUrl : [],
		detailUrl : [],
		contUrl : ''
	},

	setCropOpt : function(str) {

		var opt = {
			onChange : imgLayout.setCoords,
			onSelect : imgLayout.setCoords,
			onRelease : imgLayout.clearCoords
		};
	if (str == 'goods') {
			opt.aspectRatio = 1 / 1;
			
		} else if (str == 'cont') {
			opt.aspectRatio = 4 / 3;
		}

		return opt;
	},

	setCoords : function(c) {
		imgLayout.x = Math.round(c.x);
		imgLayout.y = Math.round(c.y);
		imgLayout.w = Math.round(c.w);
		imgLayout.h = Math.round(c.h);
		
	},

	clearCoords : function() {
		imgLayout.x = 0;
		imgLayout.y = 0;
		imgLayout.w = 0;
		imgLayout.h = 0;
	},
	imgIsNull : function(img){
		if(img == null || img == '') img = '/img/etc/imkImgDump.jpg';
		return img;
	},
	
	x : 0,
	y : 0,
	w : 0,
	h : 0
}




function sendDatas(){
	var contentsNm= $("#contentsNm").val();
	var groupCategory=$("#groupCategory option:selected").val();
	var category=$("#category option:selected").val();
	var subCategory=$("#subCategory option:selected").val();
	var sellAmt=$("#sellAmt").val();
	if($("#discount").is(":checked")){
		var discount=parseInt($("#discountMon").val());
		
		if(discount=='' && !isNumber(discount)){
			
			alert("적립금액란을 다시한번 확인해주십시오.");
			return;
		}
	}

	var goodsImg1 = $("#goodsImgView1").attr("src");
	var goodsImg2 = $("#goodsImgView2").attr("src");
	var goodsImg3 = $("#goodsImgView3").attr("src");
	goodsImg1= goodsImg1.indexOf("imkImgDump")<=0?goodsImg1.substring(39):goodsImg1;
	goodsImg2=goodsImg2.indexOf("imkImgDump")<=0?goodsImg2.substring(39):goodsImg2;
	goodsImg3=goodsImg3.indexOf("imkImgDump")<=0?goodsImg3.substring(39):goodsImg3;


	var setting=$("#setting").is(":checked");
	if(setting){
		$("#sellDt").show();
	}
	else{
		$("#sellDt").hide();
	}
	var detailImg1=  $("#detailImgView1").attr("src");
	var detailImg2=  $("#detailImgView2").attr("src");
	var detailImg3= $("#detailImgView3").attr("src");
	var detailImg4= $("#detailImgView4").attr("src");
	var detailImg5=  $("#detailImgView5").attr("src");
	detailImg1=detailImg1.indexOf("imkImgDump")<=0?detailImg1.substring(39):detailImg1;
	detailImg2=detailImg2.indexOf("imkImgDump")<=0?detailImg2.substring(39):detailImg2;
	detailImg3=detailImg3.indexOf("imkImgDump")<=0?detailImg3.substring(39):detailImg3;
	detailImg4=detailImg4.indexOf("imkImgDump")<=0?detailImg4.substring(39):detailImg4;
	detailImg5=detailImg5.indexOf("imkImgDump")<=0?detailImg5.substring(39):detailImg5;

	//var tdchild =$("#optionTable tbody tr").children();
		
	var goodsInfoList=[];
	var contentsInfo =$("#goodsInfo").val();
/*	$.each(contentsInfo,function(idx,val){
		var value = $(val);
		var jGoodsInfo={};
		jGoodsInfo.detail_text=value.val();
		console.log(jGoodsInfo);
		goodsInfoList.push(jGoodsInfo);
	});*/
	var goodsDetailInfoSelect = $("#goodsDetailInfoSelect option:selected").val();
	
	if(goodsDetailInfoSelect=="1"){
		$.each($(".gosi"),function(idx,val){
			var v= $(val);
			
			v.attr("readonly",true).css("backgroud-color","#eee");
			gosiJsonList[idx].gosiValue= "상품이미지 참고";
			gosiJsonList[idx].gosiSelectCd="1";
		});
	}
	else if(goodsDetailInfoSelect=="2"){
		$.each($(".gosi"),function(idx,val){
			var v= $(val);
			v.attr("readonly",false).css("backgroud-color","#ffffff");
			gosiJsonList[idx].gosiValue= v.val();
			gosiJsonList[idx].gosiSelectCd="2";
		});
	}
	else{
		$.each($(".gosi"),function(idx,val){
			var v= $(val);
			v.attr("readonly",false).css("backgroud-color","#ffffff");
			gosiJsonList[idx].gosiValue= v.val();
			gosiJsonList[idx].gosiSelectCd="0";
		});
	}

	var phoneNum1=$("#phoneNum1").val();
	var phoneNum2=$("#phoneNum2").val();
	var phoneNum3=$("#phoneNum3").val();
	var action =$(":input:radio[name=action]:checked").val();
	var resultAction="";
	switch (action) {
	case "0":
		
	case "1":
		resultAction=$("#input_link_no").val()==""?"":$("#input_link_no").val()
			break;
	case "2":
		resultAction=$("#inputURL").val()==""?"":$("#inputURL").val()
		break;
	default:
		break;
	}
	var discountMon =$("#discountMon").val()==""?"0":$("#discountMon").val();
	var deliveryYN = $(":input:radio[name=deliveryYN]:checked").val();
	var jData={
			contentsNm:contentsNm
			,groupCategory:groupCategory
			,category:category
			,subCategory:subCategory
			,goodsImg1:goodsImg1
			,goodsImg2:goodsImg2
			,goodsImg3:goodsImg3
			,detailImg1:detailImg1
			,detailImg2:detailImg2
			,detailImg3:detailImg3
			,detailImg4:detailImg4
			,detailImg5:detailImg5
			,sellAmt:sellAmt
			,contentsInfo:contentsInfo
			,phoneNum1:phoneNum1
			,phoneNum2:phoneNum2
			,phoneNum3:phoneNum3
			,goods_amt:discountMon,
			s_fee:$("#s_fee").val(),
			authority:$("#authority").val(),
			hiddenFileName:$("#hiddenFileName").val(),
			tradeDeliveryText1:$("#trade_delivery_text1").val(),
			tradeDeliveryText2:$("#trade_delivery_text2").val(),
			tradeDeliveryText3:$("#trade_delivery_text3").val(),
			gosiJsonList:JSON.stringify(gosiJsonList),
			sellerNm:$("#sellerNm").val(),
			sellerEmail:$("#sellerEmail").val(),
			

	}
	
	$.ajax({
		url:"/contentsAdd",
		data:jData,
		type:"POST",
		success:function(resultText){
			console.log($(":input:radio[name=action]:checked").val());
			if($(":input:radio[name=action]:checked").val()=="1"){
				
				
			}
			
			location.href="/contentsMng";
		}
	});
	
	
	
}



/**
 * 조회기간 설정
 */
function setMinMaxDate(){

	

	$('#p_frDt').datepicker('option','onSelect',function(selectedDate) {
		$('#p_toDt').datepicker('option', 'minDate', selectedDate);
	});
	$('#p_toDt').datepicker('option','onSelect',function(selectedDate) {
		$('#p_frDt').datepicker('option', 'maxDate', selectedDate);
	});
	
	
}

var fileNm;

function sendFile(){
	  var form = $('#proposalForm')[0];
      var formData = new FormData(form);
      console.log($("#proposal").val());
      $.myAjaxForm({
			formId: 'proposalForm',
			url: '/proposalForm',
			success : function(responseText){
				validationChk = true;
				fileNm = responseText.fileNm;
				alert(responseText.resultMsg);
				if(responseText.resultCd == '900'){//오류가 있으면
					$('#mFileNm').val('');
					$('#massGoodsFileNm').val('');
				}
			}
		});

}















