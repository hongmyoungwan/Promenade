$(function(){

});

function search(){
	
	loginPush();
}



function loginPush(){
	var id = $("#mngId").val();
	var pw = $("#pw").val();
	console.log(id,pw);
	$.ajax({
		url:"/login",
		type:"POST",
		data:{
			id:id,
			pw:pw
		},
		dataType:"json",
		contentsType:"application/json",
		success:function(responseText, textStatus){
			alert(responseText.authority);
			sessionStorage.setItem("auth",responseText.authority);
			if(responseText.resultCd=="000"){
				location.href="normalList";
			}
			else if(responseText.resultCd=="400"){
				alert(resultText.loginCheck);
			}
	
		},
		error:function(xhr,status,err){
			console.log("err",xhr,status,err);
		}
		
		
	});
}