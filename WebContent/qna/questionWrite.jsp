<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
	</head>
	<body>
	<form  name="questionform" action="questionPro.do" 
		onsubmit="return writecheck()">
		<table border="1">
			<tr>
				<th colspan="2">
					: 카테고리 :
				</th>
			</tr>
			<tr>
				<th>
					<select>
						<option > 선택해주세요. </option>
						<option value="1"> 환불 / 교환 </option>
						<option value="2"> 취소 </option>
						<option value="3"> 픽업 </option>
						<option value="4"> 기타 </option>				
					</select>
				</th>
			</tr>
			
			<tr>
				<th colspan="2">	
					: 회원정보 :
				</th>
			</tr>
			<tr>
				<th> 이름 </th>
					<td>
					 <input type="text" name="name" value="이름"> </td>
				
			</tr>
			<tr>
				<th> 이메일 : </th>
				<td><input type="text" name="email" value="이메일"> </td>
				
			</tr>
			
			<tr>
				<th colspan="2">	
					: 문의하기 :
				</th>
			</tr>
			<tr>
				<th> 제목 </th>
				<td> <input type="text" name="q_subject" value="제목을 입력해주세요"> </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea name="q_content" rows="15" cols="65"></textarea> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="문의하기" >
					<input type="button" value="취소" onclick="location='questionlist.do'">
				</th>
			</tr>
		</table>
	</form>
	</body>
</html>