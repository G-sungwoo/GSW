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
    <script type="text/javascript">
    $(document).ready(function() {
        $("#srch_content").keydown(function(key) {
            if(key.keyCode == 13){
            	srchAtendLeckture();
            }
        });
    });
    function srchAtendLeckture(){
        
        var svcUrl = "/searchLectureList";
        var formData = $("#myFormLecture").serialize();
        $.ajax({
            type:"POST",
            url: svcUrl,
            async:false,
            data:formData,
            dataType : "json",
            success : srchAtendLecktureOK
        });
        
    }
    function srchAtendLecktureOK(data, status){
        var item=data.jsonList[0].resultAtendLectureList; 
        var selectHtml=[]; 
        var len=item.length; 
        var classItem = "";
        for(var i = 0; i < len; i++){
            classItem += '<a href="javascript:clickLecture(\''+item[i].subject_title_no+'\',\''+item[i].class_divide+'\',\''+item[i].year+'\',\''+item[i].semester+'\',\''+item[i].lecture_time+'\');"><span>'+item[i].subject_title_no+'<br>'+item[i].subject_title_name+'<br>'+item[i].grade+'학년 '+item[i].class_divide+'반'+'<br>'+'</span></a>';
        }
        if(len == 0){
            $("#classItem").html('검색결과가 없습니다. 내가 강의한 강의만 검색됩니다.');
        }else{
            $("#classItem").html(classItem);
        }
    }
    function clickLecture(sub_no, ban, year, semester, lecture_time){
        $("#all_atend_std_list").html('');
        $("#atend_std_list").html('');
        $("#atend_check_list").hide();
        $("#popPrintForm #professor_code").val($("#srch_professor_code").val());
        var svcUrl = "/selectAtendLectureStdList";
        
        $("#subject_title_no").val(sub_no);
        $("#class_divide").val(ban);
        $("#year").val(year);
        $("#semester").val(semester);
        
        $("#subject_title_no_print").val(sub_no);
        $("#class_divide_print").val(ban);
        $("#year_print").val(year);
        $("#semester_print").val(semester);
        $("#pfcode_print").val($("#srch_professor_code").val());
        
        var timestamp_time = new Date().getTime();
        var timestamp_formation=new Date('06/29/2018 06:00:00').getTime();
        $("#all_atend_std_list").html('');
        $("#atend_std_list").html('');
        $("#all_time_list").html('');
        $("#all_time_info").html('');
        $("#popup_atend_one .btn_close").click();
        $("#popup_atend_addLecture .btn_close").click();
        
         $.ajax({
            type:"POST",
            url: svcUrl,
            async:false,
            data: { 
            	srch_lect_time : lecture_time,
            	srch_subject_title_no : sub_no,
            	srch_class_divide : ban,
            	srch_year : year,
            	srch_semester : semester,
            	srch_professor_code : $("#srch_professor_code").val()
                },
            success : clickLectureOK
        });
        var top = $(document).scrollTop();
        //show_popup_custom('#popup_atend_one',top);
        
    }
    function clickLectureOK(rs, status){
        var crntWeek = rs.currentWeek;
        $("#myFormAtendAll #lecture_time").val(rs.info.lecture_time);
        
        $("#myFormLecture #change_atend").val(rs.useCnt);
        $("#atend_close").remove();
        $("#atend_close1").remove();
        
            if((rs.useCnt == 0) && ($("#atend_close").length == 0))
            {
                $("#myFormAtendAll .btn_atend_print").before("<a class=\"btn_atend_all\" id=\"atend_close\" style=\"background-color: red;\" href=\"javascript:atend_close();\">최종마감</a>&nbsp;");
            }
            if((rs.useCnt > 0) && ($("#atend_close1").length == 0)){
                $("#myFormAtendAll .btn_atend_print").before("<a class=\"btn_atend_all\" id=\"atend_close1\" style=\"background-color: red;\" href=\"javascript:atend_close_cancel();\">마감 취소 하기</a>&nbsp;");
            }
        
        
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
        thead += "<th rowspan='"+span+"' style='font-size: 25px;'>No</th>";
        thead += "<th rowspan='"+span+"' style='font-size: 25px;'>사진</th>";
        thead += "<th rowspan='"+span+"' style='font-size: 25px;'>학번<br>이름</th>";
        thead += "<th style='border-bottom: 1px solid #fff; font-size: 18px;'>주</th>";
        for(var i = 1; i <= 15; i++){
            thead +="<th class=a"+i+" >"+i+"</th>";
        }
        
        for(var i = 0; i < rs.addInfoList.length; i++)
        {
            thead += "<th rowspan='"+span+"'><strike style = 'color : rgb(255,0,0);'>"+rs.addInfoList[i].origin_info+"</strike><br>"+rs.addInfoList[i].lect_day +" "+ rs.addInfoList[i].time_numb +"교시</th>";
        }      
        
        thead += "<th rowspan='"+span+"' style='font-size: 25px;'>출석</th>";
        //thead += "<th rowspan='"+span+"' style='font-size: 25px;'>통계</th>";
        thead += "<th rowspan='"+span+"' style='font-size: 25px;'>비고</th>";
        thead += "</tr>";
        
        for(var i=0; i < length; i++){
            if(i==0){
                thead += "<tr style='height:40px'>";
                thead += "<th rowspan='"+length+"' style='font-size: 25px;'>월/일</th>";
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
                                case "02" : lect_date_day = "09";
                                break;
                                case "03" : lect_date_day = "10";
                                break;
                                case "04" : lect_date_day = "11";
                                break;
                                case "05" : lect_date_day = "12";
                                break;
                                case "06" : lect_date_day = "13";
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
                    thead += "<th class=a"+ii+" id=d"+ii+" >"+lect_date[ii-1][i]+"</th>";
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
                    tr += "<td rowspan='"+rs.timeInfo.length+"'><img src=\"/ShowImage.do?imgIdx="+rs.stdList[i].student_code+"\" onerror=\"this.src='../../resources/img/pro_noimg_170.png'\" style='width: 100px; border-radius: 50px;'></td>";
                    tr += "<td rowspan='"+rs.timeInfo.length+"'>"+rs.stdList[i].student_code+"<br>"+rs.stdList[i].student_name+"</td>";
                    tr += "<td>"+rs.timeInfo[iii].from_lttm+"교시</td>";
                    for(var ii = 1; ii <= 15; ii++){
                        var status = rs.stdList[i].atend_detail[ii-1][iii][0];
                        if(status == null){
                            status='';
                        }
                        if(status =='휴강'){
                            tr += "<td style = 'color : rgb(255,0,0);cursor:pointer;' class='a"+ii+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' id='" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.timeInfo[iii].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        }else{
                        	if(rs.useCnt == 0){
                                tr += "<td style = 'cursor:pointer;' class='a"+ii+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' onclick=\"javascript:atendCheck('a" +ii +"' ,'" + rs.stdList[i].student_code +"', this);\" id='" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.timeInfo[iii].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        	}else{
                        		tr += "<td style = 'cursor:pointer;' class='a"+ii+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' onclick=\"javascript:alert('마감취소 후 수정 가능합니다.');\" id='" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.timeInfo[iii].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        	}
                        }
                    }
                    for(var iz = 0; iz < rs.addInfoList.length; iz++)
                    {
                        var status = rs.stdList[i].atend_detail[rs.addInfoList[iz].no-1][0][0];
                        if(status == null){
                            status='';
                        }
                        if(status =='휴강'){
                            
                            tr += "<td rowspan='"+index1+"' style = 'color : rgb(255,0,0); cursor:pointer;' class='a"+rs.addInfoList[iz].no+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' id='" + rs.stdList[i].student_code + "_" + rs.addInfoList[iz].no +"_"+rs.addInfoList[iz].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.addInfoList[iz].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        }else{
                        	if(rs.useCnt == 0){
                                tr += "<td rowspan='"+index1+"' style = 'cursor:pointer;' class='a"+rs.addInfoList[iz].no+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' onclick=\"javascript:atendCheck('a" +rs.addInfoList[iz].no +"' ,'" + rs.stdList[i].student_code +"', this);\" id='" + rs.stdList[i].student_code + "_" + rs.addInfoList[iz].no +"_"+rs.addInfoList[iz].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.addInfoList[iz].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        	}else{
                        		tr += "<td rowspan='"+index1+"' style = 'cursor:pointer;' class='a"+rs.addInfoList[iz].no+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' onclick=\"javascript:alert('마감취소 후 수정 가능합니다.');\" id='" + rs.stdList[i].student_code + "_" + rs.addInfoList[iz].no +"_"+rs.addInfoList[iz].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.addInfoList[iz].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        	}
                        }
                    }
                    
                    tr += "<td rowspan='"+index1+"' id='"+rs.stdList[i].student_code+"_resultAtendPoint'>"+rs.stdList[i].weekTimeForPoint+"</td>";
                    //tr += "<td rowspan='"+index1+"' id='"+rs.stdList[i].student_code+"_statisString'>"+rs.stdList[i].statisString+"</td>";
                    tr += "<td rowspan='"+index1+"'></td>";
                    tr += "</tr>";
                }else{
                    tr += "<tr class='atend_std' style='height:40px'>";
                    tr += "<td>"+rs.timeInfo[iii].from_lttm+"교시</td>";
                    for(var ii = 1; ii <= 15; ii++){
                        var status = rs.stdList[i].atend_detail[ii-1][iii][0];
                        if(status == null){
                            status='';
                        }
                        if(status =='휴강'){
                            tr += "<td style = 'color : rgb(255,0,0); cursor:pointer;' class='a"+ii+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' id='" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.timeInfo[iii].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        }else{
                        	if(rs.useCnt == 0){
                                tr += "<td style = 'cursor:pointer;' class='a"+ii+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' onclick=\"javascript:atendCheck('a" +ii +"' ,'" + rs.stdList[i].student_code +"', this);\" id='" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.timeInfo[iii].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        	}else{
                        		tr += "<td style = 'cursor:pointer;' class='a"+ii+"_"+rs.timeInfo[iii].from_lttm+"_"+rs.timeInfo[iii].lect_dday+"' onclick=\"javascript:alert('마감취소 후 수정 가능합니다.');\" id='" + rs.stdList[i].student_code + "_" + ii +"_"+rs.timeInfo[iii].from_lttm+"_"+rs.info.subject_title_no+"_"+rs.info.year+"_"+rs.info.semester+"_"+rs.timeInfo[iii].lect_dday+"_"+rs.info.professor_code+"_"+rs.info.class_divide+"'>"+status+"</td>";
                        	}
                        }
                    }
                    tr += "</tr>";
                }
            }
            
            
        }
        $("#all_atend_std_list").html(tr);
    }
    function atend_close_cancel()
    {
    	var subject_title_no = $("#subject_title_no").val();
    	var class_divide =  $("#class_divide").val();
    	var lecture_time = $("#lecture_time").val();
        var lect_year = $("#year").val();
        var lect_semester = $("#semester").val();
        //alert("마감 취소 기간이 아닙니다.");
        //return;
        if(confirm("마감 취소 하시겠습니까?"))
        {
            svcUrl = "cancelClose"            
            $.ajax({
                type:"POST",
                url: svcUrl,
                async:false,
                data: { 
                    srch_subject_title_no : subject_title_no,
                    srch_class_divide : class_divide,
                    srch_year : $("#year").val(),
                    srch_semester : $("#semester").val()
                    },
                success : function(rs){
                    if(rs == "UPDATE_OK"){
                        alert("마감취소 되었습니다.");
                        clickLecture(subject_title_no, class_divide, lect_year, lect_semester, lecture_time);
                    }else{
                    	alert("마감취소 중 오류가 발생하였습니다.");
                    }
                }           
            });     
        }
    }
    function changeTagAll(tag,no){
        tagName = tag;
        $(".btn_item_all").css("background-color","rgba(209, 209, 209,0.4)");
        $("#atendTagAll"+no).css("background-color","rgba(27, 71, 139,0.3)");
    }
    var tagName ="●";

    function atendCheck(cellId, student, thisObj){
        var week_atend_status = '1';
        
        if(tagName == '●'){
            week_atend_status = '1';
        }else if(tagName == '≠'){
            week_atend_status = '2';
        }else if(tagName == '/'){
            week_atend_status = '3';
        }else if(tagName == '△'){
            week_atend_status = '4';
        }else if(tagName == 'O'){
            week_atend_status = '5';
        }else if(tagName == '휴강'){
            week_atend_status = '6';        
        }
        var lecture_time = $("#myFormAtendOne #lecture_time").val();
        if(lecture_time == ""){
            lecture_time = $("#myFormAtendAll #lecture_time").val();
        }
        if(lecture_time == ""){
            lecture_time = $("#myFormAtendAddLecture #lecture_time").val();
        }
        var svcUrl = "/checkAtendStd";
        
        $.ajax({
            type:"POST",
            url: svcUrl,
            async:false,
            data:{
                tagName : $(thisObj).attr('id'),
                student_code : student,
                week_atend_status : week_atend_status,
                lecture_time : lecture_time
                
            },
            success : function(rs){
                if(rs.result !='-999'){
                	//alert(rs.msg);
                    $("#"+$(thisObj).attr('id')).html(tagName);
                    if(week_atend_status == "6")
                    {
                        $("#"+$(thisObj).attr('id')).css("color","red");
                    }
                    $("#"+student+"_resultAtendPoint").html(rs.resultAtendPoint);
                    $("#"+student+"_statisString").html(rs.statisString);
                    $("#"+student+"_statisString_add").html(rs.statisString);
                }else{
                    alert('출석처리에 실패하였습니다.');
                }
                
                
            },
            error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"error:"+error);
            }
            
        });
    }
    function atend_close()
    {
        var subject_title_no = $("#subject_title_no").val();
        var class_divide =  $("#class_divide").val();
        var lecture_time = $("#lecture_time").val();
        var lect_year = $("#year").val();
        var lect_semester = $("#semester").val();
        if(confirm("최종마감을 하시겠습니까?")){         
            
            svcUrl = "AtendClose";     
            $.ajax({
                type:"POST",
                url: svcUrl,
                async:false,
                data: { 
                    srch_subject_title_no : $("#subject_title_no").val(),
                    srch_class_divide : $("#class_divide").val(),
                    srch_year : $("#year").val(),
                    srch_semester : $("#semester").val(),
                    srch_professor_code : $("#srch_professor_code").val()
                    },
                success : function(rs){
                    if(rs == "UPDATE_OK"){
                        alert("마감처리 되었습니다.");
                        clickLecture(subject_title_no, class_divide, lect_year, lect_semester, lecture_time);
                    }else{
                        alert("마감처리 중 오류가 발생하였습니다.");
                    }
                }           
            });     
        }
    }
    function popPrint(){
        openWindow("", "popPrint", 2000, 2000);
        goPageTargetThree(popPrintForm, "popPrint");
    }
    function goPageTargetThree (moveForm, target){
        moveForm.target = target;
        moveForm.submit();
    }
    function openWindow(url, target, width, height) {
        var win;
        var iLeft = (window.screen.width / 2) - (Number(width) / 2);
        var iTop = (window.screen.height / 2) - (Number(height) / 2);
        var features = "menubar=no,toolbar=no,status=no,resizable=yes,scrollbars=yes";
        features += ",left=";
        features += iLeft;
        features += ",top=";
        features += iTop;
        features += ",width=";
        features += width;
        features += ",height=";
        features += height;
        win = window.open(url, target, features);
        win.focus();
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
    <%
    String userNo = "";
    String userName = "";
    String userAuth = "";
    HttpSession session = request.getSession(false);
    if(session == null && session.getAttribute("sessionUserInfo") == null){
        %>
        <script type="text/javascript">
            alert("로그인 세션이 종료되었습니다. 로그인페이지로 이동합니다.");
            window.close();
        </script>
        <% 
    }else{
        LoginInfo loginInfo = new LoginInfo();
        loginInfo = (LoginInfo)session.getAttribute("sessionUserInfo");
        
        userNo = loginInfo.getUserNo();
        userName = loginInfo.getName();
        userAuth = loginInfo.getUserAuth();
    }
    %>
</head>
<body>
    <div class="course">
        <div class="sub_title_wrap">
            <h3 class="sub_title">출결관리</h3>
        </div>
        
        <div class="con_box" >
                <div class="con_box srch_class" id="srch_tab01">
                    <form name="myFormLecture" id="myFormLecture" method="POST" action="" onsubmit="return false;">
                    <c:set var="tmpUserNo" value="<%=userNo %>"/>
                    <input name="userNo" id="userNo" type="hidden" value="<%=userNo%>">
                        <div class="mt20 mb20 select_wrap">
                            <select name="srch_year" id="srch_year">
                                <option value="2017">2017학년도</option>
                                <option value="2018">2018학년도</option>
                                <option value="2019">2019학년도</option>
                                <option value="2020">2020학년도</option>
                            </select>
                            <select name="srch_semester" id="srch_semester">
                                <option value="2">1학기</option>
                                <option value="2">2학기</option>
                            </select>
                            <c:if test="${tmpUserNo eq '2018718' || tmpUserNo eq '2018728' || tmpUserNo eq '2017712' || tmpUserNo eq '1996707'}">
                                <input type="text" name="srch_professor_code" id="srch_professor_code" placeholder="교번">
                            </c:if>
                            <input type="text" name="srch_content" id="srch_content" placeholder="강의명">
                            <a class="btn_atend_search" href="javascript:srchAtendLeckture();">검색</a>
                        </div>
                        <div class="mt10">
                            <ul>
                                <li>
                                    <dl>
                                        <dt>검색결과</dt>
                                        <dd id="classItem"></dd>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>
        </div>
    </div>

<form name="myFormAtendAll" id="myFormAtendAll" method="POST" action="">
<input type="hidden" id="subject_title_no" name="subject_title_no" value="">
<input type="hidden" id="class_divide" name="class_divide" value="">
<input type="hidden" id="year" name="year" value="">
<input type="hidden" id="semester" name="semester" value="">
<input type="hidden" id="lecture_time" name="lecture_time" value="">
<input type="hidden" id="lecture_info" name="lecture_info" value="">    
    <div class="popup_atend" id="popup_atend">
        <div class="question_body">
                <table class="atend_list" style="width: 1158px;">
                    <colgroup>
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">       
                    </colgroup>
                        <tr>
                            <td colspan="6">●(출석),≠(지각),/(결석),△(조퇴),O(조기취업)</td>
                            <th>담당교수</th>
                            <th>학과장</th>
                        </tr>
                        <tr>
                            <th>개설학과</th>
                            <td id="all_grp_name"></td>
                            <th>교수명</th>
                            <td id="all_pro_name"></td>
                            <th>학점</th>
                            <td id="all_point"></td>
                            <td rowspan="2" ></td>
                            <td rowspan="2"></td>
                        </tr>
                        <tr>
                            <th>학년/반</th>
                            <td id="all_grade_ban"></td>
                            <th>과목명</th>
                            <td colspan="3" id="all_class_name"></td>
                        </tr>
                    </table>
                </div>
        <div class="question_body">
            <h3>출석체크하기</h3>
            <div class="check" >
                <ul>
                    <li>IE의 경우 출력하기 버튼을 누른 후 상단메뉴에서 가로페이지로 변경하신 후 페이지에 맞게축소에서 41%배율을 선택하시면 전체 출석부를 출력하실수있습니다.</li>
                </ul>
            </div>
            <div class="mt20 mb20 ta_center">
                <a href="javascript:changeTagAll('●','1');" class="btn_item_all" id="atendTagAll1">출석(●)</a>
                <a href="javascript:changeTagAll('≠','2');" class="btn_item_all" id="atendTagAll2">지각(≠)</a>
                <a href="javascript:changeTagAll('/','3');" class="btn_item_all" id="atendTagAll3">결석(/)</a>
                <a href="javascript:changeTagAll('△','4');" class="btn_item_all" id="atendTagAll4">조퇴(△)</a>
                <a href="javascript:changeTagAll('O','5');" class="btn_item_all" id="atendTagAll5">조기취업(O)</a>
                <c:if test="${tmpUserNo eq '2018718' || tmpUserNo eq '2018728' || tmpUserNo eq '2017712' || tmpUserNo eq '1996707'}">
                    <a href="javascript:changeTagAll('휴강','6');" class="btn_item_all" id="atendTagAll6">휴강</a>
                </c:if>
            </div>
            
            <div class="mt10 mb10 ta_right">
<!--                 <a class="btn_atend_add" href="javascript:showAddLecturePop();" >보강출석부</a>               -->
<!--                 <a class="btn_atend_all" href="javascript:allAtendProcForAll();" >일괄적용</a> -->
                <a class="btn_atend_print" href="javascript:popPrint();"  >출력하기</a>
            </div>
            <div class="time_list" id="all_time_list"></div>
            <div class="time_info" id="all_time_info" ></div>
            
            <div class="scroll">
                <div style="width: 1400px; height: 800px;">
                    <table class="atend_check_list_all" style="width: 2740px;">
                        <colgroup>
                            <col width="50px"> <!-- 번호 -->
                            <col width="100px"> <!-- 학적 -->
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
        <div class="mt20 mb20 ta_center">
            <a href="javascript:window.close();" class="btn_complete_a">닫기</a>
        </div>
        
        </div>
</form>
<form name="myFormAtendOne" id="myFormAtendOne" method="POST" action="">
<input type="hidden" id="subject_title_no" name="subject_title_no" value="">
<input type="hidden" id="class_divide" name="class_divide" value="">
<input type="hidden" id="year" name="year" value="">
<input type="hidden" id="semester" name="semester" value="">
<input type="hidden" id="week" name="week">
<input type="hidden" id="lecture_time" name="lecture_time" value="">
<input type="hidden" id="lecture_info" name="lecture_info" value="">
            
    <div class="popup_atend blind" id="popup_atend_one">
        
        <div class="question_head">
            <p class="main_copy">출석부 입력</p>
        </div>
        <div class="question_body">
        <h3 style="margin-top: 0px;">강의정보</h3>
                    
                    <table class="atend_list" style="width: 990px; margin: 0 auto;">
                        <colgroup>
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            
                        </colgroup>
                        <tr>
                            <td colspan="6">●(출석),≠(지각),/(결석),△(조퇴),O(조기취업)</td>
                            <th>담당교수</th>
                            <th>학과장</th>
                        </tr>
                        <tr>
                            <th>개설학과</th>
                            <td id="grp_name"></td>
                            <th>교수명</th>
                            <td id="pro_name"></td>
                            <th>학점</th>
                            <td id="point"></td>
                            <td rowspan="2" ></td>
                            <td rowspan="2"></td>
                        </tr>
                        <tr>
                            <th>학년/반</th>
                            <td id="grade_ban"></td>
                            <th>과목명</th>
                            <td colspan="3" id="class_name"></td>
                        </tr>
                    </table>
                    <h3>출석체크하기</h3>
                    <div class="check" >
                        <ul>
                            <li>학생들의 출석 체크를 해주세요. 지각/결석/조퇴 등을 입력한 후 완료 버튼을 누르시면 나머지는 출석으로 일괄적용됩니다.</li>
                        </ul>
                    </div>
                    <div class="mt20 mb20 ta_center">
                        <a href="javascript:changeTag('●','1');" class="btn_item" id="atendTag1" >출석(●)</a>
                        <a href="javascript:changeTag('≠','2');" class="btn_item" id="atendTag2">지각(≠)</a>
                        <a href="javascript:changeTag('/','3');" class="btn_item" id="atendTag3">결석(/)</a>
                        <a href="javascript:changeTag('△','4');" class="btn_item" id="atendTag4">조퇴(△)</a>
                        <a href="javascript:changeTag('O','5');" class="btn_item" id="atendTag5">조기취업(O)</a>
                    </div>
                    <div class="cancel_Info mb20" id="cancel_div" style="display: none;">
                        휴강정보
                        <div class="check" id="cancel_Info">
                        </div>
                        위의 휴강정보를 아래출석부에 입력해주시고, 대체수업은 보강하기버튼을 클릭하여 입력 후 사용해주세요.
                    </div>
                    <div class="mb20 ta_right">
                        <a class="btn_atend_all_pop" href="javascript:showAllPop();" >전체보기</a>
                        <a class="btn_atend_add" href="javascript:showAddLecturePop();" >보강출석부</a>
                    </div>
                    
                    <div class="time_list" id="time_list"></div>
                    <div class="time_info" id="time_info" ></div>
                <div id="atend_check_list" style="display: none;">
                    <div class="mt10 mb10 ta_right">
                        
                        <a class="btn_atend_all" href="javascript:allAtendProc();" >일괄출석</a>
                    </div>
                    <table class="atend_check_list" style="width: 1138px;">
                        <colgroup>
                            <col width="70px">  <!-- 번호 -->
                            <col width="75px">  <!-- 학적 -->
                            <col width="120px" class="colPic">  <!-- 사진 -->
                            <col width="130px" class="colName"> <!-- 학번/이름 -->
                            <col width="90px">  <!-- 주 -->
                            <col width="170px" class="colWeeks">
                            <col width="150px" class="colCheck"> <!-- 출석현황 -->
                            <col width="340px" class="colCmmt"> <!-- 비고 -->
                        </colgroup>
                        <thead id="atend_std_list_head">
                        </thead>
                    </table>
                    <div style="height: 550px; overflow-y: scroll;">
                    
                    <table class="atend_check_list" >
                        <colgroup>
                            <col width="70px">  <!-- 번호 -->
                            <col width="75px">  <!-- 학적 -->
                            <col width="120px" class="colPic">  <!-- 사진 -->
                            <col width="130px" class="colName"> <!-- 학번/이름 -->
                            <col width="90px">  <!-- 주 -->
                            <col width="170px" class="colWeeks">
                            <col width="150px" class="colCheck"> <!-- 출석현황 -->
                            <col width="340px" class="colCmmt"> <!-- 비고 -->
                        </colgroup>
                        <tbody id="atend_std_list">
                        </tbody>
                    </table>
                    </div>
                </div>
        </div>
        <div class="mt20 mb20 ta_center">
            <a href="javascript:hidePop('popup_atend_one');" class="btn_complete_a">완료</a>
        </div>
        
        </div>
</form>
<form name="myFormAtendAddLecture" id="myFormAtendAddLecture" method="POST" action="">
<input type="hidden" id="subject_title_no" name="srch_subject_title_no" value="">
<input type="hidden" id="class_divide" name="srch_class_divide" value="">
<input type="hidden" id="year" name="srch_year" value="">
<input type="hidden" id="semester" name="srch_semester" value="">
<input type="hidden" id="professor_code" name="srch_professor_code" value="">
<input type="hidden" id="lecture_time" name="lecture_time" value="">
<input type="hidden" id="week" name="week" value="">
<input type="hidden" id="origin_info" name="origin_info" value="">
<input type="hidden" id="dday" name="dday" value="">
<input type="hidden" id="from_lttm" name="from_lttm" value="">
<input type="hidden" id="no" name="no" value="">

    <div class="popup_atend blind" id="popup_atend_addLecture">
        <div class="question_head">
            <p class="main_copy">보강출석부</p>
        </div>
        <!--  div class="question_body">
                휴강하는 주차, 날짜, 시간을를 선택해주세요. 교시별로 선택하여 보강정보를 입력해주시기 바랍니다.
            <div class="mt20" >
                <div class="time_add_list" id="add_time_list"></div>
                <div class="time_add_info" id="add_time_info" ></div>
            </div>
            
        </div>
        <div class="question_body">
            <div>
                <h3>결강 수업 정보</h3>
                <table class="atend_list" style="width: 900px; margin: 0 auto;" >
                        <colgroup>
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="20%">
                            <col width="7%">
                            <col width="7%">
                            <col width="26%">
                            
                        </colgroup>
                        
                        <tr>
                            <th>개설학과</th>
                            <td id="add_grp_name"></td>
                            <th>교수명</th>
                            <td id="add_pro_name"></td>
                            <th>학점</th>
                            <td id="add_point"></td>
                            <th>결강수업정보</th>
                        </tr>
                        <tr>
                            <th>학년/반</th>
                            <td id="add_grade_ban"></td>
                            <th>과목명</th>
                            <td colspan="3" id="add_class_name"></td>
                            <td id="add_origin_class" style="color: red;"></td>
                        </tr>
                    </table>
            </div>
            <div>
                <h3>보강수업일시</h3>
                <div class="p15">
                    <div class="mb20">
                    보강일 : <input type="text" class="add_lecture_date" name="lect_day" id="add_lecture_date" style="width: 190px; margin-right: 3px;" placeholder="보강일" readonly>
                    강의실 : <input type="text" name="lecture_room" id="add_lecture_room" placeholder="강의실을 입력해주세요." style="width : 200px;"><br>
                    <div class="mt10">
                        교시 : <eaction:radio name="time_numb" id="add_time_numb" group="LECTURE_TIME" />
                    </div>
                    </div>
                <textarea rows="" cols="" name="add_reason" id="add_reason" placeholder="보강사유를 입력해주세요."></textarea>
                </div>
            </div>
            <div class="mt20 mb20 ta_center">
            <a class="btn_complete_a" id = "add_insert" href=javascript:insertAddLecture();>완료</a>
            <a class="btn_complete_a" id = "add_modify" href=javascript:updateAddLecture(); style="display:none;">수정</a>
            <a class="btn_complete_a" id = "add_delete" href=javascript:deleteAddLecture(); style="display:none;">삭제</a>
            <a class="btn_complete_a" href=javascript:selectAddLectureList();>보강조회</a>
        </div>
        </div -->
        
        <div class="question_body">
            
            <div class="scroll_y" id="test" style="display: none;">
                <div class="check mb20" >
                    <ul>
                        <li></li>
                        <li>보강 신청이 완료된 목록입니다.</li>
                    </ul>
                </div>
                <div style="display: inline-block;">
                    <div id="add_time_list_sub"></div>
                    <div class="time_add_info" id="add_time_info_sub"></div>
                </div>
                <div class="mt20 mb20 ta_center">
                        <a href="javascript:changeTagAdd('●','1');" class="btn_item_add" id="atendTagAdd1" >출석(●)</a>
                        <a href="javascript:changeTagAdd('≠','2');" class="btn_item_add" id="atendTagAdd2">지각(≠)</a>
                        <a href="javascript:changeTagAdd('/','3');" class="btn_item_add" id="atendTagAdd3">결석(/)</a>
                        <a href="javascript:changeTagAdd('△','4');" class="btn_item_add" id="atendTagAdd4">조퇴(△)</a>
                        <a href="javascript:changeTagAdd('O','5');" class="btn_item_add" id="atendTagAdd5">조기취업(O)</a>
                </div>
                <div class="mb10 ta_right">
                    <!-- a class="btn_atend_all" href="javascript:showOnePop();" >개별보기</a -->
                    <a class="btn_atend_all_pop" href="javascript:showAllPop();" >전체보기</a>
                    <a class="btn_atend_cancel" href="javascript:allAddAtendProc();" >일괄출석</a>
                </div>
                <table class="atend_check_list" style="width: 1145px;">
                        <colgroup>
                            <col width="70px">  <!-- 번호 -->
                            <col width="75px">  <!-- 학적 -->
                            <col width="120px" class="colPic">  <!-- 사진 -->
                            <col width="130px" class="colName"> <!-- 학번/이름 -->
                            <col width="90px">  <!-- 주 -->
                            <col width="170px" class="colWeeks">
                            <col width="150px" class="colCheck"> <!-- 출석현황 -->
                            <col width="340px" class="colCmmt"> <!-- 비고 -->
                        </colgroup>
                        <thead id="atend_add_list_head">
                        </thead>
                        <tbody id="atend_add_list">
                        </tbody>
                    </table>
        <div class="mt20 mb20 ta_center">
            <a href="javascript:hidePop('popup_atend_addLecture');" class="btn_complete_a">완료</a>
        </div>
        </div>
        
        </div>
    </div>
</form>
<form name="popPrintForm" id="popPrintForm" method="POST" action="/printAtend?decorator=print_popup&confirm=true">
<input type="hidden" id="subject_title_no_print" name="subject_title_no" value="">
<input type="hidden" id="class_divide_print" name="class_divide" value="">
<input type="hidden" id="year_print" name="year" value="">
<input type="hidden" id="semester_print" name="semester" value="">
<input type="hidden" id="professor_code" name="professor_code" value="">
</form>
<form name="myFormAtendStd" id="myFormAtendStd" method="POST" action="">
<input type="hidden" id="subject_title_no" name="subject_title_no" value="">
<input type="hidden" id="class_divide" name="class_divide" value="">
<input type="hidden" id="year" name="year" value="">
<input type="hidden" id="semester" name="semester" value="">
<input type="hidden" id="week" name="week">
            
    <div class="popup_atend blind" id="atend_pop_std">
        
        <div class="question_head">
            <p class="main_copy">학생정보</p>
        </div>
        <div class="question_body">
            <h3 style="margin-top: 0px;">강의정보</h3>
            <div class="check mb20">
                <ul>
                    <li>연도/학기를 선택하신 수 과목을 선택하시면 해당 학생의 출석현황을 확인하실 수 있습니다.</li>
                </ul>
            </div>
            <div class="time_list">
                <div id="timeList"></div>
                <div class="time_std_info" id="timeInfo"></div>
            </div>
            <div class="errorInfo" id="errorInfo"></div>
        </div>
        <div class="question_body" id="atendStdDetail">
            <div class="check mb20">
                <ul>
                    <li>학생들의 년도,학기,수강과목별 출석현황을 확인하실 수 있습니다.</li>
                </ul>
            </div>
            <div class="scroll_std">
                    <table class="atend_check_list_all" style="width: 2340px;">
                        <colgroup>
                            <col width="50px"> <!-- 번호 -->
                            <col width="100px"> <!-- 위험군 -->
                            <col width="100px"> <!-- 학적 -->
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
                        <thead id="atend_std_by_list_head">
                        </thead>
                        <tbody id="atend_std_by_list">
                        </tbody>
                        <div id="append_std_table">
                        
                        </div>
                        </tbody>
                    </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>