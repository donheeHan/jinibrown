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
		$("#goProList").click(function(){
			swal({	
				title:"상품 리스트",
				text:"상품 리스트로 이동합니다.",
			},
			function(){						
				location.href="/admin/productList"
			});
	
		});
	});
	</script>
	<style type="text/css">
		input{
			border:  none;
			background-color: #D5D5D5;
		}
	</style>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>상품등록</strong></p>
		<br> 
	</div>
	<div style="text-align: right; height: 50px;">  
		<input type="button" id="goProList" class="button1" value="상품 리스트">
	</div>
	<hr>
	<fieldset>
		<form action="/admin/addProduct" method="post" enctype="multipart/form-data">
			<fieldset>
				<h3>기본 정보</h3>
				<table class="simple_table">
					<tr>
						<th style="width: 300px;"><label>상품명</label></th>
						<td><input type="text" name="p_name" maxlength="20" title="상품명은 최대  15글자까지 입력할 수 있습니다."></td>
					</tr>
					<tr>
						<th><label>판매가</label></th>  
						<td colspan="2"><input type="text" name="p_price" pattern="[0-9]{1,7}" title="가격은 최대 9,999,999원 까지 입니다."></td>
					</tr>
					<tr>
						<th><label>재고수량</label></th>
						<td><input type="number" name="p_qty" pattern="[0-9]{1,4}" title="재고 수량은 최대  9,999개 입니다."></td>
					</tr>
					<tr>
						<th><label>입고 가격</label></th>
						<td><input type="text" name="p_price2" pattern="[0-9]{1,7}" title="가격은 최대 9,999,999원 까지 입니다."/></td>
					</tr>
					<tr>
						<th><label>구입처</label></th>
						<td>
						<select name="p_c_name">
							<c:forEach items="${clientList}" var="clientList" varStatus="status">
								<option value="${status.count}">${clientList.c_name}</option>
							</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th><label>상품 정보</label></th>
						<td><textArea name="p_info" cols="100" rows="15" style="resize: none;"></textArea></td>
					</tr>
					<tr>
						<th><label>카테고리</label></th>
						<td><select name="p_cate">
							<option value="1" selected="selected">Cheek</option>
							<option value="2">Eye</option>
							<option value="3">Face</option>
							<option value="4">Lip</option>
							<option value="5">SkinCare</option>
							<option value="6">More</option>
						</select></td>
					</tr>
					</table>
					</fieldset>
					<h3>사진 추가</h3>
					<fieldset>
					<table class="simple_table">
					<tr>
						<th><label>메인 이미지 등록</label></th>
						<td colspan="2"><input type="file" name="multiFile1"></td>
					</tr>
					<tr>
						<th><label>추가 이미지 등록</label></th>
						<td><input type="file" name="multiFile2"/></td>
					</tr>
				</table>
			</fieldset>
			<div class="clear"></div>

			<div>
				<input type="submit" value="상품등록" class="button1"> 
				<input type="reset" value="취소" class="button1">
			</div>
		</form>
	</fieldset>