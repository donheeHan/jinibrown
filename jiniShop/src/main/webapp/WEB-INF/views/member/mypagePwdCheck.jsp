<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<body> 
<script>
	$(function(){
		$("#confirm").click(function(){
			
			if($("#pass").val() == ""){
				swal("비밀번호를 입력해주세요.");
				return false;
			}
			
			var pass = $("#pass").val();
			
			$.ajax({
				url:"mypagePwdRequire",
				type:"post",
				data:{"pass":pass},
				success:function(data){
					if(data == "Y"){
						location.href="/mypageForm";
					}else{
						swal("비밀번호가 맞지 않습니다.\n 다시 입력 해주세요.");
						$("#pass").val("");
						$("#pass").focus();
					}
				},
				error:function(){
					alert("실패");
				}
			});
		});
	})
</script>
    <div>   	
	    <div style="text-align: center; height: 30px;">
			<p style="margin-top:100px; font-size:30px;"><strong>MY PAGE PASSWORD CHECK</strong></p>
			<br> 
		</div>  
		<hr>
     	<div>
     		비밀번호 : <input type="password" id="pass"> <input type="button" value="확인" class="button2" id="confirm"> 
     	</div>
     	<hr>
     	<div>
     		
     	</div>
    </div>     
</body>
