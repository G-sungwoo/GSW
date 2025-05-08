<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" id="viewport-meta" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>테스트-정보시스템</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/resources/css/custom.css" rel="stylesheet">


</head>

<body id="page-top">

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
                    <h1 class="h3 mb-4 text-gray-800">${gradeInfo.lect_year}-${gradeInfo.lect_shtm}학기 성적조회</h1>
                                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">학생 시간표</h6>
                            <button type="button" class="btn btn-success btn-icon-split btn-sm" onclick="pc_view();">
                            <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">PC화면으로 보기</span>
                            </button>
                         
                        </div>
                    <form  action="" method="post" name="CourApprForm" id="CourApprForm" >
				        <table class="table table-bordered" style="text-align: center;" border="1">
				        <input name="lect_year" id="lect_year" type="hidden" value="${gradeInfo.lect_year}" />
				        <input name="lect_shtm" id="lect_shtm" type="hidden" value="${gradeInfo.lect_shtm}" />
				            <thead class="table-light">
				                <tr>
				                    <th>과목명</th>
				                    <th>담당교수</th>
				                    <th>학점</th>
				                    <th>이수구분</th>
				                    <th>점수</th>
				                    <th>평점</th>
				                    <th>등급</th>
				                    <th>수업운영</th>
				                    <th>평가점수</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach items="${gradeList}" var="list">
									<tr>
									    <td id="sbjt_name">${list.sbjt_name }</td>
									    <td id="staf_name">${list.staf_name }</td>
									    <td id="lect_pont">${list.lect_pont }</td>
									    <td id="pobt_flag">${list.pobt_flag }</td>
									    <td id="totl_scor">${list.totl_scor }</td>
									    <td id="lect_maks">${list.lect_maks }</td>
									    <td id="lect_grad">${list.lect_grad }</td>
									    <td id="pssj_flag">${list.cvmj_ysno }</td>
									    <td id="exng_scor">${list.exng_scor }</td>
									</tr>
				                </c:forEach>
				            </tbody>
				        </table>
				    </form>
                    <div class ="surveyForm">
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

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


    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <!-- 
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>
     -->
    <!-- Page level custom scripts -->
    <!-- 
    <script src="/resources/js/demo/chart-area-demo.js"></script>
    <script src="/resources/js/demo/chart-pie-demo.js"></script>
     -->

	<script>
	    function pc_view(){
	        var viewportMeta = document.getElementById('viewport-meta');
	        if (viewportMeta) {
	            viewportMeta.setAttribute('content', 'width=device-width, initial-scale=' + 0.5 + ', shrink-to-fit=no');
	        } 
	        alert("가로모드를 권장합니다.");
	    }
	    
	    //속성이 비슷한 화면이 열려있을때 left open 스크립트 - leftmenu.jsp에서 class="munu + n"으로 관리중..
	    if (navigator.userAgent.match(/Android/i) ||
	        navigator.userAgent.match(/webOS/i) ||
	        navigator.userAgent.match(/iPhone/i) ||
	        navigator.userAgent.match(/iPad/i) ||
	        navigator.userAgent.match(/iPod/i) ||
	        navigator.userAgent.match(/BlackBerry/i) ||
	        navigator.userAgent.match(/Windows Phone/i)) {
	        
	        console.log("MOBILE");
	        
	    } else {
	        window.onload = function(){
	            var myClassDiv = document.querySelector(".menu3");
	            myClassDiv.classList.add("show");
	        }
	        console.log("PC");
	    }
	</script>
	
</body>

</html>