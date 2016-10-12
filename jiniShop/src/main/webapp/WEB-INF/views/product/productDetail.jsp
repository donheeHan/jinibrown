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
	<div style="text-align: left; float: left; width:50%;">
	<form>
		<p style="text-align: center; font-size:30px; overflow: hidden; text-overflow: ellipsis;">[${productDetail.p_name}]</p><br>
		<p style="text-align: left; font-size:20px; color:#FF4000; overflow: hidden; text-overflow: ellipsis;">${productDetail.p_info}</p><br> 
		<p style="text-align: left; font-size:20px; overflow: hidden; text-overflow: ellipsis;">판매가 : ${productDetail.p_price}</p> 
		<p style="text-align: left; font-size:20px; overflow: hidden; text-overflow: ellipsis;"><span> 제조사/원산지 : ${productDetail.p_c_name}/국산<br></span></p>
		<br>
			<div><p>주문 수량(최대 5개) :  <select id="c_qty">
							<option selected="selected" value="1">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select></p>
				 <p>색상 선택 : 
						 <select id="c_color">
							<option>red</option>
							<option>black</option>
							<option>blue</option>
							<option>green</option>
							<option>yellow</option>
							<option>gray</option>
							<option>lightGreen</option>
						</select>
						</p>
			</div>   
			<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" onclick="sellInput();" value="구매하기">
			<input type="reset" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" value="옵션 재 선택">
			<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" onclick="cartInput();" value="장바구니 담기">
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
