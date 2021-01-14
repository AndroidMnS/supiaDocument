	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
     String userId = request.getParameter("userId");

	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault = "select orderQuantity,orderlist.productPrice,productId,productNo,orderlist.productName,orderPayment,userId,productImagePath,orderNo from product,orderlist where productId=productNo and userId = '"+userId+"'";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // 
%>
		{ 
  			"orderlist,product"  : [ 
<%
        while (rs.next()) {
            if (count == 0) {

            }else{
%>
            , 
<%
            }
%>            
			{
			"orderQuantity" : "<%=rs.getInt(1) %>", 
			"productPrice" : "<%=rs.getInt(2) %>",   
			"productId" : "<%=rs.getInt(3) %>",  
			"productNo" : "<%=rs.getInt(4) %>",
            "productName" : "<%=rs.getString(5) %>",
            "orderPayment" : "<%=rs.getString(6) %>",
            "userId" : "<%=rs.getString(7) %>",
            "productImagePath" : "<%=rs.getString(8) %>",
            "orderNo" : "<%=rs.getInt(9) %>"

            

			}

<%		
        count++;
        }
%>
		  ] 
		} 
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>