<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<script src="${project}notice/script.js"></script>
	</head>
	<body>
		<form method="post" action="noticeWritePro.do"
	 	name="noticewriteform" onsubmit="return writecheck()">
	 	
	 	<input type="hidden" name="n_id" value="${n_id}">
			<table border="1">
				<tr>
					<th colspan="2" align="right">
						<a href="list.do">${str_list}</a>&nbsp;&nbsp;&nbsp;
					</th> 
				</tr>
				<tr>
					<th> 작성자 </th>
					<td>
						<c:if test="${a_id eq 'admin'}">
							관리자
						</c:if>
					</td>
				</tr>
				<tr>
					<th> 제목 </th>
					<td>
						<input class="input" type="text" name="n_subject"
							maxlength="50" style="width: 286px">
					</td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td>
						<textarea name="n_content" rows="10" cols="38"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">	
						<input class="inputbutton" type="submit" value="작성">
						<input class="inputbutton" type="reset" value="작성취소">
						<input class="inputbutton" type="button" value="목록"
							onclick="location='noticeList.do'">
					</th>
				</tr>
			</table>	
		</form>
	</body>
</html>