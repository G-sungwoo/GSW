<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstl.jsp"%>
<!DOCTYPE html>

    <p class="date">
        <c:forEach var="list" items="${scheduleList}" varStatus="status" begin="1" end="1">
            ${list.lect_week_date}
        </c:forEach>
    </p>
    <div class="schedule">
        <table class="table table-bordered" name="scheduleTable" style="text-align: center;" border="1">
            <thead class="table-light">
                <tr>
                    <th>교시</th>
                    <th>시간</th>
                    <th>월요일</th>
                    <th>화요일</th>
                    <th>수요일</th>
                    <th>목요일</th>
                    <th>금요일</th>
                    <th>토요일</th>
                    <th>일요일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${scheduleInfoList}" var="schedule">
                    <tr>
                        <td class="table-light">${schedule.term_numb}</td>
                        <td>${schedule.lect_time}</td>
                        <td>${schedule.lect_mond.replace('/', '<br>')}</td>
                        <td>${schedule.lect_tued.replace('/', '<br>')}</td>
                        <td>${schedule.lect_wedd.replace('/', '<br>')}</td>
                        <td>${schedule.lect_thrd.replace('/', '<br>')}</td>
                        <td>${schedule.lect_frid.replace('/', '<br>')}</td>
                        <td>${schedule.lect_satd.replace('/', '<br>')}</td>
                        <td>${schedule.lect_sund.replace('/', '<br>')}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>