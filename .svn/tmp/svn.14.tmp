<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;">
    <meta name="viewport" content="width=device-width,user-scalable=yes">
    <meta name="keywords" content="오산대학교, 오산대 포탈, 오산대, 포탈" />
    <meta name="description" content="오산대학교 포탈" />
    <meta name="author" content="오산대학교" />
    <link rel="icon" type="image/png"  href="resources/img/favicon.ico"/>
    <title>오산대학교 포탈</title>

    <script src="resources/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>

    <link type="text/css" href="resources/css/layout.css" rel="stylesheet" />

    <script type="text/javascript" src="resources/js/login.js"></script>
    <script type="text/javascript" src="resources/js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#login").click(function() {
            	loginValCheck();
            });
            $("#password").keydown(function(key) {
                if(key.keyCode == 13){
                	loginValCheck();
                }
            });
            $("input[name=rd]").change(function() {
            	if($(this).val() == "p"){
            		$("#smsCertAt").val("Y");
            		$("#sms").css("display","block"); 
            	}else{
                    $("#smsCertAt").val("N");
                    $("#sms").css("display","none"); 
            	}
            });
        });
        /*로그인 validation 체크*/
        function loginValCheck(){
//             if($.trim($("#userNo").val().length) > 9){
//                  goCourseTime();
//                  return;
//             }
            if($.trim($("#userNo").val()) == ""){
                alert("아이디를 입력해주세요");
                return;
            }
            if($.trim($("#password").val()) == ""){
                alert("비밀번호를 입력해주세요");
                return;
            }
            if($('#smsCertAt').val() == "Y"){
                if($("#verifiedAt").val() != "Y"){
                    alert("SMS인증 후 로그인 가능합니다");
                    return;
                }else{
                    loginCheck();   
                }
            }else{
                loginCheck();
            }
        }
        function onSuccess(data, status){
            if(data == "true"){
                login();
            }else if(data == "false"){
                openPopupOtp();
            }else{
                alert(data);
            }
        }
        //로그인 처리
        function login(){
            $("#loginForm").submit();
        }
        //패스워드 변경 페이지 호출
        function changePassword(){
        	$("#loginForm").attr("action", "/changePw");
        	$("#loginForm").submit();
        }
        function loginCheck(){
            var formData = $("#loginForm").serialize();
            $.ajax({
                type : "POST",
                url : "/login_check_sso",
                data : formData,
                dataType : "text",
                success : onSuccess
            });
        }
        function cellNumCheck(){
            if(!isCellPhone()){
                alert("핸드폰 번호를 확인해주세요");
                return;
            }else{
                if($.trim($("#userNo").val()) == ""){
                    alert("아이디를 입력해주세요");
                    return;
                }
                if($.trim($("#password").val()) == ""){
                    alert("비밀번호를 입력해주세요");
                    return;
                }
                sendSms();
            }
        }
        function sendSms(){
            var formData = $("#loginForm").serialize();
            $.ajax({
                type : "POST",
                url : "/sendSms",
                data : formData,
                dataType : "text",
                success : smsSuccess
            });
        }
        function smsSuccess(data,status){
            if(data == "NOT_MATCH_NUM"){
                alert("대학정보시스템에 등록된 핸드폰 번호와 일치하지않습니다");	
                return;
            }else if(data == "SMS_SEND_OK"){
                alert("인증번호가 발송되었습니다"); 
                setTimeout(Decrement,1000);
            }
        }
        /*인증번호 카운터*/
        var mins = 1;  //Set the number of minutes you need
        var secs = mins * 60;
        var currentSeconds = 0;
        var currentMinutes = 0;
        
        function Decrement() {
            currentMinutes = Math.floor(secs / 60);
            currentSeconds = secs % 60;
            if(currentSeconds <= 9) currentSeconds = "0" + currentSeconds;
            secs--;
            document.getElementById("timerText").innerHTML = "(0" + currentMinutes + ":" + currentSeconds + ")"; //Set the element id you need the time put into.
            if(secs !== -1) setTimeout('Decrement()',1000);
        }
        /*인증번호 체크*/
        function checkVerifyNumber(){
            if($.trim($("#userVerifyNumber").val()) == ""){
                alert("인증번호를 입력해주세요");
                return;
            }else if(currentSeconds == 0){
                alert("인증 시간이 만료되었습니다. 인증번호발송을 다시 클릭해주세요");
                return;
            }else{
            	verifyUser();
            }
        }
        /*인증번호 확인(서버)*/
        function verifyUser(){
            var formData = $("#loginForm").serialize();
            $.ajax({
                type : "POST",
                url : "/verifyUser",
                data : formData,
                dataType : "text",
                success : verifyUserSuccess
            });
        }
        function verifyUserSuccess(data, status){
            if(data == "NOT_MATCH_NUM"){
                alert("인증번호가 일치하지 않습니다."); 
                return;
            }else if(data == "VERIFY_OK"){
                alert("인증되었습니다.");
                $("#verifiedAt").val("Y");
            }else{
                alert("오류가 발생하였습니다");
            }
        }
        /*수강신청 분산*/
        function goCourseTime(){
            //접속시의 Time의 뒷자리(홀수/짝수)로 구분할 경우
            var today = new Date();
            var ss = today.getSeconds();
            var sSecond = ss % 2;
            var url;
            
            if(sSecond==1){
                url = "http://211.221.231.12/osu/index.jsp";
            }else{
                url = "http://osanuniv.osan.ac.kr/osu/index.jsp";
            }
            window.open(url,"_blank","menubar=no,toolbar=no,location=no,status=yes,scrollbars=no,width=650,height=400");
            var ua = window.navigator.appVersion;
            var msie = ua.indexOf ( "MSIE " );
            var version = ua.substring(msie+5,msie+8);
            
            //Check version number and run correct code
            // 버젼을 체크하고 올바른 코드를 실행한다
            if (version >= "7.0"){
                  var obj = self.window.open('','_self','');
                  obj.close();
            }else{
                  self.close();
            }
        }
        function openSugang(){
            window.open("https://sugang.osan.ac.kr/","_blank","menubar=no,toolbar=no,location=no,status=yes,scrollbars=yes");
        }
        function openGW(){
            window.open("http://gw.osan.ac.kr:8090/","_blank","menubar=no,toolbar=no,location=no,status=yes,scrollbars=yes");
        }
        function openDJ(){
            window.open("http://osanuniv.osan.ac.kr/osu/index.jsp","_blank","menubar=no,toolbar=no,location=no,status=yes,scrollbars=yes");
        }
        function downLoadOTP(){
        	window.open("https://auth.osan.ac.kr/app/android/Bandi%20mOTP%20v2_1.1.5_apkcombo.com.apk");
        }
        function otpGuide(){
        	window.open("https://auth.osan.ac.kr/app/android/bandiMotp_APK_Install_Guide.pptx");
        }
    </script>
