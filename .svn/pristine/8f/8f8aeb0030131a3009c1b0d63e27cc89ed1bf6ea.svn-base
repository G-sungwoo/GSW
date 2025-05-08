<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstl.jsp"%>
<!DOCTYPE html>

    <div class="grade_list">
        <p class="score" align="left">학점: <font color="red">${avrg_mrks}</font> 취득: <font color="blue">${totl_aqpt}</font></p>
        <table class="table table-bordered" style="text-align: center;" border="1">
            <thead class="table-light">
                <tr>
                    <th rowspan="2">유형</th>
                    <th colspan="3">과목명</th>
                </tr>
                <tr>
                    <th>학점</th>
                    <th>등급</th>
                    <th>평점</th>
                </tr>                
            </thead>
            <tbody>
                <c:forEach items="${gradeList}" var="grade">
                    <tr>
                        <th rowspan="2" >${grade.pobt_flag}</th>
                        <th colspan="3" >${grade.sbjt_krnm}</th>
                    </tr>
                    <tr>
                        <th>${grade.lect_pont}</th>
                        <th>${grade.lect_grad}</th>
                        <th>${grade.grad_pont}</th>
                    </tr>   
                </c:forEach>    
            </tbody>
        </table>
    </div>