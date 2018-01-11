<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<h3> 공지사항 </h3>
	</head>
	<body>
		<input type="hidden" name="m_id" value="${sessionScope.memId}">
	<form>
		
	
	<c:if test="${m_id ne nDto.m_id}">
		<a href="questionWrite.do"> 문의하기 </a> <br>
		<a href="questionList.do"> 내 문의함 </a> <br>
	</c:if> 
	<c:if test="${m_id eq null}">
		<a href="questionWrite.do"> 문의하기 </a> <br>
		<a href="questionList.do"> 내 문의함 </a> <br>
	</c:if>
	
	<table border="1">
		<tr>
		<%-- <c:choose>
		 <c:when test="${a_id == sessionScope.adminId}">
		 	<th colspan="4" align="right">
				<input type="button" value="글작성" onclick="location='noticeWriteForm.do'">
			</th> 
		 </c:when>
		 <c:otherwise>
		 </c:otherwise>
		</c:choose> --%>
		</tr>
		
		<tr>
			<th style="width: 8%;"> 
				구분 
			</th> 
			<th style="width: 40%;"> 
				제목
			</th>	
			<th style="width: 10%;">
				작성자
			</th>
			<th style="width: 15%;">
				작성일
			</th>
		</tr>
		<c:if test="${count == 0}">
			<tr>
				<td colspan="6" align="center">
					글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${count != 0}">
			<c:forEach var="article" items="${anoticeArticles}">
			<c:if test="${article.a_id ne null }">
				<tr>
					<td align="center">
						* 공지 *
					</td>
					<td>
						<a href="noticeContent.do?n_id=${article.n_id}&n_pageNum=${n_pageNum}">
							&nbsp;&nbsp; ${article.n_subject}
						</a>	
					</td>
					<td align="center">
						<c:if test="${article.a_id ne null}">
							관리자
						</c:if>
					</td>
					<td align="center">
						${article.n_regdata}
					</td>
				</tr>
				</c:if>	
			</c:forEach>		
		</c:if>
	</table>
	<br>
	<c:if test="${count > 0}">
		<c:if test="${n_startPage > n_pageBlock}">
			<a href="noticeList.do">[◀◀]</a>
			<a href="noticeList.do?n_pageNum=${n_startPage-n_pageBlock}">[◀]</a>
		</c:if>
		<c:forEach var="i" begin="${n_startPage}" end="${n_endPage}">	
			<c:if test="${i == n_currentPage}">
				<b>[${i}]</b>
			</c:if>	
			<c:if test="${i != n_currentPage}">
				<a href="noticeList.do?n_pageNum=${i}">[${i}]</a>
			</c:if>	
		</c:forEach>	
		<c:if test="${n_pageCount > n_endPage}">
			<a href="noticeList.do?n_pageNum=${n_startPage + n_pageBlock}">[▶]</a>
			<a href="noticeList.do?n_pageNum=${n_pageCount}">[▶▶]</a>
		</c:if>
	</c:if>
				
				
				
</form>
</body>
</html>