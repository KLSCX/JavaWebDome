<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/8
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Method" %>
<%!
    private String name;

    private void test() {
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class<?> clazz = this.getClass();
    Method[] methods = clazz.getMethods();
    for (Method field : methods) {
        out.println(field);
    }
    Field[] fields = clazz.getDeclaredFields();
    for (Field field : fields) {
        out.println(field.getType() + " " + field.getName());
    }
%>
</body>
</html>
