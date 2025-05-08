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
    <script type="text/javascript">
    function getUserNo(){
    	if($("#name").val() == ''){
    		alert("이름을 입력해주세요");
    		return;
    	}
        if($("#regNo").val() == ''){
            alert("생년월일을 입력해주세요");
            return;
        }
        var formData = $("#findIdForm").serialize();
        $.ajax({
            type : "POST",
            url : "/findId",
            data : formData,
            dataType : "text",
            success : findeIdOk
        });
    }
    /*ID찾기 callback*/
    function findeIdOk(data, status){
        if(data == "NO_MATCH_USER"){
            alert("입력하신 정보의 사용자가 존재하지 않습니다.");
            return;
        }else{
            $("#result").html($("#name").val() + "님의 아이디는 [ "+ data + " ] 입니다.")
        }
    }
    </script>
    <link type="text/css" href="resources/css/layout.css" rel="stylesheet" />

</head>
<body>
<div class="find">
    <ul>
        <li><a href="/findIdView" class="on">아이디(학번) 찾기</a></li>
        <li><a href="/findPwView">비밀번호 찾기</a></li>
    </ul>
    <div class="box">
        <p>아이디(학번) 찾기</p>
        <form action="" method="post" name="findIdForm" id="findIdForm">
        <table class="op_table">
            <colgroup>
                <col style="width:30%; " />
                <col style="width:*; " />
            </colgroup>
            <tbody>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name" id="name" value="" maxlength="20"/></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="text" name="regNo" id="regNo" value="" maxlength="6" placeholder="YYMMDD  (예: 971201)" /></td>
                </tr>
            </tbody>
        </table>
        <ol>
            <li><button type="button" onclick="getUserNo();">확인</button></li>
            <li><button type="button" onclick="window.self.close();">취소</button></li>
        </ol>
        </form>
        <div style="text-align:center; padding-top:10px; height:50px;">
        <p id="result"/>
        </div>
    </div>
</div>
</body>
</html>