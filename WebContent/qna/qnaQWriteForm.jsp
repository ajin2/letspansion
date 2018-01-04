<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<h3> ${question} </h3>
	</head>
	<body>
	
		<form name="qnawriteform">
			
			<!-- 카테고리 -->
			<table border="1">
				<tr>
					<th colspan="2">
						${category}
					</th>
				</tr>
				<tr>
					<th>
						<select>
							<option> 선택해주세요. </option>
							<option value="1"> 환불 / 취소 </option>
							<option value="2"> 물품 수량 변경 </option>
							<option value="3"> 픽업 문의 </option>
							<option value="4"> 예약 결제 문의 </option>
							<option value="5"> 기타 </option>
						</select>
					</th>
				</tr>
			</table>
			
			
			
			<!-- 본인 세부사항 -->
			<table border="1">
				<tr>
					<th colspan="2">
						${my}
					</th>
				</tr>
				<tr>
					<th> 이름 </th>
					<td> <input type="text" name="memid" value="내이름" > </td>
				</tr>
				<tr>
					<th> 이메일 </th>
					<td> <input type="text" name="mememail" value="내이메일" > </td>
				</tr>
			</table>
			
			
			<!-- 문의내용 -->
			<table border="1">
				<tr>
					<th colspan="2">
						문의하기
					</th>
				</tr>
				<tr>
					<th> 제목 </th>
					<td> <input type="text" name="qna_subject" > </td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td> 
						<textarea name="qna_content" rows="15" cols="65"> </textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="문의하기" />
			<input type="button" value="나가기" onclick="location='qna_noticelist.jsp'"/>
		</form>
	</body>
</html>