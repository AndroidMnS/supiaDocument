	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userId = request.getParameter("userId");


	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault = "SELECT deliveryAddr, deliveryTel,deliveryName,insertDate,userId FROM userDeliveryAddrList ORDER BY insertDate and userId = '"+userId+"' DESC LIMIT 1 ";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // 
%>
		{ 
  			"userDeliveryAddrList"  : [ 
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
			"deliveryAddr" : "<%=rs.getString(1) %>", 
			"deliveryTel" : "<%=rs.getString(2) %>",   
			"deliveryName" : "<%=rs.getString(3) %>",  
			"insertDate" : "<%=rs.getString(4) %>",
            "userId" : "<%=rs.getString(5) %>"
        
           
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