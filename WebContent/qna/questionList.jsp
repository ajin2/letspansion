<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<%@ include file="setting.jsp" %>
		
		
	</head>
	<body>
		
		<form name="qlist" >
		 
		<input type="hidden" name="m_id" value="${sessionScope.memId}">
		<input type="hidden" name="a_id" value="${sessionScope.adminId}">
		<input type="hidden" name="ref" value="${article.ref}">
		<input type="hidden" name="re_step" value="${article.re_step}">
		<input type="hidden" name="q_delete" value="${article.q_delete}">
		
			<table width="1120px" border="1" >
				<tr>   
					<th colspan="4" align="right"> &nbsp;
						<c:if test="${sessionScope.memId ne null}">
							<input type="button" value="글작성" 
								onclick="location='questionWrite.do'">
						</c:if>
					</th> 
				</tr>
				<tr> 
					<th width="10%"> 카테고리 </th>
					<th width="58%"> 제목 </th>
					<th width="10%"> 작성자 </th>
					<th width="25%"> 작성일 </th>
				</tr>

	<c:if test="${count == 0}">
		<tr>
			<td colspan="6" align="center">
				글이 없습니다.
			</td>
		</tr>
	</c:if>  
	<c:if test="${count != 0}"> 
		<c:forEach var="article" items="${articles}">
		<%-- <c:if test="${article.m_id eq sessionScope.memId || article.a_id ne null}"> --%>
		
			<tr>
				
				  <c:if test="${ article.m_id eq sessionScope.memId}">
					<c:if test="${article.re_step >= 0}" > 
						<c:if test="${article.q_cate == 1}">
							<td align="center" style="background-color:purple">
							[환불/교환] 
							</td> 
						</c:if>
						<c:if test="${article.q_cate == 2}">
							<td align="center" style="background-color:aqua">
							 [예약취소]
							 </td>
						</c:if>
						<c:if test="${article.q_cate == 3}">
							<td align="center" style="background-color:magenta">
							 [픽업문의]
							 </td>
						</c:if>
						<c:if test="${article.q_cate == 4}">
							<td align="center" style="background-color:pink">
							 [기타문의]
							 </td>
						</c:if>
					</c:if>
					<%-- <c:set var="number" value="${number}"/>
					${number}
					<c:set var="number" value="${number-1}"/>
					 --%>
				
				<c:if test="${article.q_delete eq 0}">
					<td>
						<%-- <c:set var="wid" value="${(article.re_level - 1) * 10 }" /> --%>
					 
						
							<c:if test="${article.re_step > 0}" >
								&nbsp;&nbsp;&nbsp; ㄴ 답글 : &nbsp;
								<%-- <img src="${project}buy/images/re.gif" width='20' height='15'> --%>
							</c:if>
						
					 
						<%-- <c:if test="${article.re_step >= 0}" >
							<c:if test="${article.q_cate == 1}">
								&nbsp;&nbsp; [환불/교환]&nbsp;
							</c:if>
							<c:if test="${article.q_cate == 2}">
								&nbsp;&nbsp; [예약취소]&nbsp;
							</c:if>
							<c:if test="${article.q_cate == 3}">
								&nbsp;&nbsp; [픽업문의]&nbsp;
							</c:if>
							<c:if test="${article.q_cate == 4}">
								&nbsp;&nbsp; [기타문의]&nbsp;
							</c:if>
						</c:if> --%>
						
		
						<a href="questionContent.do?q_num=${article.q_num}&pageNum=${pageNum}&ref=${article.ref}&re_step=${article.re_step}">
							&nbsp;&nbsp; ${article.q_subject}
						</a>	
					</td>
				</c:if>
				<c:if test="${article.q_delete eq 1}">
					<td style="background-color:silver;">
						&nbsp;&nbsp;&nbsp; -- 삭제된 글입니다. -- 
					</td>
				</c:if>
				<c:if test="${article.a_id ne null }">
					<td align="center">
						${article.a_id}
					</td>
				</c:if>
				<c:if test="${article.a_id eq null }"> 
					<td align="center">
						${article.m_id}
					</td>
				</c:if>
				<td align="center">
					${article.q_regdate}
				</td>
			
				<%-- <c:if test="${article.q_delete eq 1}">
			 / 글이 삭제되었습니다.
				</c:if> --%>
				</c:if>
			</tr>
			<%-- </c:if> --%>
		</c:forEach>
		
		</c:if>
		
		
		 	
			</table>
		</form>
	</body>
	
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="questionList.do">[◀◀]</a>
		<a href="questionList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="questionList.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="questionList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="questionList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if> 

   
	
</html>