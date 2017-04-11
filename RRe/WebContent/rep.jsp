<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.reply.*"%>
<%
	RepDAO dao = new RepDAO();
	ReVO vo = new ReVO();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css?ver=2" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	var i = 0;
	$(function() {
		$('#delBtn').click(function() {
			if (i == 0) {
				$('#del').show();
				i = 1;
			} else {
				$('#del').hide();
				i = 0;
			}
		});
	});
</script>
</head>
<body>
	<center>
		<form name="inputform" method="post" action="insert.jsp">
			<table border="0" width="500" id="table_content">
				<input type="hidden" name="pro" value="ins">
				<tr>
					<th width="100">이름</th>
					<td><input type="text" name="name"></td>
					<th width="100">비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<textarea rows="3" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" value="답변등록"></td>
				</tr>
			</table>
		</form>
		<hr>

		<!-- 글 목록 시작 -->
		
			<input type="hidden" name="pro">
			<div style="overflow: auto; width: 700px; height: 400px;">
				<%
					ArrayList<ReVO> list = dao.select();
					for (int i = 0; i < list.size(); i++) {
						vo = list.get(i);
				%>
				<table border="0" width="500" id="table_content">
					<tr>
						<th width="100">이름</th>
						<td width="300"><%=vo.getName()%></td>
						<td width="100"><img src="image/delete.gif" id="delBtn" alt="삭제버튼"></td>
					</tr>
					<tr>
						<td colspan="4"><%=vo.getContent()%></td>
					</tr>
					
					<tr id="del" style="display: none;">
						<td align="right">
							<form action="delete_ok.jsp" method="post">
								비밀번호 : <input type="password" size="10" name="pwd"> 
								<input type="hidden" name="no" value="<%=vo.getNo()%>"> 
								<input type="submit" value="삭제">
							</form>
						</td>
					</tr>
				</table>

				<%
					}
				%>
			</div>
	</center>
</body>
</html>