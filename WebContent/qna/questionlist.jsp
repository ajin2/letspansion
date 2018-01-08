<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<%@ include file="setting.jsp" %>
	</head>
	<body>
		<form name="qlist">
			<table border="1">
				<tr>
					<th colspan="4" align="right"> &nbsp;
						<input type="button" value="글작성" 
							onclick="location='questionWrite.do'">
					</th>
				</tr>
				<tr>
					<th> 번호 </th>
					<th> 제목 </th>
					<th> 작성자 </th>
					<th> 작성일 </th>
				</tr>
				
				
			</table>
		</form>
	</body>
</html>