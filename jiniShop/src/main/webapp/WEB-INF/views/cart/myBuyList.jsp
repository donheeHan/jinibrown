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
	$("#goMyCart").click(function(){
		location.href='/myCart';
	});
	$("#goMain").click(function(){
		location.href='/main';
	});
	$("#datatable").DataTable();

	$(".goProduct").click(function(){
		var p_no = $(this).attr("id");
		location.href='/productDetail?productNo='+p_no+'';
	});
});
</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>구매목록</strong></p>
		<br> 
	</div>  
	<div style="text-align: right; height: 50px;">  
		<input type="button" id="goMyCart" class="button1"value="장바구니 이동">
		<input type="button" id="goMain" class="button1" value="메인 이동">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>구매번호</th>
				<th>상품</th>
				<th>상품명</th>
				<th>상품정보</th>
				<th>가격</th>
				<th>구매 개수</th>
				<th>구매 색상</th>
				<th>총 구매 가격</th>
			</tr>
		</thead>
	    <tbody>
	        	<c:choose>
	        		<c:when test="${empty mySell}">
			        <tr>
	        			<td colspan="5">구매 목록이 없습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="mySell" items="${mySell}">
				        <tr>
				        	<td>${mySell.s_no }</td>
			           		<td><a href="#" class="goProduct" id="${mySell.p_no}">
			           		<img src="/images/productImage/${mySell.p_mainimg }" style="width: 100px; height: 125px;"/></a>
			           		</td>
			           		<td><a href="#" class="goProduct" id="${mySell.p_no}">${mySell.p_name }</a></td>
			           		<td><a href="#" class="goProduct" id="${mySell.p_no}">${mySell.p_info }</a></td>
			           		<td><a href="#" class="goProduct" id="${mySell.p_no}">${mySell.p_price }</a></td>
			           		<td>${mySell.s_c_qty }</td>
			           		<td>${mySell.s_c_color }</td>
			           		<td>${mySell.s_c_qty*mySell.p_price}</td>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table> 

</div>
</body>



