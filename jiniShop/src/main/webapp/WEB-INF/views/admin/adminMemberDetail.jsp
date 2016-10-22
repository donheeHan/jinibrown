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

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#postcodify_search_button").postcodifyPopUp();
			
			$("#pwdBtn").click(function(){
				var yn = confirm("비밀번호를 바꾸시면 재 로그인을 해야합니다. 바꾸시겠습니까?");
				
				if(yn == false){
					return false;
				}else if(yn == true){
					alert("변경완료. 다시로그인해주세요.");
				}
				
			});
		});
	</script>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong style="color:#DA81F5;">${loginInfo.name }</strong>님 Mypage</p>
		<br> 
	</div> 
	<hr>
	<fieldset>
		<form action="/mypageInfo" method="post">
			<fieldset>
				<h3>회원정보 변경</h3>
				<table class="simple_table">
					<tr>
						<th style="width: 300px;"><label>User ID</label></th>
						<td><input type="text" name="id" id="id" value="${loginInfo.id }" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<th><label>Name</label></th>
						<td colspan="2"><input type="text" name="name" id="name" value="${loginInfo.name }" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<th><label>생년월일</label></th>
						<td colspan="2"><input type="text" name="birthday" id="birthday" value="${loginInfo.birthday }" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr> 
						<th style="width: 300px;"><label>E-Mail</label></th>
						<td colspan="2"><input type="text" name="email" id="email" value="${loginInfo.email }"></td>
					</tr>
					<tr>
						<th><label>우편번호</label></th>
						<td><input type="text" name="mtemp" class="postcodify_postcode5" value="${loginInfo.mtemp }" readonly="readonly" />
						<input type="button" id="postcodify_search_button"value="검색" class="button2" style="width: 100px; margin-left: 15px;">
						</td> 
					<tr>
						<th><label>도로명주소</label></th>
						<td colspan="2"><input type="text" name="maddress1" size="40"
							class="postcodify_address" value="${loginInfo.maddress1 }" /></td>
					</tr>
					<tr>
						<th><label>상세주소</label></th>
						<td colspan="2"><input type="text" name="maddress2"
							class="postcodify_details" value="${loginInfo.maddress2 }" /></td>
					</tr>
					<tr>
						<th><label>잔여포인트</label></th> 
						<td colspan="2">${loginInfo.point }원</td>
					</tr> 
				</table>
			</fieldset>
			<div>
			<br><br>
				<input type="submit" value="수정" class="button1" id="infoBtn"> 
				<input type="reset" value="취소" onclick="history.back();" class="button1">
			<br><br>
			<br><br>
			</div>
		</form>
		<form action="mypagePwdInfo" method="post">
		<input type="hidden" name="user_id" value="${loginInfo.id }">
			<fieldset>
				<h3>비밀번호변경</h3>
				<table class="simple_table"> 
					<tr>
						<th style="width: 300px;"><label>Password</label></th>  
						<td colspan="2"><input type="password" name="user_pass"></td>
					</tr>
					<tr>
						<th><label>Retype Password</label></th>
						<td colspan="2"><input type="password" name="pwdCheck"></td>
					</tr>
				</table>
			</fieldset>
			<div class="clear"></div>
			<div>
			<br><br>
				<input type="submit" value="비밀번호변경" class="button1" id="pwdBtn"> 
				<input type="reset" value="취소" onclick="history.back();" class="button1">
			</div>
		</form>
	</fieldset>