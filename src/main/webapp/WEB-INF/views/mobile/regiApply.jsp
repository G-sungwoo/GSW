<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                    <h1 class="h3 mb-4 text-gray-800">나의 학적 정보</h1>
                     <p class="mb-4">1. 변경된 학적 주소정보를 빠짐없이 기재하고 저장하신 이후에 복학신청을 하시기 바랍니다.<br />
                                     2. 복학처리 확인은 처리상태가 '완료'이거나, 학적부에서 확인하시기 바랍니다.</p>
                    <div class="row">                    
                        <!-- Area Chart -->
                        <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">학적주소정보</h6>
                                    <a href="javascript:void(0);" onclick="updateStntInfo();" class="btn btn-info btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">저장
                                        </span>
                                    </a>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                                                    학번 : ${studentInfo.stnt_numb }<br/>
                                                                    성명 : ${studentInfo.korn_name }<br/>
                                                                    학과 : ${studentInfo.sust_name }<br/>
                                                                    전공 : ${studentInfo.majr_name }<br/>
                                                                    학년 : ${studentInfo.stnt_shyr }<br/>
                                <b>학적상태 : ${studentInfo.srst_stat }</b>
                                </div>
                                <div class="card-body">
                                    <form  action="" method="post" name="stntInfoForm" id="stntInfoForm">
                                                                                    연락처 : <input type="text" class="form-control bg-light border-0 small" name="stnt_hand" id="stnt_hand" value="${studentInfo.stnt_hand }" />
                                                                                    메일 : <input type="text" class="form-control bg-light border-0 small" name="stnt_emal" id="stnt_emal" value="${studentInfo.stnt_emal }" />
                                                                                    우편번호 : 
                                            <a href="javascript:void(0);" onclick="juso_search(this);" attr-a="stnt" class="btn btn-danger btn-icon-split btn-sm">
                                                <span class="text">검색</span>
                                            </a>
                                        <input type="text" class="form-control bg-light border-0 small" name="stnt_zipc" id="stnt_zipc" value="${studentInfo.stnt_zipc }" />
                                                                                    기본주소 : <input type="text" class="form-control bg-light border-0 small" name="stnt_bsar" id="stnt_bsar" value="${studentInfo.stnt_bsar }" />
                                                                                    상세주소 : <input type="text" class="form-control bg-light border-0 small" name="stnt_dtar" id="stnt_dtar" value="${studentInfo.stnt_dtar }" />
                                    </form>
                                </div>
                            </div>
                        </div>   
                        <!-- Pie Chart -->
                        <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">휴학 정보</h6>
                                </div>
                                <div class="card-body">
                                <form action="" method="post" name="ptrnInfoForm" id="ptrnInfoForm">
                                                        휴학구분 : ${studentOffInfo.srcg_rscd_name }<br />
                                                        휴학세부구분: ${studentOffInfo.enst_code_name }<br />
                                                                                     휴학학년 : ${studentOffInfo.csst_year }<br />
                                                                                     휴학학기: ${studentOffInfo.csst_shtm_k }<br />
                                                                                     휴학일자 : ${studentOffInfo.srcg_date }<br />
                                                                                     휴학학년: ${studentOffInfo.csst_shyr_k }<br />
                                                                                     변동사유 : ${studentOffInfo.srcg_resn }<br />
                                                                                     복학예정일: ${studentOffInfo.rsep_epdt }<br />
                                                                                     복학예정년도 : ${studentOffInfo.rsep_year }<br />
                                                                                     복학예정학기: ${studentOffInfo.rsep_shtm_k }<br />
                                                                                     입대일자 : ${studentOffInfo.enst_date }<br />
                                                                                     제대일자: ${studentOffInfo.dcmi_date }<br />
                                                                                     비고 : ${studentOffInfo.remk_text }
                                </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">복학 신청 정보</h6>
                                </div>
                                <div class="card-body">
                                <form action="" method="post" name="ptrnInfoForm" id="ptrnInfoForm">

                                        <p>복학구분 :
                                        <select name="srcg_rscd" class="srcg_rscd">
                                            <c:if test="${studentOffInfo.srcg_rscd == 'A18002'}">
                                                <option value="A19002">군입대복학</option>
                                            </c:if>
                                            <c:if test="${studentOffInfo.srcg_rscd != 'A18002'}">
                                                <option value="A19001">일반복학</option>
                                                <option value="A19003">휴학취소</option>
                                                <option value="A19004">조기복학</option>
                                            </c:if>
                                        </select>
                                        </p>
                                        <p>복학학년 :
                                        <select name="csst_shyr" class="csst_shyr">
                                                  <c:forEach var="list" items="${shtrInfo}" >
                                                      <option value="${list.value}"<c:if test="${studentOffInfo.csst_shyr eq list.value}">selected</c:if>>${list.key}</option>
                                                  </c:forEach>
                                        </select>
                                        </p>
                                        <p>복학학기:
                                        <select name="csst_shtm" class="csst_shtm">
                                                  <c:forEach var="list" items="${shtmInfo}" >
                                                      <option value="${list.value}"<c:if test="${studentOffInfo.csst_shtm eq list.value}">selected</c:if>>${list.key}</option>
                                                  </c:forEach>
                                        </select>                                        
                                        <select name="csst_shtm" class="csst_shtm">
                                            <c:if test="${studentOffInfo.csst_shtm =='1'}">
                                                <option value="1" selected>1학기</option>
                                                <option value="2">2학기</option>
                                            </c:if>
                                            <c:if test="${studentOffInfo.csst_shtm =='2'}">
                                                <option value="1">1학기</option>
                                                <option value="1" selected>2학기</option>
                                            </c:if>
                                        </select>
                                        </p>
                                                                      복학일자: <input type="date" class="form-control bg-light border-0 small" name="csst_date" id="csst_date" value="${studentOffInfo.csst_date_format }" />
                                                                                     접수번호 : <input type="text" class="form-control bg-light border-0 small" name="stnt_hand" id="stnt_hand" value="${studentOffInfo.prtn_numb }" disabled/>
                                                                                     복학년도: <input type="number" class="form-control bg-light border-0 small" name="stnt_hand" id="stnt_hand" value="${studentOffInfo.csst_year }" />
                                                                                     신청일자 : <input type="text" class="form-control bg-light border-0 small" name="stnt_hand" id="stnt_hand" value="${studentOffInfo.aply_date_format }" disabled/>
                                                                                     
                                                                                     처리상태: <input type="text" class="form-control bg-light border-0 small" name="stnt_hand" id="stnt_hand" value="${studentOffInfo.apst_name }" disabled/>
                                </form>
                                </div>
                            </div>
                        </div>
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
     
    <script type="text/javascript">
    //속성이 비슷한 화면이 열려있을때 left open 스크립트 - leftmenu.jsp에서 class="munu + n"으로 관리중..
    if (navigator.userAgent.match(/Android/i) ||
        navigator.userAgent.match(/webOS/i) ||
        navigator.userAgent.match(/iPhone/i) ||
        navigator.userAgent.match(/iPad/i) ||
        navigator.userAgent.match(/iPod/i) ||
        navigator.userAgent.match(/BlackBerry/i) ||
        navigator.userAgent.match(/Windows Phone/i)) {
          
    } else {
        window.onload = function(){
            var myClassDiv = document.querySelector(".menu1");
            myClassDiv.classList.add("show");
        }
        console.log("PC");
    }    
    
        /*개인정보 수정*/    
        function updateStntInfo(obj){
            
            var formData = $("#stntInfoForm, #ptrnInfoForm").serialize();

        $.ajax({
            type : "POST",
            async : false,
            url : "/updateStntInfo",
            data : formData,
            dataType : "text",
            success : updateStntInfoOk
        });
    
        /*개인정보 수정 callback*/
        function updateStntInfoOk(data, status){
            if(data == "UPDATE_OK"){
                alert("개인정보가 수정되었습니다.");
                //reload();
            }else{
                alert("개인정보 수정이 정상적으로 처리되지 않았습니다.");
                return;
            }
        }       

        
        //ptrnInfoForm 
    }
    </script>
    
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>    
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function juso_search(obj) {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                var flag = $(obj).attr('attr-a');
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    if(flag=="stnt"){
                    document.getElementById("stnt_dtar").value = extraAddr;
                    } else if(flag="ptrn"){
                    document.getElementById("ptrn_dtar").value = extraAddr;
                    }
                
                } else {
                    if(flag=="stnt"){
                        document.getElementById("stnt_dtar").value = '';
                        } else if(flag="ptrn"){
                        document.getElementById("ptrn_dtar").value = '';   
                        }
                }

                if(flag=="stnt"){
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('stnt_zipc').value = data.zonecode;
                        document.getElementById("stnt_bsar").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("stnt_dtar").focus();
                    } else if(flag="ptrn"){
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('ptrn_zipc').value = data.zonecode;
                        document.getElementById("ptrn_bsar").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("ptrn_dtar").focus();
                    }


                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
    
</body>

</html>