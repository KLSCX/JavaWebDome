<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/12
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<p>用户名：<%=request.getParameter("user")%></p><br>
<p>sessionID：<%=session.getId()%></p><br>
<p>登录时间：<%=new Date()%></p><br>
<p>cookie列表：</p><br>
<%
    Cookie[] cookies = request.getCookies();
    for (Cookie c : cookies) {
        out.print(c.getName() + " " + c.getValue() + "<br>");
    }
%>
</body>
</html>
