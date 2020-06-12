
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	text =align: center
}
</style>
</head>
<body>
<%@include file="./dbinfo.jsp"%>
	<table border=1 width=300>
	
	<tr>
			<td>이름</td>
			<td>나이</td>
			<td colspan=2>삭제/수정</td>
		</tr>
		
	<%-- 
	<tr>
			<td>홍길동</td>
			<td>2</td>
		</tr>
	--%>
		<%
			request.setCharacterEncoding("UTF-8");
			// 반드시 web-inf에 bin에저장해야 한다. 그리고 이클립스 갱신
			String sql="select * from sample";
			try {
				//(1 단계) JDBC 드라이버 로드
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//(2 단계) 데이터베이스 연결 객체인 Connection 생성
				conn = DriverManager.getConnection(url, uid, pass);
				//(3 단계) Statement 객체 생성하기
				stmt = conn.createStatement();
				//(4 단계) 바인딩 변수를 채운다.

				//(5단계) SQL문을 실행하여 결과 처리
				rs=stmt.executeQuery(sql);
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("age") + "</td>");
					out.println("<td><a href='./research_del.jsp?dname="+rs.getString("name") +"'>삭제</td>");
					out.println("<td><a href='./research_form_m.jsp?dname="+rs.getString("name") +"'>수정</td>");
					
					out.println("<tr>");
				}

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

			
			} //finally의 끝
		%>

		
		<tr>
	
		<td  colspan=4><a href="./research_form.jsp">사용자 추가</a></td>
		</tr>
		
	</table>

</body>
</html>