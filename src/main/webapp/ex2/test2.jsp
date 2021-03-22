<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/8
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <%
            // 计算数据
            int[] nums = new int[10];
            nums[0] = 1;
            nums[1] = 1;
            for (int i = 2; i < 10; i++) {
                nums[i] = nums[i - 1] + nums[i - 2];
            }
            // 显示数据
            for (int j : nums) {
        %>
        <td>
            <%=j%>
        </td>
        <%
            }
        %>
    </tr>
</table>
</body>
</html>
