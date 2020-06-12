<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./dbinfo.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String uName = request.getParameter("uname");
		int uAge = Integer.parseInt(request.getParameter("iage"));
		
		String sql="update sample set age=? where name=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, pass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uAge);
			pstmt.setString(2, uName);
		
			
			pstmt.executeUpdate();
			out.println("등록 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			response.sendRedirect("./research_list.jsp");
		}//finally의 끝
	%>
	<!-- 
update sample set age=? where name=?

 -->

</body>
</html>