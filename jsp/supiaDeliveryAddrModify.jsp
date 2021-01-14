<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String deliveryAddr = request.getParameter("deliveryAddr");
	String deliveryAddrDetail = request.getParameter("deliveryAddrDetail");
	String deliveryTel = request.getParameter("deliveryTel");
	String deliveryName = request.getParameter("deliveryName");	
	String insertDate = request.getParameter("insertDate");	
	String strDeliveryNo = request.getParameter("deliveryNo");	
	int deliveryNo = Integer.parseInt(strDeliveryNo);
	
		
//------
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "update userDeliveryAddrList set userId = ?, deliveryAddr = ? , deliveryAddrDetail = ? , deliveryTel = ?  , deliveryName = ? , insertDate = ? where deliveryNo = ?";
	   
	
	    ps = conn_mysql.prepareStatement(A);
	    ps.setString(1, userId);
	    ps.setString(2, deliveryAddr);
	    ps.setString(3, deliveryAddrDetail);
	    ps.setString(4, deliveryTel);
	    ps.setString(5, deliveryName);
	    ps.setString(6, insertDate);
	     ps.setInt(7, deliveryNo);


	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}
	
%>

