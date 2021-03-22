<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/12
  Time: 08:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Enumeration" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    out.print("=====Header=====<br>");
    Enumeration<?> header = request.getHeaderNames();

    while (header.hasMoreElements()) {
        try {
            String str = (String) header.nextElement();
            out.print("Attribute key:" + str + " -- ");
            // 取得相应参数的参数值
            String strRequest = request.getHeader(str);
            // 打印输出参数值
            out.print(" value：" + strRequest + " <br>");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
    out.print("=====end=====");
%>
</body>
</html>
