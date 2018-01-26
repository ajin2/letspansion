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
	<form>
		<input type="hidden" name="n_id" value="${nDto.n_id}">
		<input type="hidden" name="n_pageNum" value="${n_pageNum}">
		<input type="hidden" name="a_id" value="${nDto.a_id}">
	
		
		<table width="700px" border="1">
				<tr>
					<th style="text-align:center;"> 제목 </th>
					<td colspan="3"> &nbsp;&nbsp; ${nDto.n_subject} </td>
				</tr>
				<tr>
					<th style="text-align:center;"> 작성자 </th>
					<td> 
						&nbsp;&nbsp; ${nDto.a_id}
					</td>
					<th style="text-align:center;"> 작성일 </th>
					<td>
						&nbsp;&nbsp; 
						<fmt:formatDate value="${nDto.n_regdata}" type="both" pattern="yyyy-MM-dd HH:mm" />
					</td>
				</tr>
			
			</table> 
			
			<br><br><br>
			
			${nDto.n_content}
			
			<br><br><br>

		<input class="btn btn-info" type="button" value="목록"
				onclick="location='noticeList.do?n_pageNum=${n_pageNum}'">
</form>
	</div>
	</div>
	</div>
	</div>
	</body>
	
</html>