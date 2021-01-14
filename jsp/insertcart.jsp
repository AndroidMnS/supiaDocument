<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String cartUserId = request.getParameter("cartUserId");
	int cartProductId = Integer.parseInt(request.getParameter("productNo"));
	String cartProductName = request.getParameter("productName");
	int cartProductQuantity =  Integer.parseInt(request.getParameter("productQuantity"));
	int cartProductPrice =  Integer.parseInt(request.getParameter("productPrice"));
	String cartProductImagePath = request.getParameter("productImagePath");

	

	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into cart(cartProductId, cartProductName, cartUserId, cartProductQuantity, cartProductPrice, cartProductImagePath) ";
		String B = "values (?, ?, ?, ?, ?, ?)";
	
	    ps = conn_mysql.prepareStatement(A + B);

	    ps.setInt(1, cartProductId);
		ps.setString(2, cartProductName);
		ps.setString(3, cartUserId);
		ps.setInt(4, cartProductQuantity);
		ps.setInt(5, cartProductPrice);
		ps.setString(6, cartProductImagePath);
	    
	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}
	
%>

