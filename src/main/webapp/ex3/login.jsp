<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/12
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/login" method="post">
    <label>用户名：</label>
    <input type="text" name="user" value="${param.user}"/><br><br>
    <label>密码：</label>
    <input type="password" name="password"/><br>
    <div id="submit">
        <input type="submit" value="登录"/>
    </div>
</form>
</body>
</html>
