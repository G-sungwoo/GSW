<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.ksign.access.api.*" %>
<%@ page import="com.ksign.access.util.SSOConf" %>
<%@ page import="java.io.*" %>
<%
	SSORspData rspData = null;

	SSOService ssoService = SSOService.getInstance();

	rspData = ssoService.ssoGetLoginData(request);
		
	String retURL = (String)request.getParameter("returnurl");
	
	session.setAttribute("uid", rspData.getUID());
	
	if(retURL != null){
		response.sendRedirect(retURL);
	}
%>
