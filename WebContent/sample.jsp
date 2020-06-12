<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%!	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "system";
	String pass = "1111";
	String sql = "insert into research values(?, ?, ?, ?, ?, ?)";
%>	
<%

	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("iname");
	int age = Integer.parseInt(request.getParameter("iage"));
	String gender = request.getParameter("igender");
	String city = request.getParameter("icity");
	String title = request.getParameter("isubject");
	String body = request.getParameter("ibody");
	String hobby[] = request.getParameterValues("ihob");
	
	

%>
<%
	    // 반드시 web-inf에 bin에저장해야 한다. 그리고 이클립스 갱신
		try {
			//(1 단계) JDBC 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//(2 단계) 데이터베이스 연결 객체인 Connection 생성
			conn = DriverManager.getConnection(url, uid, pass);
			//(3 단계) Statement 객체 생성하기
			pstmt = conn.prepareStatement(sql);
			//(4 단계) 바인딩 변수를 채운다.
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, gender);
			pstmt.setString(4, city);
			pstmt.setString(5, title);
			pstmt.setString(6, body);
			
			//(5단계) SQL문을 실행하여 결과 처리
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//(6단계) 사용한 리소스 해제
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("./01_research_list.jsp");
		}//finally의 끝
	%>
</body>
</html>