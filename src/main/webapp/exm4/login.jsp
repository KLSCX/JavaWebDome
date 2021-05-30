<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/5/30
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/login" method="post">
    用户名：<input name="username" type="text"><br>
    密码：<input name="password" type="password"><br>
    <input type="radio" name="autoLogin" value="0" checked>禁止自动登录
    <input type="radio" name="autoLogin" value="1" >一个月自动登录
    <input type="radio" name="autoLogin" value="2" >三个月自动登录
    <input type="radio" name="autoLogin" value="3" >半年自动登录 <br>
    <input type="submit" value="提交">
</form>
</body>
</html>
