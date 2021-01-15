	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
     String userId = request.getParameter("userId");

	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault = "select subscribeProductName,subscribeProductPrice,subscribeOrderQuantity,productImagePath,productNo,productId,productBrand,productInfo,productPrice,productName  from subscribeOrder,product where productNo=productId and userId = '"+userId+"'";
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
			"subscribeProductName" : "<%=rs.getString(1) %>", 
			"subscribeProductPrice" : "<%=rs.getInt(2) %>",   
			"subscribeOrderQuantity" : "<%=rs.getInt(3) %>",
            "productImagePath" : "<%=rs.getString(4) %>",
			"productNo" : "<%=rs.getInt(5) %>",
            "productId" : "<%=rs.getInt(6) %>",
              "productBrand" : "<%=rs.getString(7) %>",
                "productInfo" : "<%=rs.getString(8) %>",
                  "productPrice" : "<%=rs.getInt(9) %>",
                    "productName" : "<%=rs.getString(10) %>"

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