<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
		<h3> 공지사항 </h3>
	</head>
	<body> 
		
	
		<input type="hidden" name="a_id" value="${sessionScope.adminId}">
	<form>
		
	
		<!-- <a href="questionWrite.do"> 문의하기 </a> <br> -->
		<a href="adminQuestionList.do"> 문의함 </a> <br>

	  
	<table border="1">
		<c:if test="${sessionScope.adminId ne null}">
		<tr>
		 	<th colspan="4" align="right">
				<input type="button" value="글작성" onclick="location='adminNoticeWrite.do'">
			</th> 
		</tr>
		</c:if>
		
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
					<c:if test="${article.n_delete eq 0 }">
						<a href="adminNoticeContent.do?n_id=${article.n_id}&n_pageNum=${n_pageNum}">
							&nbsp;&nbsp; ${article.n_subject}
						</a>
					</c:if>
					<c:if test="${article.n_delete eq 1 }">
						&nbsp;&nbsp;&nbsp; -- 삭제된 글입니다. --
					</c:if>
					</td>
					<td align="center">
						<c:if test="${article.a_id ne null}">
							관리자(${article.a_id}) 
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
			<a href="adminNoticeList.do">[◀◀]</a>
			<a href="adminNoticeList.do?n_pageNum=${n_startPage-n_pageBlock}">[◀]</a>
		</c:if>
		<c:forEach var="i" begin="${n_startPage}" end="${n_endPage}">	
			<c:if test="${i == n_currentPage}">
				<b>[${i}]</b>
			</c:if>	
			<c:if test="${i != n_currentPage}">
				<a href="adminNoticeList.do?n_pageNum=${i}">[${i}]</a>
			</c:if>	
		</c:forEach>	
		<c:if test="${n_pageCount > n_endPage}">
			<a href="adminNoticeList.do?n_pageNum=${n_startPage + n_pageBlock}">[▶]</a>
			<a href="adminNoticeList.do?n_pageNum=${n_pageCount}">[▶▶]</a>
		</c:if>
	</c:if>
				
				
				
</form>
</body>
</html>