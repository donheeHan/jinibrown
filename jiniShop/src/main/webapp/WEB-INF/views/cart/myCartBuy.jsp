<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<body>
<script>
	$(function(){
		var status = $("#buyFalse");
			if(status=="false"){
				alert("포인트부족");
			}else if(status=="true"){
				alert("선택상품이 없습니다.");			
			}
		
		$("#goCart").click(function(){
			location.href='/myCart';
		});
		$("#datatable").DataTable();
		
		$(".goProduct").click(function(){
			var c_p_no = $(this).attr("id");
			location.href='/productDetail?productNo='+c_p_no+'';
		});
		$("#buyCash").click(function(){
			var valueArr = new Array();
			$("span").each(function(){
				valueArr.push($(this).attr("id"));
			});
				
		   var str = valueArr.toString();

			$.ajax({
				url : "/myCartBuy",
				method : "get",
				data : {
					"str" : str,
					"buyMethod" : "1"
				},
				type : "json",
				success : function(data) {
					if(data=="ok"){
						swal({
							title:"구매성공!!",
							text:"구매에 성공했습니다.",
							type:"success"
						},
						function(){
							location.href="/myBuyList";
						});
					}else if(data=="noPoint"){
						swal({
							title:"포인트 부족!",
							text:"구매 상품보다 포인트가 부족합니다.",
							type:"info"
						},
						function(){
								self.location.reload();
						});
					}else if(data=="noProduct"){
						swal({
							title:"상품 미선택!",
							text:"선택하신 상품이 없습니다.",
							type:"info"
						},
						function(){
								self.location.reload();								
						});
					}
				}
			});
		});
		
		$("#buyPoint").click(function(){
			var valueArr = new Array();
			$("span").each(function(){
				valueArr.push($(this).attr("id"));
			});
				
		   var str = valueArr.toString();

			$.ajax({
				url : "/myCartBuy",
				method : "get",
				data : {
					"str" : str,
					"buyMethod" : "2"
				},
				type : "json",
				success : function(data) {
					if(data=="ok"){
						swal({
							title:"구매성공!!",
							text:"구매에 성공했습니다.",
							type:"success"
						},
						function(){
							location.href="/myBuyList";
						});
					}else if(data=="noPoint"){
						swal({
							title:"포인트 부족!",
							text:"구매 상품보다 포인트가 부족합니다.",
							type:"info"
						},
						function(){
								self.location.reload();
						});
					}else if(data=="noProduct"){
						swal({
							title:"상품 미선택!",
							text:"선택하신 상품이 없습니다.",
							type:"info"
						},
						function(){
								self.location.reload();							
						});
					}
				}
			});
		});
		$("#showInput").click(function(){
			$("#showText").show();
		});
		$("#buyCashPoint").click(function(){
			var myPoint = $("#getMyPoint").val();
			var point = $("#setPoint").val();
			var productSumInput = $("#productSum").val();
			myPoint *= 1;
			point *=1;
			productSumInput *= 1;
			var valueArr = new Array();
			$("span").each(function(){
				valueArr.push($(this).attr("id"));
			});
				
		   var str = valueArr.toString();
		   if(point>productSumInput){
			   swal({
					title:"포인트 확인",
					text:"입력하신 포인트가 상품 가격보다 많습니다.",
					type:"error"
				},
				function(){
					self.location.reload();
				});
		   }
		   else if(point>myPoint){
			   swal({
					title:"포인트 확인",
					text:"입력하신 포인트가 나의 포인트보다 많습니다.",
					type:"error"
				},
				function(){
					self.location.reload();
				});
		   }else if(point!=""){
				$.ajax({
					url : "/myCartBuy",
					method : "get",
					data : {
						"str" : str,
						"setPoint" : point,
						"buyMethod" : "3"
					},
					type : "json",
					success : function(data) {
						if(data=="ok"){
							swal({
								title:"구매성공!!",
								text:"구매에 성공했습니다.",
								type:"success"
							},
							function(){
								location.href="/myBuyList";
							});
						}else if(data=="noPoint"){
							swal({
								title:"포인트 부족!",
								text:"구매 상품보다 포인트가 부족합니다.",
								type:"info"
							},
							function(){
									self.location.reload();
							});
						}else if(data=="noProduct"){
							swal({
								title:"상품 미선택!",
								text:"선택하신 상품이 없습니다.",
								type:"info"
							},
							function(){
									self.location.reload();
							});
						}
					}
				});
			}else{
				swal({
					title:"포인트를 입력하세요.!",
					text:"포인트를 다시한번 확인해 주세요.",
					type:"error"
				},
				function(){
						self.location.reload();
				});
			}
		});
		
	});
</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>결제하기</strong></p>
		<br> 
	</div>  
	<div style="text-align: right; height: 50px;">  
		<input type="button" id="goCart" class="button1" value="장바구니로 이동">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th style="width:25%;">상품</th>
				<th style="width:15%;">상품명</th>
				<th style="width:25%;">상품정보</th>
				<th style="width:10%;">수량</th>
				<th style="width:10%;">색상</th>
				<th style="width:10%;">단가 가격</th>
				<th style="width:10%;">총 가격</th>
			</tr> 
		</thead>
	    <tbody> 
	        	<c:choose>
	        		<c:when test="${empty selectList }">
			        <tr>
	        			<td colspan="8">구매 확인 목록 불러오기에 실패했습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="myCart" items="${selectList}">
				        <tr>
				        	<td><span id="${myCart.c_no}">
				        	<a href="#" class="goProduct" id="${myCart.c_no}">
				        	<img src="/images/productImage/${myCart.p_mainimg }" style="width:100px; height: 125px;"/></a></span>
				        	</td>
			           		<td><a href="#" class="goProduct" id="${myCart.c_no}">${myCart.p_name }</a></td>
			           		<td><a href="#" class="goProduct" id="${myCart.c_no}">${myCart.p_info }</a></td>
			           		<td>${myCart.c_qty }</td>
			           		<td><span style="color:${myCart.c_color };">${myCart.c_color }</span></td>
			           		<td>${myCart.p_price }</td> 
			           		<td>${(myCart.p_price * myCart.c_qty) }</td>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table>
	<div>
		<h3>총 구매 금액은 ${sum} 입니다. 결제 버튼을 누르면 결제가 진행됩니다.</h3>
		<input type="hidden" value="${sum}" id="productSum">
	</div>
	<div style="text-align: center; height: 50px;">
		<input type="button" id="buyCash" class="button1" value="현금 결제">
		<input type="button" id="buyPoint" class="button1" value="포인트 결제">
		<input type="button" id="showInput" class="button1" value="현금&포인트 결제">
	</div>
	<div id="showText" style="display: none;">
		<p style="font-size: 20px;">현재 나의 포인트 : ${myPoint}</p>
		<input type="number" id="setPoint" style="width:260px;" placeholder="사용할 포인트를 입력하세요(100P 이상)">
		<input type="button" id="buyCashPoint" class="button1" value="결제 확인">
		<input type="hidden" id="getMyPoint" value="${myPoint}">
	</div>
		<input type="hidden" value="${buyFalse}" id="buyFalse"/>
</div>
</body>