</head>
<body>
    <div class="login_img">
        <ul>
            <li style="background-image:url('resources/img/login_bg.jpg')"></li>
            <li style="background-image:url('resources/img/login_bg2.jpg')"></li>
            <li style="background-image:url('resources/img/login_bg3.jpg')"></li>
        </ul>
        <ol>
            <li><a href="javascript:;" class="on">1</a></li>
            <li><a href="javascript:;" >2</a></li>
            <li><a href="javascript:;" >3</a></li>
        </ol>
    </div>
    <div class="login_box">
        <div style="background:url('resources/img/opred.png') repeat">
            <form action="/main_sso" method="post" name="loginForm" id="loginForm"><font color="white">
                 <ul>
                     <li><input type="text" fontcolor="yellow" name="userNo" id= "userNo" value="" placeholder="아이디입력" class="id" /></li> 
                     <li><input type="password" name="password" value="" placeholder= "비밀번호" class="pw" id="password"/></li> 
                 </ul>  
                 <button type="button" id="login">Login</button> 
                 <p><font color="blue">아이디 : 학생-학번 / 교직원-교직원번호</font></p> 
             <ol> 
                 <li><button type="button" style="border:1px solid #d3d3d3; " onclick="openPopupFindId();">+ 학번(교번) / PW 찾기</button></li> 
                 <li><button type="button" style="border:1px solid #d3d3d3; background-color: #f44336; color: white;" onclick="openRegiEtaxSite();">+ 고지서 출력</button></li> 
             </ol>  
<!--             <ol> 
                 <li><button type="button" style="border:1px solid #d3d3d3; background-color: 660099; color: white;" onclick="openSugang();">모바일 수강신청</button></li> 
             </ol> 
-->
<!--                <ol>  -->
<!--                   <li>  -->
<!--                  <button type="button" style="border:1px solid #d3d3d3; background-color: 660099; color: white;" onclick="otpGuide();">OTP 매뉴얼</button>  -->
<!--                   </li>   -->
<!--                  <li> -->
<!--                   <button type="button" style="border:1px solid #d3d3d3; background-color: 660099; color: white;" onclick="otpGuide();">OTP 사용자 등록</button> -->
<!--                   </li>   -->
<!--               </ol>   -->
                 <a href="https://www.osan.ac.kr/?menuno=392" target="blank"><p style="float:right; margin-top:15px; font-weight: bold">개인정보처리방침</p></a>
           </form>              
        </div>
    </div>

</body>
</html>