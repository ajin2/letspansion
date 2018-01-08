<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<center>
<html>

	<head>
		<meta charset="UTF-8">
		<h3> 공지사항 </h3>
	</head>
	
	<body>
		
		<form method="post" action="noticeWritePro.do" name="noticeWriteForm" 
			onsubmit="return noticewritecheck()">
			
			<input type="text" name="n_id" value="${n_id}">
			<input type="text" name="a_id" value="${a_id}">
			
			<table border="1">
				<tr>
					<th> 제목 </th>
					<td> <input type="text" name="n_subject" maxlength="50" 
						style="width:446px"> </td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td> <textarea name="n_content" rows="10" cols="58">
					</textarea> </td>
				</tr>
				<br><br>
				<tr>
					<th colspan="2">
						<input type="submit" value="작성">
						<input type="button" value="목록" 
							onclick="location='noticeList.do'">
					</th> 
				</tr>
			</table>
		</form>
	
	</body>
	
</html>
	</center>