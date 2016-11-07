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

function selectEvent(selectObj) {
	if(($("#pqty").val()*1)<(selectObj.value*1)){
		$("#checkQty").hide();
		swal("재고수량이 부족합니다.","구매 갯수를 다시한번 확인해주세요.", "error");
	}
	if(($("#pqty").val()*1)>=(selectObj.value*1)){
		$("#checkQty").show();
	}
	
	$("#price").html("총 구매 가격 : "+($("#pp").val()*selectObj.value)+"원");
}
 function sellInput(){
	 	if($("#loginId").val() == ""){
	 		swal({
				title:"로그인이 필요합니다!",
				text:"메인페이지로 이동합니다.",
				type:"error"
			},
			function(){
				self.location.href="/main";
			});
	 	}else{
		 	var productNo=$("#passNo").val();
			var c_qty=$("#c_qty").val();
			var c_color=$("#c_color").val();
			location.href="/productBuy?productNo="+productNo+"&c_qty="+c_qty+"&c_color="+c_color;
	 	}
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
	<input type="hidden" value="${loginUser.id }" id="loginId">
	<div style="float: left; width: 40%;">
		<img src="/images/productImage/${productDetail.p_mainimg}" style="width: 60%; height: 300px;">
	</div> 
	<div style="text-align: left; float: left; width:50%;">
	<form>
		<input type="hidden" value="${productDetail.p_price}" id="pp"/>
		<input type="hidden" value="${productDetail.p_qty}" id="pqty"/>
		<p style="text-align: center; font-size:30px; overflow: hidden; text-overflow: ellipsis;">[${productDetail.p_name}]</p><br>
		<p style="text-align: left; font-size:20px; color:#FF4000; overflow: hidden; text-overflow: ellipsis;">${productDetail.p_info}</p><br> 
		<p style="text-align: left; font-size:20px; overflow: hidden; text-overflow: ellipsis;">판매가 : ${productDetail.p_price}</p> 
		<p style="text-align: left; font-size:20px; overflow: hidden; text-overflow: ellipsis;"><span> 제조사/원산지 : ${productDetail.p_c_name}/국산<br></span></p>
		<br>
			<div>
			<h4>＊＊＊＊＊＊＊현재 재고 수량 : ${productDetail.p_qty }＊＊＊＊＊＊＊</h4>
			<p>주문 수량_1회 1개 :  <select id="c_qty" onchange="javascript:selectEvent(this)">
							<option selected="selected" value="1">1개</option>
						</select></p>
					<p id="price">총 구매 가격 : ${productDetail.p_price }</p>
			</div> 
			<c:if test="${productDetail.p_qty>0}">
				<div id="checkQty">
					<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" onclick="sellInput();" value="구매하기">
					<input type="reset" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" value="옵션 재 선택">
					<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" onclick="cartInput();" value="장바구니 담기">
				</div>
			</c:if>
			<input type="hidden" id="passNo" value="${productDetail.p_no}">  
		</form> 
		<input id="p_price" type="hidden" value="${productDetail.p_price}"/>
	</div>
</div>
<br>
<div>
<hr>
	<img src="/images/productImage/${productDetail.p_subimg}"> 
	
</div>
</body>
