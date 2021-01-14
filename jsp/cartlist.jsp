	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";


    String cartUserId = request.getParameter("cartUserId");


 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

    String WhereDefault = "select * from cart where cartUserId =" + cartUserId;


    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault);  
%>
		{ 
  			"cart"  : [ 
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
			"cartNo" : "<%=rs.getInt(1) %>", 
			"cartProductId" : "<%=rs.getInt(2) %>",   
			"cartProductName" : "<%=rs.getString(3) %>",  
			"cartUserId" : "<%=rs.getString(4) %>",
            "cartProductQuantity" : "<%=rs.getInt(5) %>",
            "cartProductPrice": "<%=rs.getInt(6) %>",
            "cartProductImagePath" : "<%=rs.getString(7) %>"
        
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