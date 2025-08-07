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
String num = request.getParameter("num");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int a =0;
try {
	 Class.forName("com.mysql.cj.jdbc.Driver");
	    conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/du08", "root", "1234");
	    stmt = conn.createStatement();
	    rs = stmt.executeQuery("SELECT * FROM board where num = "+num);
	    while (rs.next()) {
	    	a = rs.getInt("hits");
    	
%>
	<tr>
        <th>제목</th>
        <td><%=rs.getString("title") %></td>
    </tr>
    <tr>
        <th>작성자</th>
        <td><%=rs.getString("writer") %></td>
    </tr>
    <tr>
        <th>작성일시</th>
        <td><%=rs.getString("regtime") %></td>
    </tr>
    <tr>
        <th>조회수</th>
        <td><%=a+1 %></td>
    </tr>
    <tr>
        <th>내용</th>
        <td><%=rs.getString("content") %></td>
    </tr>

<%
    }
	  	 stmt.executeUpdate("update board set hits ="+(a+1)+" where num="+num);
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
%>
</table>
<br>
<input type="button" value="목록보기" onclick="location.href='list.jsp'">
<input type="button" value="수정"
       onclick="location.href='update.jsp?num=<%=num%>'">
<input type="button" value="삭제"
       onclick="location.href='delete.jsp?num=<%=num%>'">

</body>
</html>