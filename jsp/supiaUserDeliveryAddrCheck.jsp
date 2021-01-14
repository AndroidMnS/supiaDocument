<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  

<%

	String userId= request.getParameter("userId");

	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select userId, deliveryAddr,deliveryAddrDetail, deliveryTel, deliveryName,deliveryNo from userDeliveryAddrList  where userId = ? order by insertdate desc";
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();
		ps = conn_mysql.prepareStatement(WhereDefault);
		ps.setString(1,userId);// 
        rs = ps.executeQuery(); 
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
			"userId" : "<%=rs.getString(1) %>", 
			"deliveryAddr" : "<%=rs.getString(2) %>",   
			"deliveryAddrDetail" : "<%=rs.getString(3) %>",  
			"deliveryTel" : "<%=rs.getString(4) %>",  
			"deliveryName" : "<%=rs.getString(5) %>",
            "deliveryNo" : "<%=rs.getString(6) %>"
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
