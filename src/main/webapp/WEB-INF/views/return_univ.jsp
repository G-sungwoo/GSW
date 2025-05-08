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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        srchStudentInfo();
    });
    function srchStudentInfo(){
        
        var svcUrl = "/selectStudentInfo";
        var formData = $("#myFormLecture").serialize();
        $.ajax({
            type:"POST",
            url: svcUrl,
            async:false,
            data:"",
            dataType : "json",
            success : srchStudentInfoOK
        });
        
    }
    function srchStudentInfoOK(data, status){
        var item=data.studentInfo;
        $('#stnt_numb').val(item.stnt_numb);
        $('#stnt_name').val(item.korn_name);
        $('#tel').val(item.ptrn_hand);
        $('#email').val(item.stnt_emal);
        $('#post1').val(item.stnt_zipc);
        $('#address1').val(item.stnt_bsar);
        $('#address2').val(item.stnt_dtar);
        $('#hp').val(item.stnt_hand);
        if(item.srst_code != 'XXXYYDDWWE'){
            alert("휴학정보가 존재하지 않습니다.");
            $('#retBtn').attr("disabled",true);
            return;
        }
        var item2=data.studentChange;
        $('#rscd_name').val(item2.srcg_rscd_name);
        $('#rscd_dt_name').val(item2.enst_code_name);
        $('#csst_shtm').val(item2.csst_shtm_k);
        $('#csst_shyr').val(item2.csst_shyr_k);
        $('#rsep_shtm').val(item2.rsep_shtm_k);
        $('#csst_year').val(item2.csst_year);
        $('#srcg_date').val(item2.srcg_date);
        $('#srcg_resn').val(item2.srcg_resn);
        $('#rsep_epdt').val(item2.rsep_epdt);
        $('#rsep_year').val(item2.rsep_year);
        $('#enst_date').val(item2.enst_date);
        $('#dcmi_date').val(item2.dcmi_date);
        $('#remk_text').val(item2.remk_text);
        if(item2.sust_name != ''){
            alert("입학학과과 변경되어 교무처 확인이 필요합니다.\n문의: 031-370-2533");
            $('#retBtn').attr("disabled",true);
            return;
        }
    }
    </script>
    <link type="text/css" href="resources/css/layout.css" rel="stylesheet" />

