<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<script src="${project}adminnotice/script.js"></script>
		
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 <script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
		 <script type="text/javascript" src="js/jquery-ui.js"></script>
	     <link rel="stylesheet" type="text/css" href="css/boards.css"/>
	     
		<h3 align="center"> 글 읽기 </h3>
	</head>
	<body>
	<table>
			<tr>
				<th> <jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/> </th>	
				<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
			</tr>
		</table>
	
	<form>
		<input type="hidden" name="n_id" value="${nDto.n_id}">
		<input type="hidden" name="n_pageNum" value="${n_pageNum}">
		<input type="hidden" name="a_id" value="${nDto.a_id}">
	
	
		<table border="1" width="800px">
	<tr>
		<th style="width: 10%"> 작성자 </th>
		<td style="width: 10%" align="center"> 
			${a_id} 
		</td>
	</tr>
	<tr>
		<th> 작성일 </th>
		<td align="center">
			${nDto.n_regdata}		
		</td>
	</tr>
	<tr>
		<th> 제목 </th>
		<td colspan="2">
			${nDto.n_subject}
		</td>
	</tr>
	<tr>
		<th> 내용 </th>
		<td colspan="3">
			${nDto.n_content}
		</td>
	</tr>

</table>
		<c:if test="${nDto.a_id eq sessionScope.adminId}">
			<input class="inputbutton" type="button" value="수정"
				onclick="location='adminNoticeModify.do?n_id=${nDto.n_id}&n_pageNum=${n_pageNum}'">
			<input class="inputbutton" type="button" value="삭제"
				onclick="adminDel('${nDto.n_id}','${n_pageNum}')">
		</c:if>	
		<input class="inputbutton" type="button" value="목록"
				onclick="location='adminNoticeList.do?n_pageNum=${n_pageNum}'">
</form>
	</body>
</html>