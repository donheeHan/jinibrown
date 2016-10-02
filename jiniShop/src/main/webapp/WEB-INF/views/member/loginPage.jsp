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
	<script type="text/javascript">
	$(function(){
		/* 	swal({
				title: "Error!",
				text: "Here's my error message!",
				type: "error",
				confirmButtonText: "Cool" 
			}); */
			//http://t4t5.github.io/sweetalert/

			$("#loginForm").ajaxForm({
				beforeSubmit:function(){
					var id = $("#use_id").val();
					var pwd = $("#use_pwd").val();
					if(id==""||pwd==""){
						swal({
							title: "< Error! >",
							text: "로그인정보를 입력해주세요.",
							type: "error",
							confirmButtonText: "닫기" 
						}); 
						return false;
					}
				},
				dataType:"json",
				success:function(data){
					if(data.message == "error"){
						swal({
							title: "< 로그인 실패 >",
							text: "아이디 패스워드가 맞지 않습니다.",
							type: "error",
							confirmButtonText: "닫기" 
						}); 
						return false;
					}else{
						swal({
							title: "< 로그인 성공 >",
							text: "즐거운하루되세요.",
							type: "success",
						}); 
						var pwd = data.encPwd;
						$("#use_pwd").val(pwd);
						$("#loginForm").ajaxFormUnbind();
						$("#loginForm").attr("action", "/common/loginProcess");
						$("#loginForm").submit();
					}
				},
				error:function(){
					swal({
						title: "< 서버 통신 에러 >",
						text: "서버가 불안정하오니 다시 실행해주세요.",
						type: "error",
						confirmButtonText: "닫기" 
					}); 
				}
			});
			
		});
	</script>
    <div>
          <section> 
            <form name="form" method="post" action="/loginCheck" id="loginForm">
              <h1 style="color:#D8D8D8;">LOGIN</h1> 
              <div>
                <input type="text" class="form-control" name="use_id" id="use_id" placeholder="User ID"/>
              </div> 
              <div> 
                <input type="password" class="form-control" name="use_pwd" id="use_pwd" placeholder="Password"/>
              </div> 
              <div>  
                <input type="submit" value="L O G I N" style="width:100%; height: 30px;">  
              </div> 
           	</form>
          	</section>
    </div>     
</body>
