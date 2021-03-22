<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/22
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="top.vuhe.User" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        // 数据库连接
        String url = "jdbc:mysql://127.0.0.1:3306/user";
        String user = "root";
        String password = "ASDasd12";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // 查询、保存到bean
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select username, password from `user`");
        out.print("查询内容并保存到bean: <br>");
        List<User> list = new LinkedList<>();
        while (rs.next()) {
            User u = new User();
            u.setUsername(rs.getString("username"));
            u.setPassword(rs.getString("password"));
            out.print(u.getUsername());
            out.print(" : ");
            out.print(u.getPassword());
            out.print("<br>");
        }

        // 使用 PreparedStatement 更新、删除内容
        out.print("更新、删除内容: <br>");
        PreparedStatement updateStmt =
                conn.prepareStatement("update `user` set password = ? where id = ?");
        PreparedStatement deleteStmt =
                conn.prepareStatement("delete from `user` where id = ?");
        // 更新
        updateStmt.setString(1, "23456");
        updateStmt.setInt(2, 1);
        updateStmt.execute();
        out.print("更新完成<br>");
        // 删除
        deleteStmt.setInt(1, 2);
        deleteStmt.execute();
        out.print("删除完成<br>");

        // 使用 ResultSetMetaData 输出信息
        ResultSetMetaData metaData = rs.getMetaData();
        out.println(metaData.getCatalogName(1));
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
</body>
</html>
