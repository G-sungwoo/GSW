<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.osan.portal.vo.AtendInfo"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html;charset=utf-8" errorPage="/jsp/common/error/catchException.jsp"%>

<%@page import="java.util.List" %>
<%-- <%@page import="com.eaction.common.util.PagingUtil" %> --%>
<%-- <%@page import="com.eaction.common.util.DateTimeUtil" %> --%>
<%-- <%@page import="com.eaction.common.util.StringUtil" %> --%>
<%-- <%@page import="com.eaction.ucms.business.mst.constant.MstConstKey"%> --%>
<%-- <%@page import="com.eaction.ucms.common.util.DisplayUtil" %> --%>
<%-- <%@page import="com.eaction.ucms.common.code.CodeTableMng" %> --%>
<%-- <%@page import="com.eaction.ucms.business.atend.constant.AtendConstKey"%> --%>
<%-- <%@page import="com.eaction.ucms.business.atend.model.AtendSearchInfo" %> --%>
<%-- <%@include file="/WEB-INF/jsp/common/include.inc" %> --%>

<%
	
	//AtendInfo info 	= (AtendInfo)request.getAttribute(ConstKey.INFO_DATA);
	//String url = ConstUrl.ATEND_MNG_PFS_URL + "?menuUrl=" + menu_url + "&root=" + root;
	
