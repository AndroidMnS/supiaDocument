	
    <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    
	String url_mysql = "jdbc:mysql://database-2.cotrd7tmeavd.ap-northeast-2.rds.amazonaws.com/supia?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    
    String stuserId =  request.getParameter("userId");
    String WhereDefault = "select calendarStartDate, calendarFinishDate, calendarDeliveryDate, calendarBirthDate, userId from supia.calendar Where calendar.userId = '"+stuserId+"'";
    int count = 0;
     PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
       Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();
        ps = conn_mysql.prepareStatement(WhereDefault);
        rs = ps.executeQuery();  
%>
		{ 
  			"calendar"  : [ 
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
			"calendarStartDate" : "<%=rs.getString(1) %>", 
			"calendarFinishDate" : "<%=rs.getString(2) %>",
            "calendarDeliveryDate" : "<%=rs.getString(3) %>",
            "calendarBirthDate" : "<%=rs.getString(4) %>"
                 
		
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