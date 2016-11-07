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
		$("#goProInsert").click(function(){
			swal({	
				title:"상품 등록!",
				text:"상품 등록 페이지로 이동합니다.",
			},
			function(){						
				location.href="/admin/productForm"
			});

		});
		
		$("#datatable").DataTable();
		
		$(".goProduct").click(function(){
			var p_no = $(this).attr("id");
			location.href='/admin/productModify?productNo='+p_no+'';
		});
		

		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		
		
		$("#proDel").click(function(){
		    var valueArr = new Array();
			$("input[type=checkbox]:checked").each(function(){
				valueArr.push($(this).attr("id"));
			});
		   var str = valueArr.toString();

			$.ajax({
				url : "/admin/productDel",
				method : "get",
				data : {
					"str" : str
				},
				type : "json",
				success : function(data) {
					if(data=="ok"){
						swal({	
							title:"상품 삭제",
							text:"선택된 상품을 데이터베이스에서 삭제합니다.",
							type:"info"
						},
						function(){						
							self.location.reload();
						});
					}else{
						swal({	
							title:"실패",
							text:"네트워크 오류로 상품을 삭제하지 못했습니다.",
							type:"err"
						},
						function(){						
							self.location.reload();
						});
					}
				}
			});
		});
	
	});
</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 15px; margin-top:100px; font-size:30px;"><strong>상품관리</strong></p>
		<p style="margin-left: 15px; font-size:15px;"><strong>상품 선택시 상품정보 수정으로 이동합니다.</strong></p>
		<br> 
	</div>  
	<div style="text-align: right; height: 50px;">  
		<input type="button" id="proDel" class="button1"value="선택상품 삭제">
		<input type="button" id="goProInsert" class="button1" value="상품 등록">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th><input type="checkbox" id="checkAll"/></th>
				<th>메인 이미지</th>
				<th>상품명</th>
				<th>상품 정보</th>
				<th>판매 가격</th>
				<th>매입 가격</th>
				<th>카테고리</th>
				<th>재고 수량</th>
				<th>거래처</th>

			</tr>
		</thead>
	    <tbody>
	        	<c:choose>
	        		<c:when test="${empty productList}">
			        <tr>
	        			<td colspan="10">상품 목록이 비었습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="productList" items="${productList}">
				        <tr class="goProduct" id="${productList.p_no}">
				        	<td><input type="checkbox" id="${productList.p_no}"></td>
				        	<td>
				        	<img src="/images/productImage/${productList.p_mainimg}" style="width:100px; height: 125px;"/>
				        	</td>
			           		<td>${productList.p_name }</td>
			           		<td>${productList.p_info }</td>
			           		<td>${productList.p_price }</td>
			           		<td>${productList.p_price2 }</td>
			           		<td>${productList.p_cate }</td>
			           		<td>${productList.p_qty }</td>
			           		<td>${productList.p_c_name }</td> 
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table> 

</div>
</body>