%>
<script src="resources/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="resources/js/printThis.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var title_no = $("#subject_title_no").val();
	if(!title_no){
		alert("출석부를 보실 강의를 선택해주세요.");
		return;
	}
	var svcUrl = '';
	$.ajax({
		type:"POST",
		url: "/selectAtendLectureStdList",
		async:false,
		data: $("#myFormAtendAll").serialize(),
        success : function(rs){
        	var crntWeek = rs.currentWeek
        	$("#all_pro_name").text(rs.info.professor_code + " / " +rs.info.professor_name);
        	$("#all_grp_name").text(rs.info.subject_grp_name);
        	$("#all_class_name").text(rs.info.subject_title_no+" / " + rs.info.subject_title_name);
        	$("#all_grade_ban").text(rs.info.grade +"학년 / " + rs.info.class_divide +"반");
        	$("#all_point").text(rs.info.college_credit);
        	var lect_date = rs.timeInfo[0].lect_date;
        	var span = lect_date[0].length + 1;
        	var length = lect_date[0].length;
        	
        	/* Head */
        	var thead = "";
        	
        	thead += "<tr>";
        	thead += "<th rowspan='"+span+"' >No.</th>";
        	thead += "<th rowspan='"+span+"' >사진</th>";
        	thead += "<th rowspan='"+span+"' >학번<br>이름</th>";
        	thead += "<th style='border-bottom: 1px solid #fff;'>주</th>";
        	for(var i = 1; i <= 15; i++){
        		thead +="<th class=a"+i+" >"+i+"</th>"
        	}    
        	for(var i = 0; i < rs.addInfoList.length; i++)
			{
				thead += "<th rowspan='"+span+"'><strike style = 'color : rgb(255,0,0);'>"+rs.addInfoList[i].origin_info+"</strike><br>"+rs.addInfoList[i].lect_day +" "+ rs.addInfoList[i].time_numb +"교시</th>";
			}      
        	thead += "<th rowspan='"+span+"' >출석</th>";
        	//thead += "<th rowspan='"+span+"' >통계</th>";
        	thead += "</tr>";
        	var lect_date_month, lect_date_day, lect_date_week, data_lect_date;
        	for(var i=0; i < length; i++){
        		if(i==0){
        			thead += "<tr style='height:40px'>";
        			thead += "<th rowspan='"+length+"'>월/일</th>";
        			for(var ii = 1; ii <= lect_date.length; ii++){
        				if((ii == 15) && (lect_date[ii-1][i]))
        				{
        					lect_date_month = lect_date[ii-1][i].substring(0,2);
        					lect_date_day = lect_date[ii-1][i].substring(3,5);
        					lect_date_week = lect_date[ii-1][i].substring(6,7);
        					if(lect_date_month == "06"){
        						switch(lect_date_day)
            					{
    	        					case "10" : lect_date_day = "17";
    	        					break;
    	        					case "11" : lect_date_day = "18";
    	        					break;
    	        					case "12" : lect_date_day = "19";
    	        					break;
    	        					case "13" : lect_date_day = "20";
    	        					break;
    	        					case "14" : lect_date_day = "21";
    	        					break;        					
            					}
        					}else if(lect_date_month == "12"){
        						switch(lect_date_day)
            					{
    	        					case "03" : lect_date_day = "17";
    	        					break;
    	        					case "04" : lect_date_day = "18";
    	        					break;
    	        					case "05" : lect_date_day = "12";
    	        					break;
    	        					case "06" : lect_date_day = "13";
    	        					break;
    	        					case "07" : lect_date_day = "14";
    	        					break;        					
            					}
        					}
            				lect_date[ii-1][i] = lect_date_month+"/"+lect_date_day+"/"+ lect_date_week;
        				}
        				thead += "<th class=a"+ii+" id=d"+ii+">"+lect_date[ii-1][i]+"</th>";
        			}
        			thead += "</tr>";
        		}else{
        			thead += "<tr style='height:40px'>";
        			for(var ii = 1; ii <= lect_date.length; ii++){
        				
        				if((ii == 15) && (lect_date[ii-1][i]))
        				{
        					lect_date_month = lect_date[ii-1][i].substring(0,2);
        					lect_date_day = lect_date[ii-1][i].substring(3,5);
        					lect_date_week = lect_date[ii-1][i].substring(6,7);
        					if(lect_date_month == "06"){
        						switch(lect_date_day)
            					{
    	        					case "11" : lect_date_day = "25";
    	        					break;
    	        					case "12" : lect_date_day = "26";
    	        					break;
    	        					case "13" : lect_date_day = "20";
    	        					break;
    	        					case "14" : lect_date_day = "21";
    	        					break;
    	        					case "15" : lect_date_day = "22";
    	        					break;        					
            					}
        					}else if(lect_date_month == "12"){
        						switch(lect_date_day)
            					{
    	        					case "03" : lect_date_day = "17";
    	        					break;
    	        					case "04" : lect_date_day = "18";
    	        					break;
    	        					case "05" : lect_date_day = "12";
    	        					break;
    	        					case "06" : lect_date_day = "13";
    	        					break;
    	        					case "07" : lect_date_day = "14";
    	        					break;        					
            					}
        					}
        					
            				lect_date[ii-1][i] = lect_date_month+"/"+lect_date_day+"/"+ lect_date_week;
        				}
        				thead += "<th class=a"+ii+" id=d"+ii+">"+lect_date[ii-1][i]+"</th>";
        			}
        			thead += "</tr>";
        		}
        	}
        	
        	$("#all_atend_std_list_head").html(thead);
        	
			/* Body  */
        	var tr = "";
        	for(var i = 0; i < rs.stdList.length; i++){
        		
        		var index0 = rs.stdList[0].atend_detail.length;
        		var index1 = rs.stdList[0].atend_detail[0].length;
        		
        		for(var iii=0; iii < index1; iii++) {
        			if(iii==0){
        				tr += "<tr class='atend_std' style='height:40px'>";
                		tr += "<td rowspan='"+rs.timeInfo.length+"'>"+(i+1)+"</td>";  
                		tr += "<td rowspan='"+rs.timeInfo.length+"'><img src=\"/ShowImage.do?imgIdx="+rs.stdList[i].student_code+"\" onerror=\"this.src='../../resources/img/pro_noimg_170.png'\" style='width: 100px;'></td>";
                		tr += "<td rowspan='"+rs.timeInfo.length+"'>"+rs.stdList[i].student_code+"<br>"+rs.stdList[i].student_name+"</td>";
                		
                		tr += "<td>"+rs.timeInfo[iii].from_lttm+"교시</td>";
        				for(var ii = 1; ii <= 15; ii++){
        					var status = rs.stdList[i].atend_detail[ii-1][iii][0];
        					if(status == null){
        						status='';
        					}
        					tr += "<td class='a"+ii+"' id='a" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+iii+"'>"+status+"</td>";
                		}
        				for(var iz = 0; iz < rs.addInfoList.length; iz++)
        				{
        					var status = rs.stdList[i].atend_detail[rs.addInfoList[iz].no-1][0][0];
        					if(status == null){
        						status='';
        					}
        					if(status =='휴강'){
        						
        						tr += "<td rowspan='"+index1+"' style = 'color : rgb(255,0,0);'>"+status+"</td>";
        					}else{
        						tr += "<td rowspan='"+index1+"'>"+status+"</td>";
        					}
        				}
                		
                		tr += "<td rowspan='"+index1+"' id='"+rs.stdList[i].student_code+"_resultAtendPoint'>"+rs.stdList[i].weekTimeForPoint+"</td>";
                		//tr += "<td rowspan='"+index1+"'>"+rs.stdList[i].statisString+"</td>";
                		tr += "</tr>";
        			}else{
        				tr += "<tr class='atend_std' style='height:40px'>";
        				tr += "<td>"+rs.timeInfo[iii].from_lttm+"교시</td>";
        				for(var ii = 1; ii <= 15; ii++){
        					var status = rs.stdList[i].atend_detail[ii-1][iii][0];
        					if(status == null){
        						status='';
        					}
        					tr += "<td class='a"+ii+"' onclick=\"javascript:atendCheck('a" +ii +"' ,'" + rs.stdList[i].student_code +"', this);\" id='a" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+iii+"'>"+status+"</td>";
                		}
        				tr += "</tr>";
        			}
    			}
        		
        		
        	}
        	$("#all_atend_std_list").html(tr);
        	
        },
        error:function(request,status,error){
        	 alert("code:"+request.status+"\n"+"error:"+error);
        }
		
	});
});

