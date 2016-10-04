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
				type:"success"
			},
			function(){						
				location.href="/admin/productForm"
			});

		});
		
		$("#datatable").DataTable();
		
		$(".goProduct").click(function(){
			var p_no = $(this).attr("id");
			location.href='/productDetail?productNo='+p_no+'';
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
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>장바구니</strong></p>
		<br> 
	</div>  
	<div style="text-align: right; height: 50px;">  
		<input type="button" id="proDel" class="button1"value="선택상품 삭제">
		<input type="button" id="goProInsert" class="button1" value="상품 등록">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>메인 이미지</th>
				<th>서브 이미지</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>상품 정보</th>
				<th>판매 가격</th>
				<th>매입 가격</th>
				<th>카테고리</th>
				<th>재고 수량</th>
				<th>거래처</th>
				<th><input type="checkbox" id="checkAll"/></th>

			</tr>
		</thead>
	    <tbody>
	        	<c:choose>
	        		<c:when test="${empty productList}">
			        <tr>
	        			<td colspan="5">상품 목록이 비었습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="productList" items="${productList}">
				        <tr>
				        	<td>
				        	<a href="#" class="goProduct" id="${productList.p_no}">
				        	<img src="/resources/productImage/${productList.p_mainimg}" style="width:75px; height: 75px;"/></a>
				        	</td>
				        	<td>
				        	<a href="#" class="goProduct" id="${productList.p_no}">
				        	<img src="/resources/productImage/${productList.p_subimg}" style="width:75px; height: 75px;"/></a>
				        	</td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_no }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_name }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_info }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_price }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_price2 }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_cate }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_qty }</a></td>
			           		<td><a href="#" class="goProduct" id="${productList.p_no}">${productList.p_c_name }</a></td>
				        	<td><input type="checkbox" id="${productList.p_no}"/></td>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table> 

</div>
</body>
