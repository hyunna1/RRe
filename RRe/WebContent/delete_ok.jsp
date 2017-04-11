<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.reply.*"%>
<%
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	//DB연동
	RepDAO dao = RepDAO.newInstance();
	boolean bCheck = dao.delete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
		<script>
			alert("비밀번호가 틀립니다.\n다시 입력해주세요");
			history.back();
		</script>
<%
	} else {
		response.sendRedirect("list2.jsp");
	}
%>