function printDiv () {	
	//window.print();  
	//$("#popup_atend").printThis();
	
	pagePrintPreview();
} 
function pagePrintPreview(){
	 
    var browser = navigator.userAgent.toLowerCase();
    if ( -1 != browser.indexOf('chrome') ){
               window.print();
    }else if ( -1 != browser.indexOf('trident') ){
               try{
                        //참고로 IE 5.5 이상에서만 동작함

                        //웹 브라우저 컨트롤 생성
                        var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';

                        //웹 페이지에 객체 삽입
                        document.body.insertAdjacentHTML('beforeEnd', webBrowser);

                        //ExexWB 메쏘드 실행 (7 : 미리보기 , 8 : 페이지 설정 , 6 : 인쇄하기(대화상자))
                        previewWeb.ExecWB(7, 1);

                        //객체 해제
                        previewWeb.outerHTML = "";
               }catch (e) {
                        alert("- 도구 > 인터넷 옵션 > 보안 탭 > 신뢰할 수 있는 사이트 선택\n   1. 사이트 버튼 클릭 > 사이트 추가\n   2. 사용자 지정 수준 클릭 > 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 (사용)으로 체크\n\n※ 위 설정은 프린트 기능을 사용하기 위함임");
               }
              
    }
    
}
</script>
    <link type="text/css" href="resources/css/pfs/board.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/common.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/contents.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/font.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/form.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/import.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/layout.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/main.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/jquery.mobile-1.3.2.min.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/member.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/modalPopLite.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/popup.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/profile_popup.css" rel="stylesheet" />
    <link type="text/css" href="resources/css/pfs/reset.css" rel="stylesheet" />
<form name="myFormAtendAll" id="myFormAtendAll" method="POST" action="">
<input type="hidden" id="subject_title_no" name="subject_title_no" value="${INFO_DATA.subject_title_no}">
<input type="hidden" id="class_divide" name="class_divide" value="${INFO_DATA.class_divide}">
<input type="hidden" id="year" name="year" value="${INFO_DATA.year}">
<input type="hidden" id="semester" name="semester" value="${INFO_DATA.semester}">
<input type="hidden" id="srch_subject_title_no" name="srch_subject_title_no" value="${INFO_DATA.subject_title_no}">
<input type="hidden" id="srch_class_divide" name="srch_class_divide" value="${INFO_DATA.class_divide}">
<input type="hidden" id="srch_year" name="srch_year" value="${INFO_DATA.year}">
<input type="hidden" id="srch_semester" name="srch_semester" value="${INFO_DATA.semester}">
<input type="hidden" id="srch_professor_code" name="srch_professor_code" value="${INFO_DATA.professor_code}">
	<div class="popup_atend11" id="popup_atend" style="text-align: center; margin: 10px;">
		<div style="float: left;">
			<a href="javascript:printDiv();" class="btn_search" >출력</a>
		</div>
		<div class="question_head11">
			<p class="mt20 mb20" style="font-size: 30px;">출석부</p>
		</div>
		
		<div class="question_body11">
				<table class="atend_list" style="width: 100%;">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="">
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="15%">		
					</colgroup>
						<tr>
							<td colspan="6">
								●(출석),≠(지각),/(결석),△(조퇴),O(조기취업)
							</td>
							<th>
								담당교수
							</th>
							<th>
								학과장
							</th>
						</tr>
						<tr>
							<th>
								개설학과
							</th>
							<td id="all_grp_name">
								
							</td>
							<th>
								교수명
							</th>
							<td id="all_pro_name">
								
							</td>
							<th>
								학점
							</th>
							<td id="all_point">
								
							</td>
							<td rowspan="2" >
							
							</td>
							<td rowspan="2">
							</td>
						</tr>
						<tr>
							<th>
								학년/반
							</th>
							<td id="all_grade_ban">
								
							</td>
							<th>
								과목명
							</th>
							<td colspan="3" id="all_class_name">
								
							</td>
						</tr>
					</table>
				</div>
		<div class="question_body11 mt20">
				<div id="head" class="">
					<table class="atend_check_list" style="width: 2340px;">
						<colgroup>
							<col width="50px"> <!-- 번호 -->							
							<col width="140px" class="colPic"> <!-- 사진 -->
							<col width="140px" class="colName"> <!-- 학번/이름 -->
							<col width="100px"> <!-- 주 -->
							<%
								for (int i = 1; i <= 15; i++) {
							%>
							<col width="90px" class="colWeeks">
							<%
								}
							%>
							<col width="60px" class="colCheck"> <!-- 중간 -->
							<col width="60px" class="colCheck"> <!-- 기말 -->
							<col width="60px" class="colCheck"> <!-- 평소 -->
							<col width="60px" class="colCheck"> <!-- 출석 -->
							<col width="60px" class="colCheck"> <!-- 합계 -->
							<col width="60px" class="colCheck"> <!-- 비고  -->
						</colgroup>
						<thead id="all_atend_std_list_head">
						</thead>
					
						<tbody id="all_atend_std_list">
						</tbody>
					</table>
				</div>
		</div>
	</div>
</form>