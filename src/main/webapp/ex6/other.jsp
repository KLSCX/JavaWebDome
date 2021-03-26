<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/26
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="top.vuhe.User" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="java.io.InputStream" %>
<%!
    private SqlSession sqlSession = null;

    @Override
    public void jspInit() {
        try {
            InputStream input = Resources.getResourceAsStream("mybatis-config.xml");
            SqlSessionFactory sqlSessionFactory =
                    new SqlSessionFactoryBuilder().build(input);
            sqlSession = sqlSessionFactory.openSession();
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
        if (sqlSession == null) {
            throw new NullPointerException("Can't find resources file!");
        }
    }

    private String checkUser(String username) {
        User user = sqlSession.selectOne("UserMapper.getUserByName", username);
        if (user == null) {
            return "find no user";
        } else {
            return user.toString();
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 更新
    sqlSession.update("UserMapper.updateUserById",
            new User(1, "zhuhe", "098765"));
    // 输出更新后的查询结果
    out.println(checkUser("zhuhe"));
    out.println("<br>update table successfully!<br>");

    // 插入
    sqlSession.insert("UserMapper.insertUser",
            new User(2, "vuhe", "123456"));
    // 输出插入后的查询结果
    out.println(checkUser("vuhe"));
    out.println("<br>insert table successfully!<br>");

    // 删除
    sqlSession.delete("UserMapper.deleteUserById", 2);
    // 输出删除后的查询结果
    out.println(checkUser("vuhe"));
    out.println("<br>delete table successfully!<br>");
%>
</body>
</html>
