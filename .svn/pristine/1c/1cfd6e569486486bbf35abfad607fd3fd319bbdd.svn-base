<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.ksign.access.api.*" %>

<%
	SSORspData rspData = null;

	/**
         * 2. SSO 서비스 객체를 얻어 온다.
         */
	SSOService ssoService = SSOService.getInstance();

        rspData = ssoService.ssoGetLoginData(request);
%>
<html>
<head>
<title>
index
</title>
</head>
<body bgcolor="#ffffff">
<h1>
Welcome SSO Page....
<br />
 UID : <%=rspData.getUID()%> <br />
 CN : <%=rspData.getCN()%> <br />
 SSN : <%=rspData.getSSN()%> <br />
 COMPID : <%=rspData.getCompID() %> <br />
</h1>
</body>
</html>
