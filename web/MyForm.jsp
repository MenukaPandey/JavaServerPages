<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 6/25/2018
  Time: 7:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyForm</title>
</head>
<body>
    <%
    String fname=request.getParameter("firstname");
        String lname=request.getParameter("lastname");
        String gender=request.getParameter("sex");
        String country=request.getParameter("country");
    %><br><br><br>
    <h2>Hello, <%=fname+" "+lname+" !"%>
    I see that you are <%=gender%> and from country <%=country+"."%>
    </h2>

</body>
</html>
