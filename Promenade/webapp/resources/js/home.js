

$(function(){
	TopSearch();
	search(1,0);
	$(".showDetailItem").css("cursor","pointer");
	$(".showDetailItem").on("click",function(){
	
	var num= $(this).attr("id");
	
	location.href="/contentsDetail?num="+num;
	});
	
	

	
	
	
});


var totalCnt;
var infIndex;
var category;

function search(index,fCategory){	
	
	var index="";
fCategory=fCategory==null?category:fCategory;
index=index==null?infIndex:index;
var jsonItem={};
jsonItem.index=index;
jsonItem.category_cd=fCategory
console.log(jsonItem);
$.myAjax({
	url:"/normalList.ajax",
	data:jsonItem,
	type:"POST",
	success:function(resultText){
		console.log("ina")
		var list =resultText.normalList;
		var infValue="";
		var tc= resultText.totalCnt;
		var t1= tc%20;
		var t2 = tc/20;
		totalCnt = (t1)==0?(t2):(t2)+1;
$("#goodsList").empty();

		$.each(list, function(idx, val){ 

			var infCheckValue ="";
			infValue+=
					"<table class='mainContentsTable' style='display:-webkit-inline-box; width:25%;'>"+
						"<tr>"+
						"	<td>"+
								"<ul class='normalItem'>"+
									"<li>"+	
									"<div>"+
										"<img alt='이미지' src="+val.contents_img+" >"+
										"</div>"+
										"<div> 상품명 :	 "+val.contents_name+" >"+
										"</div>"+
										"<div> 판매가 :	 "+val.price+" >"+
										"<div> 공급가 :	 "+val.s_price+" >"+
										"</div>"+
										"<div> 배송비 :	 "+val.s_fee+" >"+
										"</div>"+
										"<div>"+
										"</div> "+
										"</div>"+
										"</li></ul>"+
										"</td>"+
										"</tr>"+
										"</table>"
										
		
			
				
				
		});
		if(list.length%8!=0){
			var dumyCnt = 20-list.length%20 ;
			for(var i=0; i<dumyCnt;i++){
				infValue+= "<table class='mainContentsTable' style='display:-webkit-inline-box; width:25%;'>"+
				"<tr>"+
				"	<td>"+
						"<ul class='normalItem'>"+
							"<li>"+	
							"<div></div><div></div>"+
								"<div> </div>"+
								"<div></div> "+
								"<div></div>"+
								"<div>"+
								"</div> "+
								"</div>"+
								"</li></ul>"+
								"</td>"+
								"</tr>"+
								"</table>"
				
				
			}
		}
		
		$("#goodsList").append(infValue);
		
		$(".inner").empty();
		var currentPage = resultText.currentPage==""?"1":resultText.currentPage;
		var limitDown=1;
		var limitUp=totalCnt;
		
		if(limitDown>=currentPage-3){
			limitDown=limitDown;
		}
		else {
			limitDown=currentPage-3;
		}
		if(limitUp<=currentPage+3){
			limitUp=limitUp;
		}
		else{
			limitUp=currentPage+3;
		}
		console.log(123,currentPage);
	
		$(".inner").append(
			    '<a id="allPrev" href="#" style="padding:0px 5px 0px 5px;"><span>&lt;&lt;</span></a>'+
			    '<a id="prev" href="#" style="padding:0px 5px 0px 5px;">&lt;</a>'+
			    '<span id="loopCurrntNumber" style="padding:0px 5px 0px 5px;">'+
			    '</span>'+
			    '<a id="next" href="#" style="padding:0px 5px 0px 5px;">&gt;</a>'+
			    '<a id="allNext" href="#" style="padding:0px 5px 0px 5px;"><span>&gt;&gt;</span></a>');
		for(var i = limitDown;i<limitUp;i++ ){
			
			if(currentPage==i)
			$("#loopCurrntNumber").append('<a id='+currentPage+' href="javascript:search('+currentPage+')" class="on">'+currentPage+'</a>');
			else{
				$("#loopCurrntNumber").append('<a style="padding:0px 5px 0px 5px;"id='+i+' href="javascript:search('+i+')" >'+i+'</a>');
			}
		}
		if($("#loopCurrntNumber").text()==''){
			$("#loopCurrntNumber").text(1);
		}
		
		
	},
	error:function(xhr,status,err){
		console.log(xhr,status,err);
	}
});

infIndex=index;
category=fCategory;
}


function TopSearch(){	
	
	var index="";

var jsonItem={};
jsonItem.index=0;
$.myAjax({
	url:"/normalListTop.ajax",
	data:jsonItem,
	type:"POST",
	success:function(resultText){
	
		var list =resultText.normalList;
		var infValue="";
		var infValue2="";
		var tc= resultText.totalCnt;
		var t1= tc%8;
		var t2 = tc/8;
		var ttc = (t1)==0?(t2):(t2)+1;
		
$(".item").empty();
		$.each(list, function(idx, val){ 

			var infCheckValue ="";
			if(idx<=3){
			infValue+=
					"<table class='mainTop' style='display:-webkit-inline-box; width:25%;  float:left;' >"+
						"<tr>"+
						"	<td>"+
								"<ul class='normalItem'>"+
									"<li>"+	
									"<div>"+
										"<img alt='이미지' src="+val.contents_img+" >"+
										"</div>"+
										"<div> 상품명 :	 "+val.contents_name+" >"+
										"</div>"+
										"<div> 판매가 :	 "+val.price+" >"+
										"<div> 공급가 :	 "+val.s_price+" >"+
										"</div>"+
										"<div> 배송비 :	 "+val.s_fee+" >"+
										"</div>"+
										"<div>"+
										"</div> "+
										"</div>"+
										"</li></ul>"+
										"</td>"+
										"</tr>"+
										"</table>"
										
		
			}else{
				infValue2+=
					"<table class='mainTop' style='display:-webkit-inline-box; width:25%; float:left;' >"+
						"<tr>"+
						"	<td>"+
								"<ul class='normalItem'>"+
									"<li>"+	
									"<div>"+
										"<img alt='이미지' src="+val.contents_img+" >"+
										"</div>"+
										"<div> 상품명 :	 "+val.contents_name+" >"+
										"</div>"+
										"<div> 판매가 :	 "+val.price+" >"+
										"<div> 공급가 :	 "+val.s_price+" >"+
										"</div>"+
										"<div> 배송비 :	 "+val.s_fee+" >"+
										"</div>"+
										"<div>"+
										"</div> "+
										"</div>"+
										"</li></ul>"+
										"</td>"+
										"</tr>"+
										"</table>"
			}
				
				
		});
		$("#top1").append(infValue);
		if(ttc<4){
			$("#top2").hide();
		}
		else{

			$("#top2").append(infValue2);
		}


		
		
	},
	error:function(xhr,status,err){
		console.log(xhr,status,err);
	}
});

}





function allPrev(){
	search(1);
}
function allNext(){
	search(totalCnt);
}
