<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script type="text/javascript">
 function cartInput(){
		var passNo=$("#passNo").val();
		$.ajax({
			url : "/insertCart",
			method : "get",
			data : {
				"productNo" : passNo
			},
			type : "json",
			success : function() {
				
			}
		});
		swal("상품 임시저장!", "상품을 성공적으로 장바구니에 담았습니다.","success");
		self.reload();
	}

	function productBuy(frm){
		frm.action="";
		frm.submit();
	}
	
</script>
<style type="text/css">
	hr{
		width:500px;
	}
</style>
	
<div style="margin-left: 400px;">
	<div style="float: left">
		<img src="/resources/testImage/D0${productDetail.p_no}.jpg" style="width: 250px; height: 250px;">
	</div>
	<div style="text-align: left">
	<form>
		<p>[${productDetail.p_name}]&nbsp;${productDetail.p_info}</p><br>
			<p>판매가 : ${productDetail.p_price}</p>
		<p><span>
			제조사/원산지 : ${productDetail.p_c_name}/국산<br>
			배송비 :구매가격이 30,000원 이상일 경우 무료배송 - 택배
		</span></p>
		<br>
			<div>주문 시 옵션 <select>
							<option>-- 선택 --</option>
							<option>선택 옵션 1</option>
							<option>선택 옵션 2</option>
							<option>선택 옵션 3</option>
							<option>선택 옵션 4</option>
						</select>
						
						 <select>
							<option>-- 선택 --</option>
							<option>선택 옵션 1</option>
							<option>선택 옵션 2</option>
							<option>선택 옵션 3</option>
							<option>선택 옵션 4</option>
						</select>
			</div>
			<input type="button" value="구매하기">
			<input type="reset" value="옵션 재 선택">
			<input type="button" onclick="cartInput();" value="장바구니 담기">
			<input type="hidden" id="passNo" value="${productDetail.p_no}">
		</form>
	</div>
</div>
<br>
<div>
</div>







</body>
</html>