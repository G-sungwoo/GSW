<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.osan.portal.vo.LoginInfo" %>
<%@ page import="sun.misc.BASE64Encoder" %>
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
    <link href="resources/css/layout.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="resources/css/swiper.css" rel="stylesheet" />
    <script type="text/javascript" src="resources/js/swiper.min.js"></script>
    <script type="text/javascript" src="resources/js/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="resources/js/common.js"></script>
    <script type="text/javascript" src="resources/js/aes.js"></script>
	<script type="text/javascript">
	    $(function(){
	        $(window).load(function(){
	            $("#searchName").keydown(function(key) {
	                if(key.keyCode == 13){
	                    searchWorker();
	                }
	            });
	            //개인요약정보
	            selectPsnlGwInfo();
	            pageResize();
	        })
	    })
        $(function(){
            $('.wrap-loading').removeClass('display-none');
            /*홈페이지 공지사항 탭 설정*/
            $(".tab_content").hide();
            $(".tab_content:first").show();
            $("#hompageTab.tab li").click(function () {
                $("#hompageTab li a").removeClass("on");
                $(this).children("a").addClass("on");
                $(".tab_content").hide()
                var activeTab = $(this).attr("rel");
                $("#" + activeTab).fadeIn()
            });
            /*개인정보수정 탭 설정*/
            $(".tab_user").hide();
            $(".tab_user:first").show();
            $("#userInfoTab.tab li").click(function () {
                $("#userInfoTab li a").removeClass("on");
                $(this).children("a").addClass("on");
                $(".tab_user").hide()
                var activeTab = $(this).attr("rel");
                $("#" + activeTab).fadeIn()
            });
        //교직원/학생 게시판 조회(페이지 로딩)
        selectListBoardArticle(0);
        //학사력 조회(페이지 로딩)
        getAcademicSchedule();
        })
        /********교직원/학생 게시판 조회*********/
        function selectListBoardArticle(pageNo){
            pageNo = (pageNo || 1);
            $("#pageNo").val(pageNo);
            var formData = $("#hiddenForm").serialize();
            $.ajax({
                type : "POST",
                async : false,
                url : "/boardArticle",
                data : formData,
                dataType : "json",
                success : getBoardArticleOk
            });
        }
        /********교직원/학생 게시판 조회 callback***/
        function getBoardArticleOk(data, status){
        	var item=data.jsonList[0].result; 
        	var selectHtml=[]; 
        	var len=item.length; 
        	var page=data.jsonList[0].page; 
        	//페이징 변수 
        	var page_boardList = getPagingInfo(page.totalCount, 8, 5 ,page.currPage, page.totalPage, "selectListBoardArticle"); //공통 페이징 처리 함수 호출
        	//데이타 그리기 
        	if(len >0){ 
        		$(item).each(function(i, item){ 
        			selectHtml.push('<tr>'); 
        			
        			selectHtml.push('<td><a class="cut" href=javascript:readBoard("');
        			selectHtml.push($("#userNo").val());
        			selectHtml.push('","');
        			selectHtml.push(item.articleSeq);
        			selectHtml.push('");>'+item.title+'</a></td>')
        			selectHtml.push('<td>'+item.insertDate+'</td>');
        			selectHtml.push('<td align="right">'+item.viewCount+'</td>'); 
        			selectHtml.push('</tr>');
        		}); 
        	}else{ 
        		selectHtml.push('<tr>'); 
        		selectHtml.push('<td colspan="2">조회된 결과가 없습니다.</td>'); 
        		selectHtml.push('</tr>'); 
        	} 
        	$("#boardList").empty().html(selectHtml.join(''));
        	//페이징 그리기 
        	$("#paging").empty().html(page_boardList);
        	$("#pageInfo").html("total " + page.totalCount + ", " + page.currPage + "/" + page.totalPage +" pages");
        }
	    /*학사력 조회*/
        function getAcademicSchedule(searchYm){
        	var cym = $("#searchYm").val();
        	var cy = cym.substring(0,4);
        	var cm = cym.substring(4,6);
        	var curDate = new Date(cy,cm,1);
        	var searchDate = new Date();
        	if(searchYm == "prev"){
        		searchDate = new Date(curDate.getFullYear(), curDate.getMonth() -2, 1);
        	}else if(searchYm == "next"){
        		searchDate = new Date(curDate.getFullYear(), curDate.getMonth() +0, 1);
        	}
        	searchYm = fn_dateToString(searchDate);
            $("#searchYm").val(searchYm);
            var formData = $("#hiddenForm").serialize();
            $.ajax({
                type : "POST",
                async : false,
                url : "/academicSchedule",
                data : formData,
                dataType : "json",
                success : getAcademicScheduleOk
            });
        }
	    /*학사력 callback*/
        function getAcademicScheduleOk(data, status){
            var item=data.jsonList[0].resultSchedule; 
            var selectHtml=[]; 
            var len=item.length; 
            //데이타 그리기 
            if(len >0){ 
            	var currentYm = item[0].currentYm;
            	var currentYear = currentYm.substring(0,4);
            	var currentMonth = currentYm.substring(4,6);
                $("#currentYm").html(currentYear + "년 " + currentMonth + "월");
                $("#searchYm").val(currentYm);
                $(item).each(function(i, item){ 
                    selectHtml.push('<tr>'); 
                    
                    selectHtml.push('<td style="padding-left: 1px; font-size: 11px;">');
                    selectHtml.push(item.regDate);
                    selectHtml.push("~");
                    if(item.endDate != '00'){
                        selectHtml.push(item.endDate);
                    }
                    selectHtml.push('</td>')
                    
                    selectHtml.push('<td>'+item.title+'</td>'); 
                    selectHtml.push('</tr>');
                }); 
            }else{ 
                selectHtml.push('<tr>'); 
                selectHtml.push('<td colspan="2">조회된 결과가 없습니다.</td>'); 
                selectHtml.push('</tr>'); 
            } 
            $("#scheduleList").empty().html(selectHtml.join(''));
            pageResize();
        }
        /*개인정보 수정*/
        function updateUserInfo(){
            var formData = $("#userInfoForm").serialize() + "&userNo="+ $("#userNo").val() + "&userAuth=" + $("#userAuth").val();
            $.ajax({
                type : "POST",
                async : false,
                url : "/updateUserInfo",
                data : formData,
                dataType : "text",
                success : updateUserInfoOk
            });
        }
        /*개인정보 수정 callback*/
        function updateUserInfoOk(data, status){
        	if(data == "UPDATE_OK"){
        	    alert("개인정보가 수정되었습니다.");
        	    reload();
        	}else{
        		alert("개인정보 수정이 정상적으로 처리되지 않았습니다.");
        		return;
        	}
        }
        /*비밀번호 입력 초기화*/
        function clearInput(){
        	if(confirm("초기화 하시겠습니까?")){
        	    $('#userPasswordForm :input').val('');
        	    $("#currentPassword").focus();
        	}else{
        		return;
        	}
        }
        /*비밀번호 수정*/
        function updatePassword(){
            var newPassword = $("#newPassword").val();
            var currPassword = $("#password").val();
            var confirmPassword = $("#confirmPassword").val();
            if(newPassword != confirmPassword){
                alert("신규 비밀번호가 일치하지 않습니다.");
                return;
            }else{
                if(checkPassWord(newPassword)){
                    var formData = $("#userPasswordForm").serialize() + "&userNo="+ $("#userNo").val() + "&userAuth=" + $("#userAuth").val();
                    $.ajax({
                        type : "POST",
                        async : false,
                        url : "/updateUserPassword",
                        data : formData,
                        dataType : "text",
                        success : updatePasswordOk
                    });
                }else{
                    $("#newPassword").focus();
                    return;
                }
            }
        }
        /*비밀번호 수정 callback*/
        function updatePasswordOk(data, status){
            if(data == "UPDATE_OK"){
                alert("비밀번호가 변경되었습니다.");
                $('#userPasswordForm :input').val('');
                return;
            }else if(data == "WRONG_PASSWORD"){
                alert("현재 비밀번호가 일치하지 않습니다.");
                return;
            }else{
                alert("비밀번호가 변경이 정상적으로 처리되지 않았습니다.");
                return;
            }
        }
        /*교직원 찾기*/
        function searchWorker(pageNo){
        	if($("#searchName").val().length < 1){
        		alert("검색할 성명을 입력해주세요");
        		return;
        	}
            pageNo = (pageNo || 1);
            $("#pageNo").val(pageNo);
            var formData = $("#searchWorkerForm").serialize() + "&pageNo="+ $("#pageNo").val() + "&countPerPage=" + $("#countPerPage").val();
            $.ajax({
                type : "POST",
                async : false,
                url : "/searchWorker",
                data : formData,
                dataType : "json",
                success : searchWorkerOK
            });
        }
        /*교직원 찾기 callback*/
        function searchWorkerOK(data, status){
            var item=data.jsonList[0].result; 
            var selectHtml=[]; 
            var len=item.length; 
            var page=data.jsonList[0].page; 
            //페이징 변수 
            var page_searchWorkerList = getPagingInfo(page.totalCount, 8, 5 ,page.currPage, page.totalPage, "searchWorker"); //공통 페이징 처리 함수 호출
            //데이타 그리기 
            if(len >0){ 
                $(item).each(function(i, item){ 
                    selectHtml.push('<tr>'); 
                    selectHtml.push('<td style="padding-left: 2px;">'+item.userName+'</td>'); 
                    selectHtml.push('<td style="padding-left: 2px;">'+item.deptName+'</td>'); 
                    selectHtml.push('<td>'+item.psnlGbnm+'</td>'); 
                    selectHtml.push('<td style="padding-left: 2px;">'+item.tel+'</td>'); 
                    selectHtml.push('<td style="padding-left: 2px;">'+item.hp+'</td>'); 
                    selectHtml.push('</tr>');
                }); 
            }else{ 
                selectHtml.push('<tr>'); 
                selectHtml.push('<td colspan="5">조회된 결과가 없습니다.</td>'); 
                selectHtml.push('</tr>'); 
            } 
            $("#searchWorkerList").empty().html(selectHtml.join(''));
            //페이징 그리기 
            $("#searchWorkerPaging").empty().html(page_searchWorkerList);
            pageResize();
        }
        /********개인요약정보 조회*********/
        function selectPsnlGwInfo(){
            var formData = $("#hiddenForm").serialize();
            $.ajax({
                type : "POST",
                async : false,
                url : "/psnlGwInfo",
                data : formData,
                dataType : "json",
                success : getPsnlGwInfoOk
            });
        }
        function getPsnlGwInfoOk(data, status){
        	$("#signDocCnt").html("<a href='javascript:openGroupWare(1)'>" +data.signDocCnt + "개</a>");
        	$("#publicDocCnt").html("<a href='javascript:openGroupWare(2)'>"+data.publicDocCnt +  "개</a>");
        	$("#inboxDocCnt").html("<a href='javascript:openGroupWare(3)'>"+data.inboxDocCnt + "개</a>");
        	$('.wrap-loading').addClass('display-none');
        }
        function openGroupWare(docDiv){
        	if(docDiv == '1'){
        		openMenu('http://gw.osan.ac.kr:8090/public/script/gwlogin.jsp?fr=ptl&pmenu=sgn','gw','');
        	}else if(docDiv == '2'){
        		openMenu('http://gw.osan.ac.kr:8090/public/script/gwlogin.jsp?fr=ptl&pmenu=sgn&smenu=ccl','gw','');
        	}else if(docDiv == '3'){
        		openMenu('http://gw.osan.ac.kr:8090/public/script/gwlogin.jsp?fr=ptl&pmenu=sgn&smenu=rcv','gw','');
        	}else{
        		return;
        	}
        }
    </script>
    <!-- 세션체크해서 로그인 정보 있으면 메인화면으로 -->
    <%
    String userNo = "";
    String userName = "";
    String userAuth = "";
    String encUserNo = "";
    String hp = "";
    String tel = "";
    String hTell = "";
    String fax = "";
    String email = "";
    String shAt = "";
    String pkAt = "";
    String hjAt = "";
    String cuAt = "";
    HttpSession session = request.getSession(false);
    if(session == null && session.getAttribute("sessionUserInfo") == null){
    	%>
        <script type="text/javascript">
            alert("로그인 세션이 종료되었습니다. 로그인페이지로 이동합니다.");
        </script>
    	<% 
        response.sendRedirect("/");
    }else{
        LoginInfo loginInfo = new LoginInfo();
        loginInfo = (LoginInfo)session.getAttribute("sessionUserInfo");
        
        userNo = loginInfo.getUserNo();
        userName = loginInfo.getName();
        userAuth = loginInfo.getUserAuth();
        hp = loginInfo.getHp();
        tel = loginInfo.getTel();
        hTell = loginInfo.gethTell();
        fax = loginInfo.getFax();
        email = loginInfo.getEmail();
        /*업무 담당자 구분*/
        //산학
        shAt = loginInfo.getShAt();
        //평생교육원
        pkAt = loginInfo.getPkAt();
        //현장실습
        hjAt = loginInfo.getHjAt();
        //취업
        cuAt = loginInfo.getCuAt();
        
        BASE64Encoder en = new BASE64Encoder();
        encUserNo = URLEncoder.encode(en.encode(userNo.getBytes("UTF-8")),"UTF-8");
        
        System.out.println("#####################################세션정보########################################");
        System.out.println("loginInfo.getUserNo() : " + loginInfo.getUserNo());
        System.out.println("loginInfo.getName() : " + loginInfo.getName());
        System.out.println("loginInfo.getUserAuth() : "  + loginInfo.getUserAuth());
        System.out.println("#####################################세션정보########################################");
    }
    %>