</head>
<body>
<div class="container">
    <form name="f" method="post">
 
        <div class="col-sm-12 pt-3">
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title"><i class="fas fa-square"></i> 학적 정보</h4>
                    <p class="card-catagory"></p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr style="line-height:32px;">
                                <td>학번</td>
                                <td>
                                    <input type="text" name="stnt_numb" id = "stnt_numb" class="form-control" value="" readonly>
                                </td>
                                <td>이름</td>
                                <td>
                                    <input type="text" name="stnt_name" id = "stnt_name" class="form-control" value="" readonly>
                                </td>                        
                            </tr> 
                            <tr>
                                <td>전화번호</td>
                                <td>
                                    <input type="text" name="tel" id="tel" class="form-control" value="" readonly>
                                </td>
                                <td>이메일</td>
                                <td>
                                    <input type="text" name="email" id="email" class="form-control" value="" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>우편번호</td>
                                <td>
                                    <input type="text" name="post1" id="post1" size="5" class="form-control" readonly value="" style="display:inline-block;width:100px;" readonly> 
                                    <i class="fas fa-search" onclick="sample6_execDaumPostcode()" style="cursor:pointer;font-size:24px;"></i>
                                </td>
                                <td>휴대폰</td>
                                <td><input type="text" name="hp" id="hp" class="form-control" value="" readonly></td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td colspan="3">
                                    <input type="text" name="address1" id="address1" class="form-control mb-3" value="" readonly>
                                    <input type="text" name="address2" id="address2" class="form-control" value="" readonly>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="pt-3"></div>
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title"><i class="fas fa-square"></i> 휴학 정보</h4>
                    <p class="card-catagory"></p>
                </div>
                <div class="card-body">
                    <table class="table">
                        <tbody>
                            <tr style="line-height:32px;">
                                <td>휴학구분</td>
                                <td>
                                    <input type="text" name="rscd_name" id="rscd_name" class="form-control" value="" readonly>
                                </td>
                                <td>휴학세부구분</td>
                                <td>
                                    <input type="text" name="rscd_dt_name" id="rscd_dt_name" class="form-control" value="" readonly>
                                </td>                     
                                <td>휴학년도</td>
                                <td>
                                    <input type="text" name="csst_year" id="csst_year" class="form-control" value="" readonly>
                                </td>
                                <td>휴학학기</td>
                                <td>
                                    <input type="text" name="csst_shtm" id="csst_shtm" class="form-control" value="" readonly>
                                </td>    
                            </tr> 
                            <tr style="line-height:32px;">   
                                <td>휴학일자</td>
                                <td>
                                    <input type="text" name="srcg_date" id="srcg_date" class="form-control" value="" readonly>
                                </td>
                                <td>휴학학년</td>
                                <td>
                                    <input type="text" name="csst_shyr" id="csst_shyr" class="form-control" value="" readonly>
                                </td>                     
                                <td>변동사유</td>
                                <td>
                                    <input type="text" name="srcg_resn" id="srcg_resn" class="form-control" value="" readonly>
                                </td>  
                                <td>복학예정일</td>
                                <td>
                                    <input type="text" name="rsep_epdt" id="rsep_epdt" class="form-control" value="" readonly>
                                </td>                      
                            </tr> 
                            <tr style="line-height:32px;">   
                                <td>복학예정년도</td>
                                <td>
                                    <input type="text" name="rsep_year" id="rsep_year" class="form-control" value="" readonly>
                                </td>
                                <td>복학예정학기</td>
                                <td>
                                    <input type="text" name="rsep_shtm" id="rsep_shtm" class="form-control" value="" readonly>
                                </td>                     
                                <td>입대일자</td>
                                <td>
                                    <input type="text" name="enst_date" id="enst_date" class="form-control" value="" readonly>
                                </td>  
                                <td>제대일자</td>
                                <td>
                                    <input type="text" name="dcmi_date" id="dcmi_date" class="form-control" value="" readonly>
                                </td>                      
                            </tr>
                            <tr style="line-height:32px;">   
                                <td>비고</td>
                                <td colspan='7'>
                                    <input type="text" name="remk_text" id="remk_text" class="form-control" value="" readonly>
                                </td>                    
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="pt-3"></div>
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title"><i class="fas fa-square"></i> 복학신청등록</h4>
                    <p class="card-catagory"></p>
                </div>
                <div class="card-body">
                    <table class="table">
                        <tbody>
                            <tr style="line-height:32px;">
                                <td>복학구분</td>
                                <td>
                                    <input type="text" name="admin_id" class="form-control" value="" readonly>
                                </td>
                                <td>복학일자</td>
                                <td>
                                    <input type="text" name="admin_name" class="form-control" value="" readonly>
                                </td>                     
                                <td>접수번호</td>
                                <td>
                                    <input type="text" name="admin_id" class="form-control" value="" readonly>
                                </td>  
                            </tr> 
                            <tr style="line-height:32px;">   
                                <td>복학년도</td>
                                <td>
                                    <input type="text" name="admin_id" class="form-control" value="" readonly>
                                </td>
                                <td>복학학년</td>
                                <td>
                                    <input type="text" name="admin_name" class="form-control" value="" readonly>
                                </td>                     
                                <td>복학학기</td>
                                <td>
                                    <input type="text" name="admin_id" class="form-control" value="" readonly>
                                </td>                       
                            </tr> 
                            <tr style="line-height:32px;">   
                                <td>신청일자</td>
                                <td>
                                    <input type="text" name="admin_id" class="form-control" value="" readonly>
                                </td>
                                <td>처리상태</td>
                                <td>
                                    <input type="text" name="admin_name" class="form-control" value="" readonly>
                                </td>                                          
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
    </form>
 
    <div class="text-center mt-3">
        <button type="button" id="retBtn" class="btn btn-success">복학신청</button>
    </div>
</div>
</body>
</html>