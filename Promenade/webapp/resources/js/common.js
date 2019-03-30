

$(function(){

});


/**
 * 엔터키로 넘어가게.
 */
function enterKeySearch(event){
	var keyCode = event.keyCode ? event.keyCode : event.which;
	if(keyCode==13){
		search();
	}
}

function appendCalendar(obj){
	$(obj).datepicker({
		dateFormat: 'yy/mm/dd',
		showOn: 'both',
        buttonImage: '/resources/images/date_btn_03.png',
        buttonImageOnly: true
       
	}).datepicker('setDate', new Date());
}



function calculateDate(srcObj, dstObj, diff){
	var date = new Date($('#'+srcObj).val());
	date.setDate(date.getDate() - diff);
	
	$('#'+dstObj).datepicker('setDate', date);


}
function calculateToday( dstObj, diff){
	
	var date = new Date();
	date.setDate(date.getDate() - diff);
	$('#'+dstObj).datepicker('setDate', date);
}
function calculateMonth(srcObj, dstObj, diff){
	var date = new Date($('#'+srcObj).val());
	date.setMonth(date.getMonth() - diff);
	
	$('#'+dstObj).datepicker('setDate', date);
}



/**
 * 팝업 화면 가운데 설정
 * @param id
 */
function setPopup(id){
	var obj = $('#'+id);
	var iHeight = Math.max(0, (($(window).height() - obj.outerHeight()) / 2) + $(window).scrollTop());
	var iWidth = Math.max(0, (($(window).width() - obj.outerWidth()) / 2) + $(window).scrollLeft());
	obj.css({
		position: 'absolute'
		,display:'block'
		,top: iHeight
		,left: iWidth
		});
}
$.myAjax = function(ajaxObj){
	
//	showProgress();
	console.log("aaa");
	//default : POST, JSON
	var _url = ajaxObj.url;
	var _async = ajaxObj.async==null ? true : ajaxObj.async;
	var _type = ajaxObj.type==null ? "POST" : ajaxObj.type;
	var _data = ajaxObj.data==null ? "" : ajaxObj.data;
	var _dataType = ajaxObj.dataType==null ? "json" : ajaxObj.dataType;
	var _success = ajaxObj.success==null ? function(responseText){alert(responseText.resultMsg);} : ajaxObj.success;
	var _fail = ajaxObj.fail==null ? function(responseText){alert(responseText.resultMsg);} : ajaxObj.fail;
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		url: _url,
		type: _type,
		data: _data,
		async: _async,
		dataType: _dataType,
		traditional: true, // 배열처리
	
		success : function(responseText, textStatus){
			
//			hideProgress();
			
			if(_dataType == 'json'){
				console.log(responseText);
				if(responseText.resultCd == "000"||responseText.resultCd == "400"){
					_success(responseText);
				}else{
					_fail(responseText);
				}
			}else{
				_success(responseText);
			}
		},
		error : function(xhr, ajaxOptions, thrownError){
			alert("_url:"+_url+", error:"+xhr.status+", thrownError:"+thrownError+", ajaxOptions:"+ajaxOptions);
			
//			hideProgress();
		}
	});
};


/**
 * ajax form 함수
 * */
$.myAjaxForm = function(ajaxObj){
	$('.layerprogress_wrap').show();
	
	//default : POST, JSON
	var _url = ajaxObj.url;
	var _async = ajaxObj.async==null ? true : ajaxObj.async;
	var _type = ajaxObj.type==null ? 'POST' : ajaxObj.type;
	var _contentsType = ajaxObj.contentsType==null ? 'multipart/form-data' : ajaxObj.contentsType;
	var _dataType = ajaxObj.dataType==null ? 'json' : ajaxObj.dataType;
	var _success = ajaxObj.success==null ? function(responseText){alert(responseText.resultMsg);} : ajaxObj.success;
	var _error = ajaxObj.error==null ? function(xhr){} : ajaxObj.error;
	
	var _formId = ajaxObj.formId;
	
	$('#'+_formId).ajaxForm({
		url: _url,
		type: _type,
		dataType: _dataType,
		contentType : _contentsType,
		success : function(responseText, textStatus){
			$('.layerprogress_wrap').hide();
			_success(responseText);
		},
		error : function(xhr, ajaxOptions, thrownError){
			console.log(xhr);
			console.log(ajaxOptions);
			console.log(thrownError);
			$('.layerprogress_wrap').hide();
			_error(xhr);
		}}).submit();
};



$.FileAjax = function(ajaxObj){
	
	
	//default : POST, JSON
	var _url = ajaxObj.url;
	var _async = ajaxObj.async==null ? false : ajaxObj.async;
	var _type = ajaxObj.type==null ? "POST" : ajaxObj.type;
	var _data = ajaxObj.data==null ? "" : ajaxObj.data;
	var _dataType = ajaxObj.dataType==null ? "json" : ajaxObj.dataType;
	var _success = ajaxObj.success==null ? function(responseText){/*alert(responseText.resultMsg);*/} : ajaxObj.success;
	var _fail = ajaxObj.fail==null ? function(responseText){alert(responseText.resultMsg);} : ajaxObj.fail;
	var _enctype = ajaxObj.enctype==null ? "multipart/form-data" : ajaxObj.enctype;
	var _processData = ajaxObj.processData==null ? false : ajaxObj.processData;
	var _contentType = ajaxObj.contentType==null? false : ajaxObj.contentType;
	var _cache = ajaxObj.cache==null? false : ajaxObj.cache;
	var _timeout = ajaxObj.timeout==null? 600000 : ajaxObj.timeout;
	
	$.ajax({
		url: _url,
		type: _type,
		data: _data,
		async: _async,
		dataType: _dataType,
		enctype: _enctype,
		processData: _processData,
		contentType: _contentType,
		cache: _cache,
		timeout: _timeout,
		traditional: true, // 배열처리
		
		success : function(responseText, textStatus){
					
			
		},
		error : function(xhr, ajaxOptions, thrownError){
			alert("_url:"+_url+", error:"+xhr.status+", thrownError:"+thrownError+", ajaxOptions:"+ajaxOptions);
			
		}
	});
	
};

function StringLimit(str,count){
	str= str.toString();

	if(str.length>=count){
		return str.substring(0,count);
	}
	else{
		return str;
	}
}

/**
* 텍스트박스 숫자만
 * */
function numOnly(obj,event) {
	var keyCode = event.keyCode ? event.keyCode : event.which;
	if (keyCode == 9 || keyCode == 37 || keyCode == 39) return;
	var returnValue = "";
	var int=0;
	for (var i = 0; i < obj.value.length; i++){
		if (obj.value.charAt(i) >= "0" && obj.value.charAt(i) <= "9"){
			returnValue += obj.value.charAt(i);
		}else{
			int++;
			returnValue += "";
		}
	}
	obj.focus();
	obj.value = returnValue;
}



function formatDate(dt) {
	if(dt == undefined) return;
	if(dt.length == 6){
		return dt.substr(0,4)+'.'+dt.substr(4,2);
	}else if(dt.length == 8){
		return dt.substr(0,4)+'.'+dt.substr(4,2)+'.'+dt.substr(6,2);
	}else if(dt.length == 10){
		return dt.substr(0,4)+'.'+dt.substr(4,2)+'.'+dt.substr(6,2)+' '+dt.substr(8,2);
	}
	else if(dt.length == 14){
		return dt.substr(0,4)+'.'+dt.substr(4,2)+'.'+dt.substr(6,2)+' '+dt.substr(8,2)+':'+ dt.substr(10,2)+':'+ dt.substr(12,2);
	}
}















