<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String userId= request.getParameter("userId");
	String userPw= request.getParameter("userPw");
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select userId, userPw, userAddr, userTel,userName from user where userId = ?";
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
  			"user"  : [ 
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
			"userPw" : "<%=rs.getString(2) %>",   
			"userAddr" : "<%=rs.getString(3) %>",  
			"userTel" : "<%=rs.getString(4) %>",
            "userName" : "<%=rs.getString(5) %>"
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
