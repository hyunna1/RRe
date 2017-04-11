<%@page import="com.sist.reply.ReVO"%>
<%@page import="com.sist.reply.RepDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		RepDAO dao = new RepDAO();
		ReVO vo = new ReVO();
		vo.setNo(Integer.parseInt(request.getParameter("no")));
		
		if(request.getParameter("pwd")!= null){
			vo.setPwd(request.getParameter("pwd"));
			
			dao.Delete(vo);
		}
	%>
	<form method="post" action="delete.jsp">
		<input type="hidden" name="no" value="<%=vo.getNo()%>">
		비밀번호 입력:
		<input type="text" name="pwd">
		<input type="submit" value="입력" onclick="self.close(); opener.location.reload();">
	</form>
</body>
</html>