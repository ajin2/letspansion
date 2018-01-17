<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
	</head>
	<body>
	<form name="questionform" action="questionWritePro.do" 
		onsubmit="return writecheck()">
		
		<input type="hidden" name="m_id" value="${qDto.m_id}" />
		<input type="hidden" name="q_num" value="${q_num}" />
		<input type="hidden" name="pageNum" value="${pageNum}" />
		
		<table border="1">
			<tr>
				<th colspan="2">
					: 카테고리 :
				</th>
			</tr>
			<tr>
				<td>
					${qDto.q_cate}
				</td>
			</tr>
			
			<tr>
				<th colspan="2">	
					: 회원정보 :
				</th>
			</tr>
			<tr>
				<th> 이름 </th>
					<td>
						${qDto.m_id}
					</td>
				
			</tr>
			<!-- <tr>
				<th> 이메일 : </th>
				<td><input type="text" name="email" value="이메일"> </td>
				
			</tr> -->
			
			<tr>
				<th colspan="2">	
					: 문의하기 :
				</th>
			</tr>
			<tr>
				<th> 제목 </th>
				<td> <input type="text" name="q_subject" value="${qDto.q_subject}"> </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea name="q_content" rows="15" cols="65" value="${qDto.q_content}"></textarea> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기" >
					<input type="button" value="취소" onclick="location='questionList.do?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
	</form>
	</body>
</html>