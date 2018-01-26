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
	<center>
<body id="talk">
    <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span> 공지사항 </span></h3></div>
      <div class="board">
      <div class="snb">
      <div class="center">
		<input type="hidden" name="m_id" value="${sessionScope.memId}">
	<form>

	 <c:if test="${sessionScope.memId ne null}">
		<input class="btn btn-info" type="button" value="문의하기" onclick="location='questionWrite.do'">
		<input class="btn btn-info" type="button" value="문의함" onclick="location='questionlist.do'">
	</c:if>  
	
	<br><br><br>
	
	<table border="1" width="800px">

		<tr style="height:40px"> 
			<th style="width: 8%; text-align:center; font-size:18px;"> 
				구분 
			</th> 
			<th style="width: 40%; text-align:center; font-size:18px;"> 
				제목  
			</th>	
			<th style="width: 10%; text-align:center; font-size:18px;">
				작성자
			</th> 
			<th style="width: 15%; text-align:center; font-size:18px;">
				작성일
			</th>
		</tr>
		<c:if test="${count == 0}">
			<tr style="height:30px">
				<td colspan="6" align="center">
					글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${count != 0}">
			<c:forEach var="article" items="${anoticeArticles}">
			<c:if test="${article.a_id ne null }">
				<tr style="height:30px">  
					<td align="center" style="color:gray;">
						* 공지 *
					</td>
						<c:if test="${article.n_delete eq 1}">
							<td style="color:silver;"> 
								&nbsp; <img src="${project}notice/image/delete.png" width='25' height='25'>삭제된 게시글입니다.
							</td>
						</c:if> 
						<c:if test="${article.n_delete eq 0}"> 
							<td>
							<a href="noticeContent.do?n_id=${article.n_id}&n_pageNum=${n_pageNum}" style="color:gray; text-decoration:none;">
								&nbsp;&nbsp; ${article.n_subject}
							</a>
							</td>
						</c:if>
					<td align="center" style="color:gray;"> 
						<c:if test="${article.a_id ne null}">
							관리자
						</c:if>
					</td> 
					<td align="center" style="color:gray;">
						<fmt:formatDate value="${article.n_regdata}" type="both" pattern="yyyy-MM-dd" />
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

</div>
</div>
</div>
</div>
</body>
</center> 

</html>