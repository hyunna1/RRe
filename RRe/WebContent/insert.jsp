<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.reply.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		RepDAO dao = new RepDAO();
		ReVO vo = new ReVO();
		
		vo.setContent(request.getParameter("content"));
		vo.setName(request.getParameter("name"));
		vo.setPwd(request.getParameter("pwd"));
		
		int result = dao.insert(vo);
		
		response.sendRedirect("rep.jsp");
	%>
</body>
</html>