<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/5/30
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
user id: ${sessionScope.user.id}<br>
user name: ${sessionScope.user.username}<br>
user password: ${sessionScope.user.password}<br>
user birthday: ${sessionScope.user.birthday}<br>
user email: ${sessionScope.user.email}<br>
</body>
</html>
