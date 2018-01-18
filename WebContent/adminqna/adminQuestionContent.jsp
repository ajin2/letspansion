<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp"%>
		<script src="${project}adminqna/script.js"></script>
		
	</head>
	<body>
		
		<form name="qcontent">
		<input type="hidden" name="q_num" value="${qDto.q_num}">
		<input type="hidden" name="q_cate" value="${qDto.q_cate}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="q_delete" value="${qDto.q_delete}">
		<input type="hidden" name="ref" value="${qDto.ref}">
		<input type="hidden" name="re_step" value="${qDto.re_step}">
		<input type="hidden" name="re_level" value="${qDto.re_level}">

			<table border="1" width="900px"> 
				<tr> 
					<th width="10%"> 작성자 </th>
					<c:if test="${qDto.m_id ne null}">
						<td width="13%"> &nbsp;&nbsp; ${qDto.m_id} </td>
					</c:if>
					<c:if test="${qDto.a_id ne null}">
						<td width="13%"> &nbsp;&nbsp; ${qDto.a_id} </td>
					</c:if>
					<th width="11%"> 작성일 </th>
					<td width="22%">  &nbsp;&nbsp; ${qDto.q_regdate} </td>
				</tr>
				<tr>
					<th width="10%"> 제목 </th>
					<td colspan="3"> 
						&nbsp;&nbsp; ${qDto.q_subject}
					</td> 
				</tr>
				<tr>
					<th colspan="4" align="left"> &nbsp;&nbsp; 내용 </th>
				</tr> 
				<tr>
					<td colspan="4" rowspan="3">
						<pre>  &nbsp;&nbsp; ${qDto.q_content} </pre> 
					</td>
				</tr>
			</table>
			
				<!-- 목록 -->
			<input type="button" value="목록" onclick="location='adminPensionQna.do'">
			
				<!-- 답글 -->
			<c:if test="${qDto.re_step eq 0}">
			<input type="button" value="답글"
			  onclick="location='adminQuestionWrite.do?m_id=${qDto.m_id}&q_cate=${qDto.q_cate}&q_num=${qDto.q_num}&ref=${qDto.ref}&re_step=${qDto.re_step}&re_level=${qDto.re_level}&pageNum=${pageNum}'">
			</c:if>
			  
				<!-- 수정 -->
			<c:if test="${sessionScope.adminId eq qDto.a_id}">
				<input type="button" value="수정" 
					onclick="location='adminQuestionModify.do?q_num=${qDto.q_num}&pageNum=${pageNum}'">	
			</c:if>	
				<!-- 삭제 -->
			<input type="button" value="삭제" onclick="adminDelCheck('${qDto.q_num}', '${qDto.ref}', '${qDto.re_step}', '${qDto.re_level}' ,'${pageNum}')">	
			
		</form>
	</body>
</html>