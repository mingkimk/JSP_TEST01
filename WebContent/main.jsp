<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!// 선언
	int a = 10;
	int b = 20;
	int sum = a + b;
	
	
	public int abs(int n){
		if(n<0){
			n=-n;
		}
		return n;
	}
%>


<%
		//jsp 문법을 작성 하고자 할때는 이와 같은 안에서 선언해야함
		//자바 코드 

		out.print("<hr>" + "<br>" + sum);
%>
<p>a+b 계산결과값</p><%=sum %><br> <%--= 에 선언 하면 out.print 필요 없음-%>
<%=abs(-5) --%>
<%
		out.print("-10의 절대값"+ abs(-10));
%>

</body>
</html>