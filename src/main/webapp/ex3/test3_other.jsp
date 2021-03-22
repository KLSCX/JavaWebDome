<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/12
  Time: 09:58
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
    out.print("=====parameter=====<br>");
    Enumeration<?> parameter=request.getParameterNames();

    while (parameter.hasMoreElements()) {
        try {
            String str = (String) parameter.nextElement();
            out.print("Parameter key:" + str + " -- ");
            // 取得相应参数的参数值
            String strRequest = request.getParameter(str);;
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
