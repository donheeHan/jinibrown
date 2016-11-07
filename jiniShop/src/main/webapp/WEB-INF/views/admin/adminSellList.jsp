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
	var d = new Date();
	mon = d.getMonth()+1;
	var year = d.getFullYear(); //월별
	var yearY = d.getFullYear(); //연간
	
	yearChart(yearY);//차트로딩
	
	$("#monthDate").val(year+"/"+mon);
	
	var dateInfo = $("#monthDate").val();
	
	monthSearch(dateInfo); //매출테이블 로딩
	
	
	$("#minusY").click(function(){//연 -
		yearY = yearY-1;
		$("#yearDate").val(yearY);
		yearChart(yearY); //리로딩
	});
	
	$("#plusY").click(function(){// 연 +
		yearY = yearY+1;
		$("#yearDate").val(yearY);
		yearChart(yearY); //리로딩
	});
	
	$("#minus").click(function(){//달 -
		mon = mon-1;		
		if(mon == 0){
			year = year-1;
			mon = 12;
		}
		$("#monthDate").val(year+"/"+mon);
		
		dateInfo = $("#monthDate").val();
		
		monthSearch(dateInfo); //매출테이블 리로딩
	});
	
	$("#plus").click(function(){//달 +
		mon = mon+1;
		if(mon == 13){
			year = year+1;
			mon = 1;
		}
		$("#monthDate").val(year+"/"+mon);
		
		dateInfo = $("#monthDate").val();
		
		monthSearch(dateInfo); //매출테이블 리로딩
	});
	
});

function yearChart(yearY){ // 연간 차트

	$("#yearDate").val(yearY);
	$("#myfirstchart").html("");
	$.ajax({
		url : "/admin/sellChart",
		method : "get",
		data : {"year":yearY}, 
		type : "json",
		success : function(data) {
			new Morris.Line({
				  element: 'myfirstchart',
				  data: data,
				  xkey: 'y',
				  ykeys: ['sum', 'profit'],
				  labels: ['총 매출', '순 이익'],
				  ymax:'auto',
				  xmax:'auto'
			});
		},
		error:function(){
			alert("실패");	
		}
	});
}

function monthSearch(month){ //매출 데이터
	
	$.ajax({
		url : "/admin/mainSellProduct",
		method : "get",
		data : {
			"search":"month", "month":month, "index":mon
		}, 
		type : "json",
		success : function(retVal) {
			var values = retVal.getProductMonth; 
			var html="<table class='simple_table' id='datatable'>";
			html+="<thead><tr><th>순번</th><th>구매일</th><th>구매자 번호</th><th>상품 번호</th>	<th>상품 이름</th><th>상품 가격</th><th>판매 수량</th></tr>	</thead><tbody>";
			$.each(values,function(i,v){
				html += "<tr><td>"+(i+1)+"</td>" 
				+ "<td>"+v.s_day+"</td>"
				+ "<td>"+v.s_user+"</td>"
				+ "<td>"+v.s_p_no+"</td>"
				+ "<td>"+v.p_name+"</td>"
				+ "<td>"+v.p_price+"</td>"
				+ "<td>"+v.s_c_qty+"</td>"
				+ "</tr>";
     	  	 });
			html+="</tbody></table>";
			$("#product").html(html);
			
			$("#datatable").DataTable();
		},
		error : function(){
			alert("error");
		}
	});
}
</script>
<div style="text-align: left; height: 50px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>연간 매출현황</strong></p>
		<br> 
</div> 
<div style="height: 60px;">
	<button id="minusY"><</button>
	<input type="text" id="yearDate" style="height: 50px; width: 30%; border: none; text-align: center; font-size: 40px;">
	<button id="plusY">></button>
	<br>
</div>
<!-- 차트 시작 -->
<div id="myfirstchart"></div>
<div style="text-align: left; height: 50px;"> 
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>월별 매출현황</strong></p>
		<br> 
</div> 
<div style="height: 60px;">
	<button id="minus"><</button>
	<input type="text" id="monthDate" style="height: 50px; width: 30%; border: none; text-align: center; font-size: 40px;">
	<button id="plus">></button>
	<br>
</div>
<!-- 매출현황 테이블 시작 -->
<div id="product"></div>
</body>
</html>

