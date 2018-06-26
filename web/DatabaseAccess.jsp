<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 6/26/2018
  Time: 6:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String isbn=request.getParameter("ISBN");
    String title=request.getParameter("Title");
    String authors=request.getParameter("Authors");
    int price=Integer.parseInt(request.getParameter("Price"));
    String pub=request.getParameter("PUB");

%>
<%@page import="java.sql.*" %>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    System.out.println("Driver Loaded");

    String server = "//localhost\\DESKTOP-VEIF510\\MENUKASQLSERVER";
    String database = "Menuka13";
    int port = 1433;

    String jdbcUrl = "jdbc:sqlserver:" + server + ":" + port + ";databaseName=" + database + ";integratedSecurity=true";
    Connection con = DriverManager.getConnection(jdbcUrl);
    System.out.println("Connection Obtained");
     Statement statement= con.createStatement();

     String sql="Insert into Book values('"+isbn+"','"+title+"','"+authors+"',"+price+",'"+pub+"')";
     statement.executeUpdate(sql);
     out.println("Book is added successfully");
%>
<h3>The data are:</h3>
<table border="1">
    <tr>
        <td>ISBN</td>
        <td>Title</td>
        <td>Author</td>
        <td>Price</td>
        <td>Publishers</td>
    </tr>
<%
    try{
        String result = "select * from Book";
        boolean results = statement.execute(result);
        if(results){
            ResultSet rst = statement.getResultSet();
            while(rst.next()){
                out.println("<tr>");
                String isb = rst.getString("ISBN");
                String tit = rst.getString("Title");
                String aut = rst.getString("Authors");
                String pric = rst.getString("Price");
                String pb = rst.getString("Publishers");
                out.println("<td>" + isb + "</td>");
                out.println("<td>" + tit + "</td>");
                out.println("<td>" + aut + "</td>");
                out.println("<td>" + pric + "</td>");
                out.println("<td>" + pb + "</td>");
                out.println("</tr>");
            }
        }
        statement.close();
        con.close();
    }catch (Exception e){
        e.printStackTrace();
    }
    %>
</table>

</body>
</html>
