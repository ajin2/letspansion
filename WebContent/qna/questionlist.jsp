<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">	
		<%@ include file="setting.jsp" %>
	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="css/boards.css"/>
	</head>


<body id="talk">
    <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span> 문의함 </span></h3></div>
      <div class="board">
      <div class="snb">
      <div class="center">
		<form name="qlist">
		 
		<input type="hidden" name="m_id" value="${sessionScope.memId}">
		<input type="hidden" name="a_id" value="${sessionScope.adminId}">
		<input type="hidden" name="ref" value="${article.ref}">
		<input type="hidden" name="re_step" value="${article.re_step}">
		<input type="hidden" name="q_delete" value="${article.q_delete}">
		
			<table class='table table-striped table-bordered table-hover' width="900px" border="1" >
				<!-- <colgroup>
						<col width="10%" align="center"/>
						<col width="*" />
						<col width="15%" />
						<col width="10%" />
				</colgroup>
				<thead>
					<th> 구분 </th>
					<th> 제목 </th>
					<th> 날짜 </th>
					<th> 작성자 </th>
				</thead> -->
				
				<tr style="height:40px">  
					<th width="10%" style="text-align:center; font-size:15px;"> 카테고리 </th>
					<th width="58%" style="text-align:center; font-size:15px;"> 제목 </th>
					<th width="10%" style="text-align:center; font-size:15px;"> 작성자 </th>
					<th width="25%" style="text-align:center; font-size:15px;"> 작성일 </th>
				</tr>
 
	<c:if test="${count == 0}">
		<tr style="height:30px">
			<td colspan="6" align="center">
				글이 없습니다.
			</td>
		</tr>
	</c:if>  
	<c:if test="${count != 0}"> 
		<c:forEach var="article" items="${articles}">
		<%-- <c:if test="${article.m_id eq sessionScope.memId || article.a_id ne null}"> --%>
		
			<tr style="height:30px">
				
				  <%-- <c:if test="${ article.m_id eq sessionScope.memId || article.a_id eq sessionScope.adminId}"> --%>
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
					<td >
						 <c:set var="wid" value="${(article.re_level - 1) * 10 }" /> 

							<c:if test="${article.re_step > 0}" >
								&nbsp;&nbsp;&nbsp; ㄴ Re : &nbsp;
							</c:if>

						<a style="text-decoration:none;" href="questionContent.do?q_num=${article.q_num}&pageNum=${pageNum}&ref=${article.ref}&re_step=${article.re_step}">
							&nbsp;&nbsp; ${article.q_subject}
						</a>	
					</td>
				</c:if>
				<c:if test="${article.q_delete eq 1}">
					<td style="color:silver;">
						&nbsp; <img src="${project}qna/image/delete.png" width='25' height='25'> &nbsp; 삭제된 게시글입니다.
					</td>
				</c:if>
				
				<c:if test="${article.m_id eq null }">
					<td align="center">
						${article.a_id}
					</td>
				</c:if>
				<c:if test="${article.m_id ne null }"> 
					<td align="center">
						${article.m_id}
					</td>
				</c:if>
				<td align="center">
					<fmt:formatDate value="${article.q_regdate}" type="both" pattern="yyyy-MM-dd" />
				</td>
				
			
				<%-- <c:if test="${article.q_delete eq 1}">
			 / 글이 삭제되었습니다.
				</c:if> --%>
				<%-- </c:if> --%>
			</tr>
			<%-- </c:if> --%>
		</c:forEach>
		
		</c:if>
		 	
			</table>
		</form>
<br>

	<c:if test="${sessionScope.memId ne null}">
		<input class="btn btn-success" type="button" value="문의하기" 
			onclick="location='questionWrite.do'"> &nbsp;&nbsp;&nbsp;
	</c:if> 


<br><br><br><br>
	
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="questionlist.do">[◀◀]</a>
		<a href="questionlist.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="questionlist.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="questionlist.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="questionlist.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if> 
 

</div>
</div>
</div>
</div>
</body>

<jsp:include page="/home/pensionBottom.jsp" flush="false"/>

</html>
