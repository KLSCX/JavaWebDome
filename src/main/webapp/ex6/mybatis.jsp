<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/26
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="java.io.IOException" %>
<%@ page import="top.vuhe.User" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    SqlSessionFactory sqlSessionFactory = null;
    InputStream input = null;
    SqlSession sqlSession = null;

    try {
        input = Resources.getResourceAsStream("mybatis-config.xml");
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(input);
        sqlSession = sqlSessionFactory.openSession();
    } catch (IOException e) {
        out.println(e.getMessage());
    }

    String username = "zhuhe";
    if (sqlSession == null) {
        throw new NullPointerException("Can't find resources file!");
    }
    User user = sqlSession.selectOne("UserMapper.getUserByName", username);
    if (user == null) {
        out.println("find no user");
    } else {
        out.println(user.toString());
    }
    out.println("<br>select table successfully!");
%>
</body>
</html>
