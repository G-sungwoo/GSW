<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>
login out
</title>
<script language="JavaScript">
function getParameter(key)
{
    var url = location.href;
    var spoint = url.indexOf("?");
    var query = url.substring(spoint,url.length);
    var keys = new Array;
    var values = new Array;
    var nextStartPoint = 0;
    while(query.indexOf("&",(nextStartPoint+1) ) >-1 ){
        var item = query.substring(nextStartPoint, query.indexOf("&",(nextStartPoint+1) ) );
        var p = item.indexOf("=");
        keys[keys.length] = item.substring(1,p);
        values[values.length] = item.substring(p+1,item.length);
        nextStartPoint = query.indexOf("&", (nextStartPoint+1) );
    }
    item = query.substring(nextStartPoint, query.length);
    p = item.indexOf("=");
    keys[keys.length] = item.substring(1,p);
    values[values.length] = item.substring(p+1,item.length);
    var value = "";
    for(var i=0; i<keys.length; i++){
        if(keys[i]==key){
            value = values[i];
        }
    }
    return value;
}


</script>

</head>
<body bgcolor="#ffffff">
<script language="JavaScript">
        // filter/login/logout.jsp이면
        if(getParameter("logout") != 1){
                document.location = "http://osanjy.osan.ac.kr/sso/pmi-logout-url.jsp?returl=http://osantest.osan.ac.kr/sso/index.jsp";
        }

</script>
세션 종료!!
<%
	session.invalidate();
%>
<a href="/sso/index.jsp"> 메인 페이지로 </a>
</body>
</html>
