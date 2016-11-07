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
		
		$("#goBuyList").click(function(){
			location.href='/myBuyList';
		});
		$("#datatable").DataTable();
		
		$(".goProduct").click(function(){
			var c_p_no = $(this).attr("id");
			location.href='/productDetail?productNo='+c_p_no+'';
		});
		

		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		$("#checkBuy").click(function(){
			var valueArr = new Array();
			$("input[type=checkbox]:checked").each(function(){
				valueArr.push($(this).attr("id"));
			});
		   var str = valueArr.toString();
			location.href="/myCartBuyForm?str="+str;
		});
		
		$("#checkTrue").click(function(){
		    var valueArr = new Array();
			$("input[type=checkbox]:checked").each(function(){
				valueArr.push($(this).attr("id"));
			});
		   var str = valueArr.toString();

			$.ajax({
				url : "/myCartDel",
				method : "get",
				data : {
					"str" : str
				},
				type : "json",
				success : function() {
					swal({	
						title:"상품 삭제",
						text:"장바구니에서 상품을 성공적으로 비웠습니다.",
						type:"info"
					},
					function(){						
						self.location.reload();
					});
				}
			});
		});
		
	
	});
</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>장바구니</strong></p>
		<br> 
	</div>  
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th style="width:5%;"><input type="checkbox" id="checkAll" style="width:30px;"/></th>
				<th style="width:20%;">상품</th>
				<th style="width:30%;">상품명</th>
				<th style="width:10%;">수량</th>
				<th style="width:10%;">단가 가격</th>
				<th style="width:10%;">총 가격</th>
			</tr> 
		</thead>
	    <tbody> 
	        	<c:choose>
	        		<c:when test="${empty myCart }">
			        <tr>
	        			<td colspan="8">장바구니가 비었습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="myCart" items="${myCart}">
				        <tr>
				        	<td><input type="checkbox" id="${myCart.c_no}" style="width:30px;"/></td>
				        	<td>
				        	<a href="#" class="goProduct" id="${myCart.c_p_no}">
				        	<img src="/images/productImage/${myCart.p_mainimg }" style="width:200px; height: 125px;"/></a>
				        	</td>
			           		<td><a href="#" class="goProduct" id="${myCart.c_p_no}">${myCart.p_name }</a></td>
			           		<td>${myCart.c_qty }</td>
			           		<td>${myCart.p_price }</td> 
			           		<td>
			           		${(myCart.p_price * myCart.c_qty) }
			           		</td>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table>
	<div>
	<c:if test="${totalPrice != 0 }">
		<br>
		<p style="text-align: left; font-size: 20px;"><strong>TOTAL PRICE :</strong> ${totalPrice }원</p>
	</c:if>
	</div>
	<div style="text-align: center; height: 50px;">
		<input type="button" id="checkTrue" class="button1"value="선택상품 삭제">
		<input type="button" id="checkBuy" class="button1" value="선택상품 구매">
	</div>
	<div>
	
	</div>
		<input type="hidden" value="${buyFalse}" id="buyFalse"/>
</div>
</body>
