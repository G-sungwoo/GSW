<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.ksign.access.api.*" %>

<html>
<head>
<title>
logout
</title>

</head>
<body bgcolor="#ffffff">
<%
SSOService ssoService = SSOService.getInstance();
String logouturl = "http://portal.osan.ac.kr/sso/pmi-logout-url.jsp?pmi-logout-url=http://portal.osan.ac.kr/sso/pmi-logout.jsp&returl=https://info.osan.ac.kr/";

response.sendRedirect(logouturl);
%>
</body>
</html>
