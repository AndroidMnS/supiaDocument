<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userAddr = request.getParameter("userAddr");
	String userAddrDetail = request.getParameter("userAddrDetail");
	String userTel = request.getParameter("userTel");	
	String userName = request.getParameter("userName");
	String userPlatform = request.getParameter("userPlatform");
		
//------
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into user (userId, userPw, userAddr,userAddrDetail, userTel, userPlatform, userName";
	    String B = ") values (?,?,?,?,?,?,?)";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, userId);
	    ps.setString(2, userPw);
	    ps.setString(3, userAddr); 
	    ps.setString(4, userAddrDetail); 
	    ps.setString(5, userTel);
	    ps.setString(6, userPlatform);
	    ps.setString(7, userName);
		
	    
	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}
	
%>

