<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstl.jsp"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>대학정보시스템(모바일)</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    

	
    <c:if test="${action == 'mobile'}">
        <style>
            #PC {
                display: none;
            }
        </style>
    </c:if>
    <c:if test="${action != 'mobile'}">
        <style>
            .grid-item {
                display: none;
            }
        </style>
    </c:if>
    
</head>

<body id="page-top">

<form action="" method="post" name="hiddenForm" id="hiddenForm">
    <input name="countPerPage" id="countPerPage" type="hidden" value="8"/>
    <input name="pageNo" id="pageNo" type="hidden" value="1"/>
    <input name="searchYm" id="searchYm" type="hidden" value=""/>
</form>

    <!-- Page Wrapper -->
    <div id="wrapper">

<!-- left layout 작성 (기존 sidebar 분리작업)-->
<%@ include file = "/resources/layout/leftmenu.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

<!-- header layout 작성 (기존 Topbar 분리작업)-->
<%@ include file = "/resources/layout/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h5 mb-0 text-gray-800"><B>${korn_name }</B> 님 안녕하세요. 오산대학교 모바일포탈시스템 입니다.</h1>

                        <a href="javascript:openMenu('/resources/sso/homepage_login.jsp?','homepage','')" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-home fa-sm text-white-50"></i> 오산대학교 홈페이지 바로가기</a>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                    
                    <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="javascript:openMenu('https://lms.osan.ac.kr/osansso/login.php', 'lms')" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="red">LMS</font></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-video fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <!-- <a href="https://www.osan.ac.kr/?menuno=239" style="text-decoration: none;">  -->
                            <a href="javascript:openMenu('https://ostory.osan.ac.kr/common/user/ssoLogin.do', 'ostory')" style="text-decoration: none;">
                                <div class="card border-left-primary shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" onclick="redirectLink()">
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="orange">학생이력관리시스템</font></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-id-card fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <!-- <a href="https://www.osan.ac.kr/?menuno=167">  -->
                            <a href="javascript:openMenu('https://lib.osan.ac.kr', 'lib')" style="text-decoration: none;">
                                <div class="card border-left-info shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1"></div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">도서관</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-book fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row" id="PC">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="javascript:openMenu('https://osanuniv.osan.ac.kr/osu/brower_check.jsp', 'univIsTest')" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="brown">대학정보시스템</font></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-cogs fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="https://www.osan.ac.kr/?menuno=221" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="blue">학사 일정</font></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-seedling fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>                        
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="#" style="text-decoration: none;">
	                            <div class="card border-left-success shadow h-80 py-0">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"></div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">공백</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa-bars fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </a>
                        </div>
                    </div>
                    
                    

                    <!-- Content Row -->
                    <div class="row">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <!-- <a href="https://www.osan.ac.kr/?menuno=167">  -->
                            <a href="javascript:openMenu('UCMLite_Guide.jsp?fr=ptl&pmenu=sch&smenu=data1', 'office365')" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1"></div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">OFFICE365</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-info-circle fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="javascript:openMenu('https://lifeedu.osan.ac.kr/html/index', 'lib')" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">평생교육원</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-user-edit fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="javascript:openMenu('https://ojt.osan.ac.kr/login.do', 'ojt')" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" onclick="redirectLink()"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">현장실습</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-hands-helping fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row" id="PC">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="https://www.osan.ac.kr/?menuno=225" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">장학안내</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <!-- <a href="https://www.osan.ac.kr/?menuno=167">  -->
                            <a href="https://www.osan.ac.kr/vr/osanuniv/index.htm" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1"></div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">캠퍼스안내</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-map-signs fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-4 mb-4">
                            <a href="https://www.osan.ac.kr/?menuno=259" style="text-decoration: none;">
                                <div class="card border-left-success shadow h-80 py-0">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">질문과답변</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
            <div class="grid-item">
                        <div class="box">
                            <div class="calendar">
                                <a href="javascript:getAcademicSchedule('prev')" class="prev"><img src="resources/img/calendar_left.png" alt="이전일정" /></a>
                                <strong id="currentYm">년 월</strong>
                                <a href="javascript:getAcademicSchedule('next')" class="next"><img src="resources/img/calendar_right.png" alt="다음일정" /></a>
                            </div>
                            <table class="table table-bordered" style="text-align: center;" border="1">
                            <colgroup>
                                <col style="width:33%; " />
                                <col style="width:*; " />
                            </colgroup>
                            <thead class="table-light">
                                <tr>
                                    <th class="ct">기간</th>
                                    <th class="ct">제목</th>
                                </tr>
                            </thead>
                                <tbody id="scheduleList"> 
                                </tbody> 
                            </table>
                         </div>
            </div>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    <!-- 포탈 기본 JavaScript-->
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/aes.js"></script>
    
    
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <!-- 
    <script src="/resources/js/demo/chart-area-demo.js"></script>
    <script src="/resources/js/demo/chart-pie-demo.js"></script>
     -->
    
    <script type="text/javascript"> 
       history.replaceState({}, null, location.pathname); 
       
       getAcademicSchedule();
       
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
               url : "/Schedule",
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
                   
                   selectHtml.push('<td style="font-size: 12px;">');
                   selectHtml.push(item.regDate);
                   selectHtml.push("~");
                   if(item.endDate != '00'){
                       selectHtml.push(item.endDate);
                   }
                   selectHtml.push('</td>')
                   
                   selectHtml.push('<td style="font-size: 12px;">'+item.title+'</td>'); 
                   selectHtml.push('</tr>');
               }); 
           }else{ 
               selectHtml.push('<tr>'); 
               selectHtml.push('<td colspan="2">조회된 결과가 없습니다.</td>'); 
               selectHtml.push('</tr>'); 
           } 
           $("#scheduleList").empty().html(selectHtml.join(''));
       }
    </script> 
    <style>
	.calendar{
	    text-align: center;
	    }
    </style>

</body>

</html>