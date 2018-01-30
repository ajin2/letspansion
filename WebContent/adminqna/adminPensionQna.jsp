<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
	</head> 
	<body>
		<h2> </h2>
		<%-- <jsp:include page="${project}adminPensionHeader.jsp" flush="false"/>	
		<jsp:include page="${project}adminPensionMenu.jsp" flush="false"/> --%>
		
		<table>
			<tr>
				<th> <jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/> </th>	
				<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
			</tr>
		</table>
		
		<br><br><br>

		<form name="qlist">
		 
		<input type="hidden" name="a_id" value="${sessionScope.adminId}">
		<input type="hidden" name="ref" value="${article.ref}">
		<input type="hidden" name="re_step" value="${article.re_step}">
		<input type="hidden" name="q_delete" value="${article.q_delete}">
		
			<table width="800px" border="1" >
				<tr>   
					 
				</tr>
				<tr> 
					<th width="10%"> 구분 </th>
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
				<tr>
					<c:if test="${article.re_step >= 0}" > 
						<c:if test="${article.q_cate == 1}">
							<td align="center" style="color:#0064CD;">
								[환불/교환] 
							</td> 
						</c:if>
						<c:if test="${article.q_cate == 2}">
							<td align="center" style="color:#483D8B;">
								 [예약취소]
							 </td>
						</c:if>
						<c:if test="${article.q_cate == 3}">
							<td align="center" style="color:#0000CD;">
								 [픽업문의]
							 </td>
						</c:if>
						<c:if test="${article.q_cate == 4}">
							<td align="center" style="color:#000069;">
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
					
						<c:if test="${article.a_id ne null}">
							<c:if test="${article.re_level > 0}" >
								&nbsp;&nbsp;&nbsp; ㄴ 답글 : &nbsp;
								<%-- <img src="${project}buy/images/re.gif" width='20' height='15'> --%>
							</c:if>
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
						
		
						<a href="adminQuestionContent.do?q_num=${article.q_num}&pageNum=${pageNum}">
							&nbsp;&nbsp; ${article.q_subject}
						</a>	
					</td>
				</c:if>
				<c:if test="${article.q_delete eq 1}">
					<td>
						&nbsp;&nbsp;&nbsp; -- 삭제된 글입니다. -- 
					</td>
				</c:if>
				<c:if test="${article.a_id ne null }">
					<td align="center">
						관리자 (${article.a_id})
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
			</tr>
		</c:forEach>
		
		</c:if>
		
		
		 	
			</table>
		</form>
	</body>
	
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="adminQuestionlist.do">[◀◀]</a>
		<a href="adminQuestionlist.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="adminQuestionlist.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="adminQuestionlist.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="adminQuestionlist.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if> 
		
		<%-- <jsp:include page="${project}adminPensionBottom.jsp" flush="false"/> --%>
</html>
	