	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userId = request.getParameter("userId");

	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault = "select subscribeOrderDate,subscribeOrderQuantity,subscribeOrderAddr,subscribeOrderAddrDetail,subscribeOrderPayment,userId,productId,productNo,productName,productImagePath,productPrice,subscribeOrderNextDate from subscribeOrder,product where productId=productNo and userId = '"+userId+"'";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // 
%>
		{ 
  			"subscribeOrder,product"  : [ 
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
			"subscribeOrderDate" : "<%=rs.getString(1) %>", 
			"subscribeOrderQuantity" : "<%=rs.getInt(2) %>",   
			"subscribeOrderAddr" : "<%=rs.getString(3) %>",  
			"subscribeOrderAddrDetail" : "<%=rs.getString(4) %>",  
			"subscribeOrderPayment" : "<%=rs.getString(5) %>",
            "userId" : "<%=rs.getString(6) %>",
            "productId" : "<%=rs.getInt(7) %>",
            "productNo" : "<%=rs.getInt(8) %>",
            "productName" : "<%=rs.getString(9) %>",
            "productImagePath" : "<%=rs.getString(10) %>",
            "productPrice" : "<%=rs.getInt(11) %>",
             "subscribeOrderNextDate" : "<%=rs.getString(12) %>"


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