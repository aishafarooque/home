<%-- 
    Document   : index.jsp
    Created on : Nov 3, 2019, 8:52:36 PM
    Author     : Aisha Farooque
--%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%  Class.forName("oracle.jdbc.driver.OracleDriver");%> 


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Product Information</title>
    </head>
    <body>
        <h4>This page to Oracle 12c Table!</h4>
        
        <% 
            String url = "jdbc:oracle:thin:@129.7.240.3:1521:ORCL";
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@129.7.240.3:1521:ORCL", "AFAROOQUE", "AFAROOQUE#");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("SELECT Product.PRODUCT_ID, Product.PRODUCT_NAME, (SELECT SUM(Order_Line.ORDERED_QUANTITY) FROM AFAROOQUE.ORDER_LINE WHERE Order_Line.PRODUCT_ID = Product.PRODUCT_ID) FROM AFAROOQUE.PRODUCT WHERE ROWNUM <= 100");
        %>
        
        <TABLE BORDER="1" BGCOLOR="CCFFFF" width='50%' cellspacing='1' cellpadding='0'   bordercolor="black" border='1'>
            <TR>
                <TH bgcolor='#DAA520'> <font size='2'/>Product ID</TH>
                <TH bgcolor='#DAA520'> <font size='2'/>Product Description</TH>
                <TH bgcolor='#DAA520'><font size='2'/>Number of Orders</TH>
            </TR>
            
             <% while (resultset.next()) {%>
            <TR>
                <TD> <font size='2'/><center><%= resultset.getString(1)%></center></TD>
                <TD> <font size='2'/><center><%= resultset.getString(2)%></center></TD>
                <TD> <font size='2'/><center><%= resultset.getString(3)%></center></TD>
            </TR>

            <% }%>

        </TABLE>
        
    </body>
</html>
