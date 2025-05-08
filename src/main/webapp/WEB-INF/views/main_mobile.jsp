<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.osan.portal.vo.LoginInfo" %>
<%@ page import="com.osan.portal.utils.AESUtil" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<html>
<head>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="keywords" content="오산대학교, 오산대 포탈, 오산대, 포탈" />
    <meta name="description" content="오산대학교 포탈" />
    <meta name="author" content="오산대학교" />
    <link rel="icon" type="image/png"  href="resources/img/favicon.ico"/>
    <title>오산대학교 포탈</title>
    <script src="resources/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
    <link href="resources/mobile/assets/css/main.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="resources/mobile/assets/css/noscript.css" />
    <script type="text/javascript" src="resources/js/common.js"></script>
    <script type="text/javascript" src="resources/js/aes.js"></script>
    <script type="text/javascript">
        $(function(){
            $(window).load(function(){
                //교직원/학생 게시판 조회(페이지 로딩)
                selectListBoardArticle(0);
            })
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
        /*GW 모바일 메인화면 이동*/
        function gwMobileMain(url){
            window.open(url, '','');
        }
        /*GW MAIL 모바일 메인화면 이동*/
        function gwMobileMail(url){
            window.open(url, '','');
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
    String gwUrl = "";
    String mailUrl = "";
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
        
        encUserNo = AESUtil.encrypt(userNo);
        
        gwUrl = "https://mgw.osan.ac.kr/login_sso.aspx?flag=portal&id="+encUserNo;
        mailUrl = "https://mgw.osan.ac.kr/login_sso.aspx?flag=mail&id="+encUserNo;
        
        System.out.println("#####################################세션정보########################################");
        System.out.println("loginInfo.getUserNo() : " + loginInfo.getUserNo());
        System.out.println("loginInfo.getName() : " + loginInfo.getName());
        System.out.println("loginInfo.getUserAuth() : "  + loginInfo.getUserAuth());
        System.out.println("#####################################세션정보########################################");
    }
    %>
</head>
<body>
<form action="" method="post" name="hiddenForm" id="hiddenForm" style="display: none">
    <input name="countPerPage" id="countPerPage" type="hidden" value="8">
    <input name="pageNo" id="pageNo" type="hidden" value="1">
    <input name="userNo" id="userNo" type="hidden" value="<%=userNo%>">
    <input name="userAuth" id="userAuth" type="hidden" value="<%=userAuth%>">
    <input name="encUserNo" id="encUserNo" type="hidden" value="<%=encUserNo%>">
    <input name="searchYm" id="searchYm" type="hidden" value="">
</form>
        <!-- Wrapper -->
            <div id="wrapper">
                <!-- Header -->
                    <header id="header">
                        <div class="inner">
                            <!-- Logo -->
                                <a href="javascript:reload()" class="logo">
                                    <span class="symbol"><img src="resources/img/logo.png" alt="" /></span>
                                </a>

                            <!-- Nav 
                                <nav>
                                    <ul>
                                        <li><a href="#menu">Menu</a></li>
                                    </ul>
                                </nav>
-->
                        </div>
                    </header>
                <!-- Menu 
                    <nav id="menu">
                        <h2>Menu</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="generic.html">Ipsum veroeros</a></li>
                            <li><a href="generic.html">Tempus etiam</a></li>
                            <li><a href="generic.html">Consequat dolor</a></li>
                            <li><a href="elements.html">Elements</a></li>
                        </ul>
                    </nav>
                    -->
                <!-- Main -->
                    <div id="main">
                        <div class="inner">
                            <header>
                    <div class="box">
                        <div class="info"><strong><%=userName%></strong> 님 안녕하세요.<br />오산대학교 포탈시스템 방문을 환영합니다.</div>
                    </div>
                            </header>
                <div class="grid-item grid-sizer grid-item-default">
                    <h3>교직원/학생 게시판<span>&nbsp;</span>
                    </h3>
                    <div class="box">
                        <table class="op_table">
                            <colgroup>
                                <col style="width:*; " />
                                <col style="width:20%; " />
                            </colgroup>
                            <thead>
                                <tr>
                                    <td class="ct">제목</td>
                                    <td class="ct">작성일</td>
                                </tr>
                            </thead>
                            <tbody id="boardList"> 
                            </tbody> 
                        </table>
                        <div class=paging id="paging">
                        </div>
                    </div>
                </div>
                            <section class="tiles">
                                <article class="style1">
                                    <span class="image">
                                        <img src="resources/mobile/images/pic01.jpg" alt="" />
                                    </span>
                                    <a href="javascript:gwMobileMain('<%=gwUrl%>')">
                                    <h1>그룹웨어</h1>
                                    </a>
                                </article>
                                <article class="style2">
                                    <span class="image">
                                        <img src="resources/mobile/images/pic02.jpg" alt="" />
                                    </span>
                                    <a href="javascript:gwMobileMail('<%=mailUrl%>')">
                                    <h1>메일</h1>
                                    </a>
                                </article>
                                <article class="style3">
                                    <span class="image">
                                        <img src="resources/mobile/images/pic03.jpg" alt="" />
                                    </span>
                                    <a href="javascript:openMenu('https://ostory.osan.ac.kr/common/user/loginProc.do', 'ostory')">
                                    <h1>OStory!</h1>
                                    </a>
                                </article>
                            </section>
                        </div>
                    </div> 
<div id="footer">
<div class="inner">
                            <ul class="copyright">
                                <li>&copy; 오산대학교. All rights reserved</li>
                                <li>Tel. 031-370-2500 / Fax. 031-373-7388</li>
                                <li>(18119) 경기도 오산시 청학로45</li>
                                <li>Design: html5up</li>
                            </ul>
                            </div>
</div>
</div>
</body>
</html>
