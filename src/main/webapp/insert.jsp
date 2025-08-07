<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width:680px; text-align:center; }
        th    { width:100px; background-color:cyan; }
        td    { text-align:left; border:1px solid gray; }
    </style>
</head>
<body>
<table>
<%
//번호	제목	작성자	작성일시	조회수    -띄우기
/*  num     int          auto_increment primary key,
  writer  varchar(20),
  title   varchar(60),
  content text,
  regtime varchar(20),
  hits    int */
  
request.setCharacterEncoding("utf-8"); 
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/du08", "root", "1234");
    stmt = conn.createStatement();
    String str =String.format("insert into board(title, writer,content,regtime,hits) values ('%s','%s','%s',now(),0)",title,writer,content);
    
    stmt.executeUpdate(str);
    
} catch (SQLException e) {
    out.println("데이터베이스 오류: " + e.getMessage());
} catch (ClassNotFoundException e) {
    out.println("드라이버를 찾을 수 없습니다: " + e.getMessage());
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        out.println("리소스를 닫는 도중 오류 발생: " + e.getMessage());
    }
}
response.sendRedirect("list.jsp");
%>

</table>



</body>
</html>