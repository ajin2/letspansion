<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
	</head>
	<body>
	
	<table>
				<tr>
					<th> <jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/> </th>	
					<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
				</tr>
			</table>
			
			<br><br><br>
			
	
	<form method="post" name="questionform" action="adminQuestionModifyPro.do" 
		onsubmit="return writecheck()">
		
		<input type="hidden" name="a_id" value="${qDto.a_id}" />
		<input type="hidden" name="q_num" value="${q_num}" />
		<input type="hidden" name="pageNum" value="${pageNum}" />
		
		<table border="1">
			<tr>
				<th colspan="2">
					: 카테고리 :
				</th>
			</tr>
			<tr>
				<td colspan="2">
					 <c:if test="${qDto.q_cate eq 1}">
						환불/교환
					</c:if>
					<c:if test="${qDto.q_cate eq 2}">
						예약취소
					</c:if>
					<c:if test="${qDto.q_cate eq 3}">
						픽업문의
					</c:if>
					<c:if test="${qDto.q_cate eq 4}">
						기타문의
					</c:if>
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
						${qDto.a_id}
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
				<td> <textarea name="q_content" rows="15" cols="65" >${qDto.q_content}</textarea> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기" >
					<input type="button" value="취소" onclick="location='adminPensionQna.do?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
	</form>
	</body>
</html>