<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type = "text/javascript" >
$(function(){
		$("#re").click(function(){
			alert("준비중입니다.");
		});
		
		
		
		$("#domain1").change(function(){
			$("#domain").val($(this).val()=="직접입력"?"":$(this).val());
		});
		
		var pattern1 = /^[0-9]*$/; //생년월일 숫자만
		var pattern2 = "^[a-zA-Z]*$"; //영문자만
		var pattern3 = "^[가-힣]*$"; //한글만
		var pattern4 = /^[a-zA-Z0-9]*$/; //영어 & 숫자만
		var pattern5 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //email
		var pattern6 = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$"; // 핸드폰
		var pattern7 = "^(\\d+)[/|\\-|\\s]+[0|1](\\d)[/|\\-|\\s]+([0|1|2|3]\\d)$"; //연 월 일 ex 57/4/12
		var pattern8 = "^[_a-zA-Z0-9\\-]+@[\\._a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,}";// 이메일
		var pattern9 = /^(?=.*[a-zA-Z]+)(?=.*[!@#$%^*+=-]|.*[0-9]+).{4,20}$/; //4~20자리 영+문자 혼합 /아이디/
		var pattern10 = /(?=([a-zA-Z0-9].*(\W))|((\W).*[a-zA-Z0-9])$).{10,30}/; //10자 이상 ~30자 이내 영숫특수문자 혼합 포함 
		var pattern11 = /^\d{3,4}$/; //휴대폰번호 가운뎃자리 자리수만
		var pattern12 = /^\d{4}$/; //휴대폰번호 마지막자리 자리수만
		var pattern13 =  /(?=([a-zA-Z0-9].*(\d))|((\d).*[a-zA-Z0-9])$).{4,20}/; //아이디 유효성
		var mailCheck = false;
		
		//유효성체크
		$("#nextBtn").click(function(){
			
			//email유효성
			if($("#email").val()=="" || $("#domain").val()==""){
				alert("이메일을 입력해주세요 ");
				$("#email").focus();
				mailCheck=false;
				return mailCheck;
			}else if(!(pattern5.test($("#email").val()+$("#domain").val()))){
				alert("이메일 형식에 맞지 않습니다. 다시입력해주세요")
				$("#email").focus();
				mailCheck=false;
				return mailCheck;
			//이름 공백유효성
			}else if($("#name").val()==""){
				alert("이름을 입력해주세요.");
				$("#name").focus();
				mailCheck=false;
				return mailCheck;
			//id유효성
			}else if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				mailCheck=false;
				return mailCheck; 
			}else if($("#id").val().length < 4 || $("#id").val().length > 21){
				alert("아이디는 4~20자리 이내로 입력해주세요.");						
				$("#id").focus();
				mailCheck=false;
				return mailCheck;
			}else if(!(pattern13.test($("#id").val()))){
				alert("아이디는 영문, 숫자를 포함하여 입력해주세요.");
				$("#id").focus();
				mailCheck=false;
				return mailCheck; 
			//비밀번호 유효성
			}else if(!(pattern10.test($("#pwd").val()))){
				alert("비밀번호는 영문, 숫자, 특수문자를 포함한 10자 이상 ~ 30자 이내로 입력해주세요.")
				$("#pwd").focus();
				mailCheck=false;
				return mailCheck; 
			}else if(!($("#pwd").val()==$("#pwdCheck").val())){
				alert("재입력한 비밀번호의 값이 맞지않습니다. 다시입력해주세요.");
				$("#pwd").focus();
				mailcheck=false;
				return mailCheck; 
			//생일 유효성
			}else if($("#birth").val()==""){
				alert("생년월일을 입력해주세요");
				$("#birth").focus();
				mailcheck=false;
				return mailCheck;
			}else if(!($("#birth").val().length == 8)){
				alert("생년월일을 8자리로 형식에 맞게 입력해주세요. ex)19000101");
				$("#birth").focus();
				mailcheck=false;
				return mailCheck;
			}else if(!(pattern1.test($("#birth").val()))){
				alert("생년월일을 형식에맞게 숫자로만 입력해주세요. ex)19000101");
				alert($("#birth").val());
				$("#birth").focus();
				mailcheck=false;
				return mailCheck;
			//핸드폰 유효성
			}else if(!(pattern11.test($("#phone2").val()))){
				alert("당신의 휴대폰번호가 맞습니까? 제대로 입력해주세요.");
				$("#phone2").focus();
				mailCheck=false;
				return mailCheck; 
			}else if(!(pattern12.test($("#phone3").val()))){
				alert("당신의 휴대폰번호가 맞습니까? 제대로 입력해주세요.");
				$("#phone3").focus();
				mailCheck=false;
				return mailCheck; 
			}else{
				mailcheck=true;
			}

		});
	});
</script>
		<style>
			table{margin:0px;}

			ul{list-style:none;}
			.main1{width : 130px; height : 70px; padding-left : 10px;}
			.main2{width : 550px; height : 70px; padding-left : 10px;}
			#nextBtn{width : 200px; height : 50px; font-size:15px; background-color:#0040FF; color:white;}
			#select1{color:#58ACFA;}
			.emailCheck{font-size:12px;}
			#idall{font-size:12px;}
			.id1{color:#58ACFA;}
			#from{width : 150px; height:25px;}
			.tel{width : 80px;}
			#last1{color:#58ACFA; font-size : 14px;}
			#last2{font-size : 12px;}
			#tablelast{width:700px;}
			table{border-collapse:collapse;}
			
		</style>
	</head>
	<body>
			<h1>회 원 가 입</h1>
			<div>
				<form method="post" action="./memberJoin.do">
					<ul>
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>이메일</td>
									<td class='main2'><input type = "text" name="email" id="email"></input>&nbsp;@&nbsp;
									<input type = "text" name="domain" id="domain">
										<select id="domain1">
											<option value = "직접입력" selected>직접입력</option>
											<option value = "naver.com">naver.com</option>
											<option value = "hanmail.net">hanmail.net</option>
											<option value = "gmail.com">gmail.com</option>
											<option value = "hotmail.com">hotmail.com</option>								
										</select>
										<br>
										<input type="checkbox"> <span class = "emailCheck">이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.</span>
										<span id="select1" class="emailCheck">(선택)</span>
									</td>
								</tr>
							</table>
						</li>
						
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>성명</td>
									<td class='main2'><input type = "text" name= "name" id="name"></input></td>
								</tr>
							</table>
						</li>
						
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>회원ID</td>
									<td class='main2'><input type = "text" name="id" id="id"></input>&nbsp;&nbsp;&nbsp;<input type="button" value="중복확인" id="re" name="re"></input><br>
									<span id="idall"><span class="id1">* &nbsp;</span><span>영문, 숫자를 포함한</span><span class="id1">&nbsp;4자 이상~20자 이내</span><span>(공백입력불가)</span></span></td>
								</tr>
							</table>
						</li>
						
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>비밀번호</td>
									<td class='main2'><input type = "password" name="pwd" id="pwd"></input><br>
									<span id="idall"><span class="id1">* &nbsp;</span><span>영문, 숫자,특수문자를 포함한</span><span class="id1">&nbsp;10자 이상~30자 이내</span><span>(공백입력불가)</span></span></td>
								</tr>
							</table>
						</li>
						
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>비밀번호 재입력</td>
									<td class='main2'><input type = "password" name="pwdCheck" id="pwdCheck"></input></td>
								</tr>
							</table>
						</li>
						
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>생년월일</td>
									<td class='main2'><input type = "text" name="birth" id="birth"></input><br>
									<span id="idall"><span class="id1">* &nbsp;</span><span>출생연도, 월, 일을 포함한</span><span class="id1">&nbsp;숫자 8자 예) 19000101(만 14세 미만 가입 불가)</span></span></td>
								</tr>
							</table>
						</li>
						
						<li>
							<table style="border:'1px solid black;">
								<tr>
									<td class='main1'>휴대폰번호</td>
									<td class='main2'>
										<select name = "national" id = "national">
											
											<option value="GH">가나 (233)</option>
											
											<option value="GA">가봉 (241)</option>
											
											<option value="GY">가이아나 (592)</option>
											
											<option value="GM">감비아 (220)</option>
											
											<option value="GT">과테말라 (502)</option>
											
											<option value="GD">그레나다 (1-473)</option>
											
											<option value="GE">그루지아 (995)</option>
											
											<option value="GN">기니 (224)</option>
											
											<option value="NA">나미비아 (264)</option>
											
											<option value="NR">나우루 (674)</option>
											
											<option value="NG">나이지리아 (234)</option>
											
											<option value="ZA">남아프리카공화국 (27)</option>
											
											<option value="NP">네팔 (977)</option>
											
											<option value="NO">노르웨이 (47)</option>
											
											<option value="NZ">뉴질랜드 (64)</option>
											
											<option value="NE">니제르 (227)</option>
											
											<option value="NI">니카라과 (55)</option>
											
											<option value="KR" selected>대한민국 (82)</option>
											
											<option value="DK">덴마크 (45)</option>
											
											<option value="DO">도미니카공화국 (1-809)</option>
											
											<option value="TP">동티모르 (670)</option>
											
											<option value="LA">라오스 (856)</option>
											
											<option value="LR">라이베리아 (231)</option>
											
											<option value="LV">라트비아 (371)</option>
											
											<option value="LB">레바논 (961)</option>
											
											<option value="LS">레소토 (266)</option>
											
											<option value="RO">루마니아 (40)</option>
											
											<option value="LU">룩셈부르크 (352)</option>
											
											<option value="RW">르완다 (250)</option>
											
											<option value="LY">리비아 (218)</option>
											
											<option value="LT">리투아니아 (370)</option>
											
											<option value="MG">마다가스카르 (261)</option>
											
											<option value="YT">마요트 (269-6)</option>
											
											<option value="MK">마케도니아 (389)</option>
											
											<option value="MW">말라위 (265)</option>
											
											<option value="MY">말레이지아 (60)</option>
											
											<option value="ML">말리 (223)</option>
											
											<option value="MX">멕시코 (52)</option>
											
											<option value="MC">모나코 (377)</option>
											
											<option value="MU">모리셔스 (230)</option>
											
											<option value="MR">모리타니 (222)</option>
											
											<option value="MZ">모잠비크 (258)</option>
											
											<option value="ME">몬테네그로 (382)</option>
											
											<option value="MD">몰도바 (373)</option>
											
											<option value="MV">몰디브 (960)</option>
											
											<option value="MT">몰타 (356)</option>
											
											<option value="MM">미얀마 (95)</option>
											
											<option value="FM">미크로네시아(691)</option>
											
											<option value="VU">바누아투 (678)</option>
											
											<option value="BH">바레인 (973)</option>
											
											<option value="BB">바베이도스 (1-246)</option>
											
											<option value="VA">바티칸 (39-6)</option>
											
											<option value="BS">바하마 (1+242)</option>
											
											<option value="BD">방글라데시 (880)</option>
											
											<option value="VE">베네수엘라 (58)</option>
											
											<option value="BJ">베넹 (229)</option>
											
											<option value="VN">베트남 (84)</option>
											
											<option value="BE">벨기에 (32)</option>
											
											<option value="BY">벨라루스 (375)</option>
											
											<option value="BA">보스니아헤르체코비나 (387)</option>
											
											<option value="BW">보츠와나 (267)</option>
											
											<option value="BO">볼리비아 (591)</option>
											
											<option value="BI">부룬디 (257)</option>
											
											<option value="BF">부르키나파소 (226)</option>
											
											<option value="BT">부탄 (975)</option>
											
											<option value="BG">불가리아 (359)</option>
											
											<option value="CY">사이프러스 (357)</option>
											
											<option value="SM">산마리노 (39)</option>
											
											<option value="ST">상토메프린시페 (239)</option>
											
											<option value="SN">세네갈 (221)</option>
											
											<option value="RB">세르비아 (381)</option>
											
											<option value="SC">세이쉘 (248)</option>
											
											<option value="LC">세인트루시아 (1+758)</option>
											
											<option value="VC">세인트빈센트그레나딘 (1+809)</option>
											
											<option value="KN">세인트키츠네비스 (1+809)</option>
											
											<option value="SO">소말리아 (252)</option>
											
											<option value="SB">솔로몬아일란드 (677)</option>
											
											<option value="SD">수단 (249)</option>
											
											<option value="SR">수리남 (597)</option>
											
											<option value="SZ">스와질란드 (268)</option>
											
											<option value="SE">스웨덴 (46)</option>
											
											<option value="ES">스페인(34)</option>
											
											<option value="SK">슬로바키아 (42)</option>
											
											<option value="SI">슬로베니아 (386)</option>
											
											<option value="SY">시리아 (963)</option>
											
											<option value="SL">시에라리온 (232)</option>
											
											<option value="SG">싱가포르 (65)</option>
											
											<option value="AE">아랍에미리트연합국 (252)</option>
											
											<option value="AM">아르메니아 (374)</option>
											
											<option value="IS">아이슬란드 (354)</option>
											
											<option value="HT">아이티 (509)</option>
											
											<option value="IE">아일란드(353)</option>
											
											<option value="AZ">아제르바이잔 (994)</option>
											
											<option value="AF">아프가니스탄 (93)</option>
											
											<option value="AD">안도라 (376)</option>
											
											<option value="AL">알바니아 (355)</option>
											
											<option value="DZ">알제리 (213)</option>
											
											<option value="AO">앙골라 (244)</option>
											
											<option value="ER">에리트리아 (291)</option>
											
											<option value="EE">에스토니아 (372)</option>
											
											<option value="EC">에콰도르 (593)</option>
											
											<option value="ET">에티오피아 (251)</option>
											
											<option value="SV">엘살바도르 (503)</option>
											
											<option value="GB">영국 (44)</option>
											
											<option value="YE">예멘 (967)</option>
											
											<option value="OM">오만 (968)</option>
											
											<option value="AT">오스트리아 (43)</option>
											
											<option value="HN">온두라스 (504)</option>
											
											<option value="JO">요르단 (962)</option>
											
											<option value="UG">우간다 (256)</option>
											
											<option value="UY">우루과이 (598)</option>
											
											<option value="UA">우크라이나 (7)</option>
											
											<option value="IQ">이라크 (964)</option>
											
											<option value="IL">이스라엘 (972)</option>
											
											<option value="EG">이집트 (20)</option>
											
											<option value="IT">이탈리아(39)</option>
											
											<option value="JM">자메이카 (1-876)</option>
											
											<option value="ZW">잠바브웨 (263)</option>
											
											<option value="ZM">잠비아 (260)</option>
											
											<option value="GQ">적도기니 (240)</option>
											
											<option value="CF">중앙아프리카 (236)</option>
											
											<option value="DJ">지부티 (253)</option>
											
											<option value="TD">차드 (235)</option>
											
											<option value="CZ">체코 (42)</option>
											
											<option value="CL">칠레 (56)</option>
											
											<option value="CM">카메룬 (237)</option>
											
											<option value="CV">카보베르데 (238)</option>
											
											<option value="KZ">카자흐스탄 (7)</option>
											
											<option value="QA">카타르 (974)</option>
											
											<option value="KH">캄보디아 (855)</option>
											
											<option value="CA">캐나다 (1)</option>
											
											<option value="KE">케냐 (254)</option>
											
											<option value="KM">코모르 (269)</option>
											
											<option value="CR">코스타리카 (506)</option>
											
											<option value="CI">코트디봐르 (225)</option>
											
											<option value="CO">콜롬비아 (57)</option>
											
											<option value="CG">콩고 (242)</option>
											
											<option value="CD">콩고민주공화국 (243)</option>
											
											<option value="CU">쿠바 (53)</option>
											
											<option value="KG">키르키즈스탄 (996)</option>
											
											<option value="KI">키리바티 (686)</option>
											
											<option value="TW">타이완(886)</option>
											
											<option value="TJ">타지키스탄 (992)</option>
											
											<option value="TZ">탄자니아 (255)</option>
											
											<option value="TR">터키 (90)</option>
											
											<option value="TG">토고 (228)</option>
											
											<option value="TO">통가 (676)</option>
											
											<option value="TM">투르크메니스탄 (993)</option>
											
											<option value="TV">투발루 (688)</option>
											
											<option value="TN">튀니지 (216)</option>
											
											<option value="TT">트리니다드토바고 (1-868)</option>
											
											<option value="PA">파나마 (507)</option>
											
											<option value="PY">파라과이 (595)</option>
											
											<option value="PK">파키스탄 (92)</option>
											
											<option value="PG">파푸아뉴기니 (675)</option>
											
											<option value="PE">페루 (51)</option>
											
											<option value="PT">포르투갈 (351)</option>
											
											<option value="PL">폴란드 (48)</option>
											
											<option value="FJ">피지 (679)</option>
											
											<option value="HU">헝가리 (36)</option>
											
											<option value="FI">핀란드 (358)</option>
											
											<option value="GR">그리스 (30)</option>
											
											<option value="HK">홍콩(852)</option>
											
											<option value="MO">마카오(853)</option>
											
											<option value="IX">인도네시아()</option>
											
											<option value="ID">인도네시아 (62)</option>
											
											<option value="CN">중국 (86)</option>
											
											<option value="CH">스위스 (41)</option>
											
											<option value="DE">독일 (49)</option>
											
											<option value="FR">프랑스 (33)</option>
											
											<option value="NL">네덜란드(31)</option>
											
											<option value="PH">필리핀 (63)</option>
											
											<option value="SA">사우디아라비아 (966)</option>
											
											<option value="TH">타이(66)</option>
											
											<option value="UZ">우즈베크 (998)</option>
											
											<option value="BR">브라질 (55)</option>
											
											<option value="US">미국 (1)</option>
											
											<option value="HR">크로아티아 (385)</option>
											
											<option value="IN">인도 (91)</option>
											
											<option value="JP">일본 (81)</option>
											
											<option value="KW">쿠웨이트 (965)</option>
											
											<option value="AR">아르헨티나 (54)</option>
											
											<option value="IR">이란 (98)</option>
											
											<option value="LK">스리랑카 (94)</option>
											
											<option value="RU">러시아 (7)</option>
											
											<option value="AU">호주(61)</option>
											
											<option value="MN">몽골 (976)</option>
											
										</select>
										
										<select class="tel" name = "phone1">
											<option value="010" selected>010</option>
											<option value="011" >011</option>
											<option value="016" >016</option>
											<option value="017" >017</option>
											<option value="018" >018</option>
											<option value="019" >019</option>
										</select>
										- <input type = "text" class="tel" class="tell" name="phone2" id="phone2"></input> - <input type = "text" class="tel" class="tell" name="phone3" id="phone3"></input>
										<br>
										<span id="idall"><input type = "checkbox">문자(SMS)를 통한 상품 및 이벤트 정보 수신에 동의합니다.<span class="id1">(선택) &nbsp;</span><br>
										<input type = "checkbox" value="">전화상담을 통한 상품(금융상품 포함) 및 이벤트 정보 수신에 동의합니다. <span class="id1">(선택) &nbsp;</span></span>
									</td>
								</tr>
							</table>
						</li>
						
						<table id="tablelast">
							<tr>
							<td>
								<span id="last1">Han's Designer 이용약관과 개인정보 수집 및 이용을 확인하였으며 이에 동의하십니까?</span>
								<br>
								<input type="button" value="Han's Designer 이용약관 자세히 보기" id="last2"></input>
							</td>
							</tr>
						</table>
						<br><br>
						<input type ="submit" value ="동의하고 회원가입" id="nextBtn">
						
						
						
					</ul>
					
				</form>
		</div>
		</body>
	</html>	