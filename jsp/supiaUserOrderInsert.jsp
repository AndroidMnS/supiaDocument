<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("utf-8");
	String orderDate = request.getParameter("orderDate");
	String strOrderQuantity = request.getParameter("orderQuantity");
	int orderQuantity = Integer.parseInt(strOrderQuantity);
	String orderAddr = request.getParameter("orderAddr");
	String orderAddrDetail = request.getParameter("orderAddrDetail");
	String orderPayment = request.getParameter("orderPayment");	
	String strOrderTotalPrice = request.getParameter("orderTotalPrice");
	int orderTotalPrice = Integer.parseInt(strOrderTotalPrice);	
	String userId = request.getParameter("userId");
	String strProductId = request.getParameter("productId");
	int productId = Integer.parseInt(strProductId);
	String orderTel = request.getParameter("orderTel");
	String productName = request.getParameter("subscribeProductName");
	String productPrice = request.getParameter("subscribeProductPrice");


		
//------
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into orderlist (orderDate, orderQuantity, orderTel, orderAddr, orderAddrDetail, orderPayment, orderTotalPrice, userId, productId,productName,productPrice ";
	    String B = ") values (?,?,?,?,?,?,?,?,?,?,?)";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, orderDate);
	    ps.setInt(2, orderQuantity);
	    ps.setString(3, orderTel);
	    ps.setString(4, orderAddr);
	    ps.setString(5, orderAddrDetail);
	    ps.setString(6, orderPayment);
	    ps.setInt(7, orderTotalPrice);
	    ps.setString(8, userId);
	    ps.setInt(9, productId);
	    ps.setString(10, productName);
	    ps.setString(11, productPrice);


		
	    
	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}
	
%>

