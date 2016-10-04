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

			$.ajax({
				url : "/myCartBuy",
				method : "get",
				data : {
					"str" : str
				},
				type : "json",
				success : function() {
					swal({
						title:"상품 구매",
						text:"선택한 상품을 성공적으로 구매하였습니다.",
						type:"info"
					},
					function(){
							self.location.reload();
					});
				}
			});
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
	<div style="text-align: right; height: 50px;">  
		<input type="button" id="checkTrue" class="button1"value="선택상품 삭제">
		<input type="button" id="checkBuy" class="button1" value="선택상품  구매">
		<input type="button" id="goBuyList" class="button1" value="구매 목록으로 이동">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th style="width:25%;">상품</th>
				<th style="width:15%;">상품명</th>
				<th style="width:45%;">상품정보</th>
				<th style="width:10%;">가격</th>
				<th style="width:5%;"><input type="checkbox" id="checkAll"/></th>
			</tr>
		</thead>
	    <tbody>
	        	<c:choose>
	        		<c:when test="${empty myCart }">
			        <tr>
	        			<td colspan="5">장바구니가 비었습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="myCart" items="${myCart}">
				        <tr>
				        	<td>
				        	<a href="#" class="goProduct" id="${myCart.c_no}">
				        	<img src="/images/productImage/${myCart.p_mainimg }" style="width:100px; height: 125px;"/></a>
				        	</td>
			           		<td><a href="#" class="goProduct" id="${myCart.c_no}">${myCart.p_name }</a></td>
			           		<td><a href="#" class="goProduct" id="${myCart.c_no}">${myCart.p_info }</a></td>
			           		<td>${myCart.p_price }</td>
				        	<td><input type="checkbox" id="${myCart.c_no}"/></td>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table> 

</div>
</body>
