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
$(function(){
	$("#oneShow").click(function(){
		$("#one").show();
		$("#two").hide();
		$("#three").hide();
	});
	$("#twoShow").click(function(){
		$("#one").hide();
		$("#two").show();
		$("#three").hide();
	});
	$("#threeShow").click(function(){
		$("#one").hide();
		$("#two").hide();
		$("#three").show();
	});
 $("#buyCash").click(function(){
	 var passNo=$("#passNo").val();
		var c_qty=$("#c_qty").text();
		var c_color=$("#c_color").text();
		var stackPoint=$("#stackPoint").val();
		$.ajax({
			url : "/insertSell",
			method : "GET",
			data : {
				"productNo" : passNo,
				"c_qty" : c_qty,
				"c_color" : c_color,
				"buyMethod" : "1",
				"stackPoint" : stackPoint
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
						location.href="/myBuyList";
					});
				}else if(result=="err"){
					swal({
						title:"로그인이 필요합니다!",
						text:"메인페이지로 이동합니다.",
						type:"error"
					},
					function(){
						self.location.href="/main";
					});
				}else{
					swal({
						title:"포인트 에러",
						text:"포인트 합산에 오류가 있습니다. 관리자에게 문의해주세요.",
						type:"info"
					},
					function(){
						self.location.href="/main";
					});
				}
			}
		});
 });
 $("#buyPoint").click(function(){
	 var passNo=$("#passNo").val();
	 var c_qty=$("#c_qty").text();
		var c_color=$("#c_color").text();
		$.ajax({
			url : "/insertSell",
			method : "GET",
			data : {
				"productNo" : passNo,
				"c_qty" : c_qty,
				"c_color" : c_color,
				"buyMethod" : "2"
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
						location.href="/myBuyList";
					});
				}else if(result=="err"){
					swal({
						title:"로그인이 필요합니다!",
						text:"메인페이지로 이동합니다.",
						type:"error"
					},
					function(){
						self.location.href="/main";
					});
				}else{
					swal({
						title:"포인트 에러",
						text:"포인트 합산에 오류가 있습니다. 관리자에게 문의해주세요.",
						type:"info"
					},
					function(){
						self.location.href="/main";
					});
				}
			}
		});
 });
$("#buyCashPoint").click(function(){
		var passNo=$("#passNo").val();
		var c_qty=$("#c_qty").text();
		var c_color=$("#c_color").text();
		var point = $("#setPoint").val();
		var myPointInput = $("#myPoint").val();
		var priceInput = $("#price").val();
		point *= 1;
		myPointInput *= 1;
		priceInput *= 1;
		if(point>priceInput){
			swal({
				title:"포인트 확인!",
				text:"상품가격 보다 입력한 포인트가 많습니다.",
				type:"info"
			},
			function(){
				self.location.reload();
			});
		}else if(point>myPointInput){
			swal({
				title:"포인트 확인!",
				text:"사용 포인트가 현재 내포인트보다 많습니다.",
				type:"error"
			},
			function(){
				self.location.reload();
			});
		}else{
		$.ajax({
			url : "/insertSell",
			method : "GET",
			data : {
				"productNo" : passNo,
				"c_qty" : c_qty,
				"c_color" : c_color,
				"buyMethod" : "3",
				"setPoint" : point
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
						location.href="/myBuyList";
					});
				}else if(result=="err"){
					swal({
						title:"로그인이 필요합니다!",
						text:"메인페이지로 이동합니다.",
						type:"error"
					},
					function(){
						self.location.href="/main";
					});
				}else{
					swal({
						title:"포인트 에러",
						text:"포인트 합산에 오류가 있습니다. 관리자에게 문의해주세요.",
						type:"info"
					},
					function(){
						self.location.href="/main";
					});
				}
			}
		});
		}
});
});
</script>
<style type="text/css">
	hr{
		width:500px;
	}
</style>
	
