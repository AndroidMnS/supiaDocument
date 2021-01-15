	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String productId = request.getParameter("productNo");
        
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";   
    String WhereDefault1 = "select count(*) birth  from ( ";
    String WhereDefault2 = "select productId from orderlist where productId='"+productId+"' ";
    String WhereDefault3 = "union all ";
    String WhereDefault4 = "select productId from subscribeOrder where productId='"+productId+"' ";
    String WhereDefault5 = ") birth , calendar where calendarBirthDate between '1983-12-31' and '1992-01-01' ";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault1+WhereDefault2+WhereDefault3+WhereDefault4+WhereDefault5); // 
%>
		{ 
  			"birth"  : [ 
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
			"birth" : "<%=rs.getString(1) %>"
			
            

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