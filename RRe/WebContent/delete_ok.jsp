<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.reply.*"%>
<%
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	//DB����
	RepDAO dao = RepDAO.newInstance();
	boolean bCheck = dao.delete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
		<script>
			alert("��й�ȣ�� Ʋ���ϴ�.\n�ٽ� �Է����ּ���");
			history.back();
		</script>
<%
	} else {
		response.sendRedirect("list2.jsp");
	}
%>