<div>
	<div style="float: left; width: 40%;">
		<img src="/images/productImage/${productInfo.p_mainimg}" style="width: 60%; height: 300px;">
	</div> 
	<div style="text-align: left; float: left; width:50%;">
	<form>
		<p style="text-align: center; font-size:30px; overflow: hidden; text-overflow: ellipsis;">단일 상품 구매 주문확인서</p><br>
		<p style="text-align: left; font-size:20px; color:#FF4000; overflow: hidden; text-overflow: ellipsis;">${productInfo.p_name}</p><br> 
		<p style="text-align: left; font-size:20px; color:#FF4000; overflow: hidden; text-overflow: ellipsis;">${productInfo.p_info}</p><br> 
		<p style="text-align: left; font-size:20px; overflow: hidden; text-overflow: ellipsis;">판매가 : ${productInfo.p_price}</p> 
		<p style="text-align: left; font-size:20px; overflow: hidden; text-overflow: ellipsis;"><span> 제조사/원산지 : ${productInfo.p_c_name}/국산<br></span></p>
		<br>
			<div><p>주문 수량 : <span id="c_qty">${c_qty}</span></p>
				 <p>주문 총 가격 : ${c_qty*productInfo.p_price}</p>
				 <p>선택 색상 선택 : <span id="c_color">${c_color}</span></p>
			</div>   
			<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" id="oneShow" value="현금결제">
			<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" id="twoShow" value="포인트 결제">
			<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" id="threeShow" value="현금&포인트 결제">
			<input type="hidden" id="passNo" value="${productInfo.p_no}">
			<input type="hidden" id="price" value="${productInfo.p_price}">
			<input type="hidden" id="myPoint" value="${memberInfo.point}">
			
			<div id="one" style="border: 3px solid lightGray; display: none">
				<div>
					<h3>상품의 총 가격은 ${c_qty*productInfo.p_price} 입니다.</h3>
					<h2>결제 정보</h2>
					<h4>${productInfo.p_name} _ <span style="color:red;">${productInfo.p_info }</span></h4>
						<br>
					<h3>색상 : ${c_color}<br></h3>
					<h3>가격 : ${productInfo.p_price}<br></h3>
					<h3>제조사/원산지 : ${productInfo.p_c_name}/국산</h3>
					
					<h4>결제 금액의 5%는 포인트로 적립 됩니다.</h4>
					<h5>현재 나의 포인트 : ${memberInfo.point}</h5>
					<h5>상품 구매시 누적될 포인트 : <fmt:formatNumber value="${c_qty*productInfo.p_price*0.05}" pattern="0"/></h5>
					
					<input type="hidden" value="<fmt:formatNumber value='${c_qty*productInfo.p_price*0.05}' pattern='0'/>" id="stackPoint">
					<p style="text-align: center;">
					<br><br>
						<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" id="buyCash" value="최종 구매">
					</p>
				</div>
			</div>
			<div id="two" style="border: 3px solid lightGray; display: none;">
				<div>
					<h3>상품의 총 가격은 ${c_qty*productInfo.p_price} 입니다.</h3>
					<h2>결제 정보</h2>
					<h4>${productInfo.p_name} _ <span style="color:red;">${productInfo.p_info }</span></h4>
						<br>
					<h3>색상 : ${c_color}<br></h3>
					<h3>가격 : ${productInfo.p_price}<br></h3>
					<h3>제조사/원산지 : ${productInfo.p_c_name}/국산</h3>
					
					<h5>현재 나의 포인트 : ${memberInfo.point}</h5>
					<c:if test="${memberInfo.point>=c_qty*productInfo.p_price}">
						<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" id="buyPoint" value="최종 구매">
					</c:if>
					<c:if test="${memberInfo.point<c_qty*productInfo.p_price}">
						<h3>보유하신 포인트가 적어 결제가 불가능합니다.</h3>
					</c:if>
				</div>
			</div>
			<div id="three" style="border: 3px solid lightGray; display: none;">
				<div>
					<h3>상품의 총 가격은 ${c_qty*productInfo.p_price} 입니다.</h3>
					<h2>결제 정보</h2>
					<h4>${productInfo.p_name} _ <span style="color:red;">${productInfo.p_info }</span></h4>
						<br>
					<h3>색상 : ${c_color}<br></h3>
					<h3>가격 : ${productInfo.p_price}<br></h3>
					<h3>제조사/원산지 : ${productInfo.p_c_name}/국산</h3>
					
					<h5>현재 나의 포인트 : ${memberInfo.point}</h5>
					
					<input type="text" id="setPoint" style="width:300px;" placeholder="사용하실 포인트를 입력하세요(100P 이상)">
					<input type="button" class="button2" style="width: 150px; height:30px; font-size:15px; margin-right: 10px;" id="buyCashPoint" value="최종 구매">
					
				</div>
			</div>
		</form> 
		<input id="p_price" type="hidden" value="${productInfo.p_price}"/>
	</div>
</div>
<br>
<div>
<hr>
	<img src="/images/productImage/${productInfo.p_subimg}"> 
	
</div>
</body>
