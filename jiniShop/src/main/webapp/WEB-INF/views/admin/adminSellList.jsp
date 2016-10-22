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
	
	$.ajax({
		url : "/admin/mainSellProduct",
		method : "get",
		data : {
			"search":"month"
		}, 
		type : "json",
		success : function(retVal) {
			var values = retVal.getProductMonth; 
			var html="<table class='simple_table' id='datatable'>";
			html+="<thead><tr><th>구매일</th><th>구매자 번호</th><th>상품 번호</th>	<th>상품 이름</th><th>상품 가격</th><th>판매 수량</th></tr>	</thead><tbody>";
			var sum=0;
			$.each(values,function(i,v){
				html += "<tr><td>"+v.s_day+"</td>"
				+ "<td>"+v.s_user+"</td>"
				+ "<td>"+v.s_p_no+"</td>"
				+ "<td>"+v.p_name+"</td>"
				+ "<td>"+v.p_price+"</td>"
				+ "<td>"+v.s_c_qty+"</td>"
				+ "</tr>";
				sum+=(v.s_c_qty*v.p_price);
     	  	 });
			html+="</tbody></table>";
			var htmlCode = sum;
			$("#product").html(html);
			$("#sum").html("총 판매금액 : "+htmlCode+"원");
			$("#datatable").DataTable();
		},
		error : function(){
			alert("error");
		}
	});
	
	$("#dayProduct").click(function(){
		$.ajax({
			url : "/admin/mainSellProduct",
			method : "get",
			data : {
				"search":"day"
			},
			type : "json",
			success : function(retVal) {
				var values = retVal.getProductMonth; 
				var html="<table class='simple_table' id='datatable'>";
				html+="<thead><tr><th>구매일</th><th>구매자 번호</th><th>상품 번호</th>	<th>상품 이름</th><th>상품 가격</th><th>판매 수량</th></tr>	</thead><tbody>";
				var sum=0;
				$.each(values,function(i,v){
					html += "<tr><td>"+v.s_day+"</td>"
					+ "<td>"+v.s_user+"</td>"
					+ "<td>"+v.s_p_no+"</td>"
					+ "<td>"+v.p_name+"</td>"
					+ "<td>"+v.p_price+"</td>"
					+ "<td>"+v.s_c_qty+"</td>"
					+ "</tr>";
					sum+=(v.s_c_qty*v.p_price);
	     	  	 });
				html+="</tbody></table>";
				var htmlCode = sum;
				$("#product").html(html);
				$("#sum").html("총 판매금액 : "+htmlCode+"원");
				$("#datatable").DataTable();
			},
			error : function(){
				alert("error")
			}
		});
		 
	});
	$("#monthProduct").click(function(){
		$.ajax({
			url : "/admin/mainSellProduct",
			method : "get",
			data : {
				"search":"month"
			}, 
			type : "json",
			success : function(retVal) {
				var values = retVal.getProductMonth; 
				var html="<table class='simple_table' id='datatable'>";
				html+="<thead><tr><th>구매일</th><th>구매자 번호</th><th>상품 번호</th>	<th>상품 이름</th><th>상품 가격</th><th>판매 수량</th></tr>	</thead><tbody>";
				var sum=0;
				$.each(values,function(i,v){
					html += "<tr><td>"+v.s_day+"</td>"
					+ "<td>"+v.s_user+"</td>"
					+ "<td>"+v.s_p_no+"</td>"
					+ "<td>"+v.p_name+"</td>"
					+ "<td>"+v.p_price+"</td>"
					+ "<td>"+v.s_c_qty+"</td>"
					+ "</tr>";
					sum+=(v.s_c_qty*v.p_price);
	     	  	 });
				html+="</tbody></table>";
				var htmlCode = sum;
				$("#product").html(html);
				$("#sum").html("총 판매금액 : "+htmlCode+"원");
				$("#datatable").DataTable();
			},
			error : function(){
				alert("error");
			}
		});
	});
	
});
</script>
<div style="text-align: left; height: 50px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>매출현황</strong></p>
		<br> 
</div> 
<div style="text-align: right; height: 50px;">  
		<input type="button" id="monthProduct" class="button1"value="월별 매출">
<!-- 		<input type="button" id="weekProduct" class="button1" value="최근 일주일 매출"> -->
		<input type="button" id="dayProduct" class="button1" value="당일 매출">
	</div>
	<div id="product"></div>
	<div id="sum" style="text-align: left; font-size: 30px;"></div>
</body>
</html>

