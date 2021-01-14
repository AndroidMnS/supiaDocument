	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String likeUserId = request.getParameter("userId");


	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault = "select productNo,productName,productPrice,productImagePath,likeUserId,likeProductId,likeCheck from product,liked where productNo = likeProductId and likeCheck ='1' and likeUserId = '"+likeUserId+ "' ";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); 
%>
		{ 
  			"product,liked"  : [ 
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
			"productImagePath" : "<%=rs.getString(4) %>",
            "likeUserId" : "<%=rs.getString(5) %>",
           "likeProductId" : "<%=rs.getInt(6) %>",
           "likeCheck" : "<%=rs.getString(7)%>"
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