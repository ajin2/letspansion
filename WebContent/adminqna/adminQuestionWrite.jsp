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
					<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
				</tr>
			</table>
			
			<br><br><br>
	
	<form name="questionform" action="adminQuestionWritePro.do" 
		onsubmit="return writecheck()">
		
		<input type="hidden" name="a_id" value="${sessionScope.adminId}" />
		<input type="hidden" name="q_cate" value="${q_cate}" />
		<input type="hidden" name="q_num" value="${q_num}" />
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<input type="hidden" name="ref" value="${ref}" />
		<input type="hidden" name="re_step" value="${re_step}" />
		<input type="hidden" name="re_level" value="${re_level}" />
		
		<table border="1">
			<tr>
				<th colspan="2">
					*카테고리 
				</th>
			</tr>
			<tr>
				<td>
				
					<select name="q_cate">
						<c:if test="${q_cate eq 1}">
							<option> 환불/교환 </option>
						</c:if>
						<c:if test="${q_cate eq 2}">
							<option> 예약취소 </option>
						</c:if>
						<c:if test="${q_cate eq 3}">
							<option> 픽업문의 </option>
						</c:if>
						<c:if test="${q_cate eq 4}">
							<option > 기타문의 </option>
						</c:if>
					</select>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">	
					*회원정보
				</th>
			</tr>
			<tr>
				<th> 이름 </th>
					<td>
					 &nbsp;&nbsp; ${sessionScope.adminId}
				
			</tr>
			
			<tr>
				<th colspan="2">	
					*문의하기
				</th>
			</tr>
			<tr>
				<th> 제목 </th>
				<td> <input type="text" name="q_subject" value="${qDto.q_subject}"> </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea name="q_content" rows="15" cols="65"></textarea> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="문의하기" >
					<input type="button" value="취소" onclick="location='adminPensionQna.do?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
	</form>
	</body>
</html>