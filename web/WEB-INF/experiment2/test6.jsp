<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/8
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="p1" class="top.vuhe.People" scope="page"/>
<jsp:setProperty name="p1" property="name" value="zhuhe"/>
<jsp:setProperty name="p1" property="age" value="20"/>
<jsp:getProperty name="p1" property="name"/>
<jsp:getProperty name="p1" property="age"/>
</body>
</html>
