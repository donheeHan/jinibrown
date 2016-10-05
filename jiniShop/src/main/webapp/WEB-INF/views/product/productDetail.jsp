<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<body>
<script type="text/javascript">
 function sellInput(){
	 var passNo=$("#passNo").val();
		var c_qty=$("#c_qty").val();
		var c_color=$("#c_color").val();
		$.ajax({
			url : "/insertSell",
			method : "GET",
			data : {
				"productNo" : passNo,
				"c_qty" : c_qty,
				"c_color" : c_color
			},
			type : "json",
			success : function(result) {
				if(result=="ok"){
					swal({
						title:"구매 성공!",
						text:"상품을 성공적으로 구매했습니다.",
						type:"success"
					},
					function(){
						self.location.reload();
					});
				}else{
					swal({
						title:"로그인이 필요합니다!",
						text:"메인페이지로 이동합니다.",
						type:"error"
					},
					function(){
						self.location.href="/main";
					});
				}
			}
		});
 }
 function cartInput(){
		var passNo=$("#passNo").val();
		var c_qty=$("#c_qty").val();
		var c_color=$("#c_color").val();
		$.ajax({
			url : "/insertCart",
			method : "GET",
			data : {
				"productNo" : passNo,
				"c_qty" : c_qty,
				"c_color" : c_color
			},
			type : "json",
			success : function(result) {
				if(result=="ok"){
					swal({
						title:"상품 임시저장!",
						text:"상품을 성공적으로 장바구니에 담았습니다.",
						type:"success"
					},
					function(){
						self.location.reload();
					});
				}else{
					swal({
						title:"로그인이 필요합니다!",
						text:"메인페이지로 이동합니다.",
						type:"error"
					},
					function(){
						self.location.href="/main";
					});
				}
			}
		});
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
	
<div>
	<div style="float: left; width: 40%;">
		<img src="/images/productImage/${productDetail.p_mainimg}" style="width: 60%; height: 300px;">
	</div> 
	<div style="text-align: left; float: left; width:40%;">
	<form>
		<p>[${productDetail.p_name}]&nbsp;${productDetail.p_info}</p><br> 
			<p>판매가 : ${productDetail.p_price}</p>
		<p><span>
			제조사/원산지 : ${productDetail.p_c_name}/국산<br>
			배송비 :구매가격이 30,000원 이상일 경우 무료배송 - 택배
		</span></p>
		<br>
			<div>주문 수량(최대 5개) <select id="c_qty">
							<option selected="selected" value="1">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
				 색상 선택
						 <select id="c_color">
							<option>Red</option>
							<option>Black</option>
							<option>Blue</option>
							<option>Green</option>
							<option>Yellow</option>
							<option>Gray</option>
							<option>LightGreen</option>
						</select>
			</div>
			<input type="button" onclick="sellInput();" value="구매하기">
			<input type="reset" value="옵션 재 선택">
			<input type="button" onclick="cartInput();" value="장바구니 담기">
			<input type="hidden" id="passNo" value="${productDetail.p_no}">
		</form>
	</div>
</div>
<br>
<div>
<hr>
	<img src="/images/productImage/${productDetail.p_subimg}"> 
	
</div>
</body>
