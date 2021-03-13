<%--
  Created by IntelliJ IDEA.
  User: zhuhe
  Date: 2021/3/12
  Time: 08:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>e3q1</title>
</head>
<body>

<div>
    class name of "this" : <%=this.getClass().getName()%>
</div>
<div>
    class name of "page" : <%=page.getClass().getName()%>
</div>
<div>
    "this" and "page" reference the same object: <%=this == page%>
</div>
<div>
    "page" is instance of "HttpServlet": <%=page instanceof  HttpServletRequest%>
</div>
<div style="margin-top: 40px">
    class name of "request" : <%=request.getClass().getName()%>
</div>
<div>
    "request" is instance of "HttpServletRequest": <%=request instanceof HttpServletResponse%>
</div>
<div style="margin-top: 40px">
    class name of "session" : <%=session.getClass().getName()%>
</div>
<div>
    "session" is instance of "HttpSession": <%=session instanceof HttpSession%>
</div>
<div style="margin-top: 40px">
    class name of "application" : <%=application.getClass().getName()%>
</div>
<div>
    "application" is instance of "HttpSession": <%=application instanceof ServletContext%>
</div>

</body>
</html>
