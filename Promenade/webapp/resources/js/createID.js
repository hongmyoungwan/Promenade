
$(function(){
	
	
	 showUserList();
	
});
function showUserList(){

	$('#subAdminTable').DataTable({
		sPaginationType: 'full_numbers'
	    ,bStateSave: true
	    ,bDestroy: true
	    ,bSort: false
	    ,bInfo: false
	    ,bAutoWidth: false
	    ,bProcessing : true
	    ,serverSide : true
	    ,sDom : 'l<"#topBtn"><"#massDeliveryBtn">tip' // dom position 
    	,ajax : {
			url : '/showUserList',
			type : 'POST',
		
			dataSrc : function(jsonData){
				console.log(jsonData);
				return jsonData.subList;
			},
			error : function(xhr, ajaxOptions, thrownError) {
				checkLogin(xhr);
			}
		}
		,aoColumns: [
					{mData: 'reg_dt', mRender:function(reg_dt,type,fullData){
						return formatDate(reg_dt);
						
					}},
		             {mData: 'member_name', mRender:function(mng_id,type,fullData){
						//return '<img class="goods_img1" id="'+url+'"src="'+domainUrl+url+'">';
						return mng_id;
						
					}},
					
				    {mData: 'member_seq', mRender:function(member_seq,type,fullData){
						//return '<img class="goods_img1" id="'+url+'"src="'+domainUrl+url+'">';
				    	var html ='<input type="text" style="width:30px;" id="authority'+member_seq+'" value="'+fullData.authority+'">';
				    	html+='<input type="button" id='+member_seq+' onclick="javascript:updateAuth(this)" value="수정">';
						return html;
						
					}}
					
				
		    ],
		    fnDrawCallback: function( oSettings ) {
				// 체크박스 non check
		
				
				// jqTransform 스타일 적용
			//	jqTransformCheckBoxStyle('input:checkbox[name="orderConfirmCheckBox"]');
		    },
			oLanguage: {
			oPaginate: {
				sFirst : '&lt;&lt;',
				sPrevious : '&lt;',
				sNext : '&gt;',
				sLast : '&gt;&gt;'
	        }
	        ,sZeroRecords :'데이터가 없습니다.'
			,sEmptyTable :''
			,sLengthMenu: '<select id="rowView">'+
		        '<option value="10">10</option>'+
		        '<option value="30">30</option>'+
		        '<option value="50">50</option>'+
		        '<option value="100">100</option>'+
		        '<option value="200">200</option>'+
		        '</select>'
		}
		    
});
	
	$(".sbtn").css("margin-bottom","10px");
	//$("#subAdminTable_paginate").css("text-align","center").css("margin-top","10px");
	$("#subAdminTable_paginate").addClass("paging");
	if($("#subAdminTable_paginate span").text()==""){
		$("#subAdminTable_paginate span").text("0");
	}


}


function updateAuth(id){
	var idValue =$(id).attr("id");
	var authority =$("#authority"+idValue).val();
	$.myAjax({
		url:"/updateAuth",
		data:{id:idValue,authority:authority},
		success:function(resultText){
			alert("수정하였습니다.");
		}
	});
	
}




function subIdCreate(){
	location.href="/createSubId";
}



