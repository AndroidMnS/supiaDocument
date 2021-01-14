	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userId = request.getParameter("userId");
        
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault = "select reviewNo,reviewContent,reviewTitle,orderId,productNo,productName,userId from review where userId ='"+userId+"'";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // 
%>
		{ 
  			"review"  : [ 
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
			"reviewNo" : "<%=rs.getInt(1) %>", 
			"reviewContent" : "<%=rs.getString(2) %>",   
			"reviewTitle" : "<%=rs.getString(3) %>",  
			"orderId" : "<%=rs.getInt(4) %>",
            "productNo" : "<%=rs.getInt(5) %>",
            "productName" : "<%=rs.getString(6) %>",
            "userId" : "<%=rs.getString(7) %>"

            

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