</head>
<body>
<form action="" method="post" name="hiddenForm" id="hiddenForm">
    <input name="countPerPage" id="countPerPage" type="hidden" value="8">
    <input name="pageNo" id="pageNo" type="hidden" value="1">
    <input name="userNo" id="userNo" type="hidden" value="<%=userNo%>">
    <input name="userAuth" id="userAuth" type="hidden" value="<%=userAuth%>">
    <input name="encUserNo" id="encUserNo" type="hidden" value="<%=encUserNo%>">
    <input name="searchYm" id="searchYm" type="hidden" value="">
</form>
<div id="header">
    <div class="article">
        <h1><img src="resources/img/logo.png" alt="오산대학교 포탈 로고" onclick="reload();" style="cursor:pointer"/></h1>
        <ul class="tm">
        </ul>
        <ul>
<!--             <li><a href="javascript:reload();">메인사이트</a></li> -->
            <li><a href="/logout" class="logout">로그아웃</a></li>
        </ul>
    </div>
</div>
<div id="contents">
    <div class="article">
        <div id="left">
            <ol>
            <c:set var="shAt" value="<%=shAt %>"/>
            <c:set var="pkAt" value="<%=pkAt %>"/>
            <c:set var="hjAt" value="<%=hjAt %>"/>
            <c:set var="cuAt" value="<%=cuAt %>"/>
            <c:set var="tmpUserNo" value="<%=userNo %>"/>
            <c:set var="userAuth" value="<%=userAuth %>"/>
                <li><a href="javascript:boardMain('<%=userNo %>')"><strong>교직원/학생게시판</strong></a></li>
            </ol>
        </div>
        <div id="right">
            <div class="grid">
                <div class="grid-item grid-sizer grid-item-default">
                    <h3>교직원/학생 게시판<span>&nbsp;</span>
                    </h3>
                    <div class="box">
                        <div class="info">
                            <ol class="btn left">
                                <li><button type="button" class="write" onclick="writeBoard('<%=userNo%>');">글쓰기</button></li>
                            </ol>
                            <div class="txt right">
                                <strong id="pageInfo"></strong>
                            </div>
                        </div>
                        <table class="op_table">
                            <colgroup>
                                <col style="width:*; " />
                                <col style="width:20%; " />
                                <col style="width:15%; " />
                            </colgroup>
                            <thead>
                                <tr>
                                    <td class="ct">제목</td>
                                    <td class="ct">작성일</td>
                                    <td class="ct">조회수</td>
                                </tr>
                            </thead>
                            <tbody id="boardList"> 
                            </tbody> 
                        </table>
                        <div class=paging id="paging">
                        </div>
                    </div>
                </div>
                <div class="grid-item login">
                    <h3>로그인<span>&nbsp;</span>
                    </h3>
                    <div class="box">
                        <div class="info"><strong><%=userName%></strong> 님 안녕하세요.<br />오산대학교 포탈시스템 방문을 환영합니다.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrap-loading display-none">
    <div><img src="resources/img/ajax_loader.gif" /></div>
</div> 
<div id="footer">
    <div class="article">
        <h6><img src="resources/img/logo.png" alt="오산대학교 포탈 로고" /></h6>
        <p>
            COPYRIGHT(C) 2018 Copyright(c) OSAN UNIVERSITY. All rights reserved. <br />
            Tel. 031-370-2500 / Fax. 031-373-7388 / (18119) 경기도 오산시 청학로45
        </p>
    </div>
</div>

</body>
</html>
