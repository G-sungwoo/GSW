<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="icon" type="image/png"  href="resources/img/favicon.ico"/>
<script type="text/javascript">
function print(mrd_id){
    window.open('https://report.osan.ac.kr/ReportingServer/html5/sample/print_static.html?mrdPath=' + mrd_id, "고등교육통계", "_blank");
}
</script>
<title>고등교육통계</title>
</head>
<body>
<div class="find">
    <div class="box">
        <p>업로드 자료 출력(*출력 화면에서 엑셀로 저장)</p>
        <form action="" method="post" name="findIdForm" id="findIdForm">
        <select name="year">
            <option value="2022">2022</option>
            <option value="2023">2023</option>
            <option value="2024">2024</option>
            <option value="2025">2025</option>
        </select>
        <select name="month">
            <option value="04">04</option>
            <option value="10">10</option>
        </select>
        <ol>
            <li>학적일괄업로드<button type="button" onclick="print('stnt.mrd');">출력</button></li>
            <li>강좌일괄업로드<button type="button" onclick="print('cour.mrd');">출력</button></li>
            <li>교원일괄업로드<button type="button" onclick="print('psnl_kyo.mrd');">출력</button></li>
            <li>직원일괄업로드<button type="button" onclick="print('psnl_jik.mrd');">출력</button></li>
            <li>조교일괄업로드<button type="button" onclick="print('psnl_jo.mrd');">출력</button></li>
        </ol>
        </form>
    </div>
</div>
</body>
</html>