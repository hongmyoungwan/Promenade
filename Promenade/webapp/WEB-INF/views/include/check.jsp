<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
	function login(){
		location.href="/phone/loginX/loginForm";
	}
</script>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인이 필요한 서비스입니다</h4>
        </div>
        <div class="modal-body">
          <p>로그인하시겠습니까?</p>
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal" onclick="login()">YES</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">NO</button>
        </div>
      </div>
    </div>
  </div>
