<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="clear"></div>

	<script type="text/javascript">
		$(function(){
			
			$("#bu1").click(function(){
				var poin = parseInt($("#point").val());
				poin = (poin+5000);
				$("#point").val(poin);
			});
			$("#bu2").click(function(){
				var poin = parseInt($("#point").val());
				poin = (poin+10000);
				$("#point").val(poin);
			});
			$("#bu3").click(function(){
				var poin = parseInt($("#point").val());
				poin = (poin+50000);
				$("#point").val(poin);
			});
			
			$("#updateBtn").click(function(){
				var yn = confirm("수정하시겠습니까?");
				if(yn == true){
					var poin = parseInt($("#point").val());
					var id = $("#id").val();
					
					location.href="/admin/adminPointUpdate?id="+id+"&&point="+poin+"";
				}else{
					return false;
				}
			});
		});
	</script>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong style="color:#DA81F5;">${loginInfo.name }</strong>님 회원정보</p>
		<br> 
	</div> 
	<hr>
	<fieldset>
			<fieldset>
				<h3>회원정보 변경</h3>
				<input type="hidden" value="${loginInfo.id }" id="id">
				<table class="simple_table">
					<tr>
						<th style="width: 300px;"><label>User ID</label></th>
						<td>${loginInfo.id }</td>
					</tr>
					<tr>
						<th><label>Name</label></th>
						<td colspan="2">${loginInfo.name }</td>
					</tr>
					<tr>
						<th><label>생년월일</label></th>
						<td colspan="2">${loginInfo.birthday }</td>
					</tr>
					<tr> 
						<th style="width: 300px;"><label>E-Mail</label></th>
						<td colspan="2">${loginInfo.email }</td>
					</tr>
					<tr>
						<th><label>우편번호</label></th>
						<td>${loginInfo.mtemp }</td> 
					<tr>
						<th><label>도로명주소</label></th>
						<td colspan="2">${loginInfo.maddress1 }</td>
					</tr>
					<tr>
						<th><label>상세주소</label></th>
						<td colspan="2">${loginInfo.maddress2 }</td>
					</tr>
					<tr>
						<th><label>잔여포인트</label></th> 
						<td colspan="2"><input type="number" value="${loginInfo.point }" id="point">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="bu1">+5000</button>&nbsp;
						<button id="bu2">+10000</button>&nbsp;
						<button id="bu3">+50000</button> 
						</td>
					</tr> 
				</table>
			</fieldset>
			<div>
			<br><br>
				<input type="button" value="수정" class="button1" id="updateBtn"> 
				<input type="reset" value="취소" onclick="history.back();" class="button1">
			<br><br>
			<br><br>
			</div>
	</fieldset>