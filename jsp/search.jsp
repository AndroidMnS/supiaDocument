	
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String stSearch =  request.getParameter("productName");

	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "SELECT distinct * From supia.product ";
    String WhereDefault1 = "Left join liked on product.productno = liked.likeproductid "; 
    String WhereDefault2 = "where productName like '%" + stSearch + "%' or productBrand like '%" + stSearch + "%' or productCategory1 like '%" + stSearch + "%' or productCategory2 like '%" + stSearch + "%' ";
    String WhereDefault3 =  "UNION ";
    String WhereDefault4 =  "SELECT * From supia.liked ";
    String WhereDefault5 =  "right join product on product.productno = liked.likeproductid ";
    String WhereDefault6 =  "where supia.product.productno is null order by productNo desc "; 


    
    int count = 0;

     PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
       Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();
        ps = conn_mysql.prepareStatement(WhereDefault + WhereDefault1 + WhereDefault2 + WhereDefault3 + WhereDefault4 + WhereDefault5 + WhereDefault6);
        rs = ps.executeQuery();  
%>
		{ 
  			"product"  : [ 
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
			"productNo" : "<%=rs.getInt(1) %>", 
			"productName" : "<%=rs.getString(2) %>",   
			"productPrice" : "<%=rs.getInt(3) %>",  
			"productQuantity" : "<%=rs.getInt(4) %>",
            "productBrand" : "<%=rs.getString(5) %>",
            "productImagePath": "<%=rs.getString(6) %>",
            "productInfo" : "<%=rs.getString(7) %>",
            "productCategory1" :"<%=rs.getString(8) %>",
            "productCategory2" :"<%=rs.getString(9) %>",
              "likeUserId" :"<%=rs.getString(10) %>",
                "likeProductId" :"<%=rs.getInt(11) %>",
                "likeCheck" :"<%=rs.getString(12) %>"
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