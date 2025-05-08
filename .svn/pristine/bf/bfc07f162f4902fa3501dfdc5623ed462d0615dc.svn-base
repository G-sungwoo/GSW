<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstl.jsp"%>
<!DOCTYPE html>

                    <h1 class="h3 mb-4 text-gray-800">과목명: ${surveyInfo.sbjt_krnm} / 교수명 : ${surveyInfo.sprf_krnm}</h1>
                    <form  action="" method="post" name="midTermForm" id="midTermForm">
                        <table class="table table-bordered" style="text-align: center;" border="1">
                        <input name="lect_year" id="lect_year" type="hidden" value="${surveyInfo.lect_year}" />
                        <input name="lect_shtm" id="lect_shtm" type="hidden" value="${surveyInfo.lect_shtm}" />
                        <input name="haks_numb" id="haks_numb" type="hidden" value="${surveyInfo.haks_numb}" />
                        <input name="clss_numb" id="clss_numb" type="hidden" value="${surveyInfo.clss_numb}" />
                        <input name="sprf_numb" id="sprf_numb" type="hidden" value="${surveyInfo.sprf_numb}" />
                        <input name="action" id="action" type="hidden" value="save" />
                            <thead class="table-light">
                                <tr>
                                    <th>순번</th>
                                    <th>문항명</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <tr><td rowspan="2" id="question1">1</td><td>본 강의에서 마음에 드는 점을 적어 주시기 바랍니다.</td></tr>
                                    <tr><td>
                                        <div class="mydict">
                                            <div>
                                                <input type="text" class="form-control_custom1 bg-gray-200 border-1 small"  id="dscp_ansr1" name="dscp_ansr1" aria-label="Search" aria-describedby="basic-addon2">
                                            </div>
                                        </div>
                                    </td></tr>
                                    <tr><td rowspan="2" id="question2">2</td><td>본 강의에서 개선되길 바라는 점을 적어주시기 바랍니다.</td></tr>
                                    <tr><td>
                                        <div class="mydict">
                                            <div>
                                                <input type="text" class="form-control_custom1 bg-gray-200 border-1 small"  id="dscp_ansr2" name="dscp_ansr2" aria-label="Search" aria-describedby="basic-addon2">
                                            </div>
                                        </div>
                                    </td></tr>
                                    <tr><td rowspan="2" id="question3">3</td><td>본 강의를 담당하는 교수님께 남기고 싶은 말을 적어주시기 바랍니다.</td></tr>
                                    <tr><td>
                                        <div class="mydict">
                                            <div>
                                                <input type="text" class="form-control_custom1 bg-gray-200 border-1 small"  id="dscp_ansr3" name="dscp_ansr3" aria-label="Search" aria-describedby="basic-addon2">
                                            </div>
                                        </div>
                                    </td></tr>
                                    <tr><td rowspan="2" id="question4">4</td><td>수업시간이 제대로 준수 되었나요?</td></tr>
                                    <tr><td>
                                        <div class="mydict">
                                            <div>
                                                <label><input type="radio" id="prbl_an01" name="prbl_an01" value="1"><span style="font-size:9pt;">준수되었다</span></label>
                                                <label><input type="radio" id="prbl_an01" name="prbl_an01" value="2"><span style="font-size:9pt;">그렇지 않다</span></label>
                                            </div>
                                        </div>
                                    </td></tr>
                                    <tr><td rowspan="2" id="question5">5</td><td>사전에 예고되지 않은 휴강이 있었나요?</td></tr>
                                    <tr><td>
                                        <div class="mydict">
                                            <div>
                                                <label><input type="radio" id="prbl_an02" name="prbl_an02" value="1"><span style="font-size:9pt;">있었다</span></label>
                                                <label><input type="radio" id="prbl_an02" name="prbl_an02" value="2"><span style="font-size:9pt;">없었다</span></label>
                                            </div>
                                        </div>
                                    </td></tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="container-div" style="text-align:center; padding-bottom:15px;">
	                    <a href="javascript:void(0);" onclick="validateForm();" class="btn btn-info btn-icon-split btn-la">
	                        <span class="icon text-white-50">
	                            <i class="fas fa-arrow-right"></i>
	                        </span>
	                        <span class="text">강의평가 제출
	                        </span>
	                    </a>
                    </div>

    <script type="text/javascript">

    function validateForm() {
    	
    	// 텍스트 입력 필드들에 대한 유효성 검사
        var dscp_ansr1 = document.getElementById("dscp_ansr1").value.trim();
        var dscp_ansr2 = document.getElementById("dscp_ansr2").value.trim();
        var dscp_ansr3 = document.getElementById("dscp_ansr3").value.trim();
        
        // 라디오 버튼들에 대한 유효성 검사
        var prbl_an01 = document.querySelector('input[name="prbl_an01"]:checked');
        var prbl_an02 = document.querySelector('input[name="prbl_an02"]:checked');

        if (dscp_ansr1 === "") {
            alert("1번 문항에 응답을 입력해주세요.");
            return false;
        }
        if (dscp_ansr2 === "") {
            alert("2번 문항에 응답을 입력해주세요.");
            return false;
        }
        if (dscp_ansr3 === "") {
            alert("3번 문항에 응답을 입력해주세요.");
            return false;
        }
        if (prbl_an01 === null) {
            alert("4번 문항에 응답을 선택해주세요.");
            return false;
        }
        if (prbl_an02 === null) {
            alert("5번 문항에 응답을 선택해주세요.");
            return false;
        }
        
        // 폼이 유효하면 true 반환하여 제출 진행
        saveMidTerm();
    }

    </script>