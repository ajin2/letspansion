<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<center>
<html>

	<head>
		<meta charset="UTF-8">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 <script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
		 <script type="text/javascript" src="js/jquery-ui.js"></script>
	     <link rel="stylesheet" type="text/css" href="css/boards.css"/>
		<h3> 공지사항 </h3>
	</head>
	
	<body>
		
				<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
		
		<form method="post" action="adminNoticeModifyPro.do" name="noticeModifyForm" 
			onsubmit="return noticewritecheck()">
			
			<input type="hidden" name="n_id" value="${n_id}">
			<input type="hidden" name="a_id" value="${sessionScope.adminId}">
			<input type="hidden" name="n_pageNum" value="${n_pageNum}" />
			
			<table border="1">
				<tr>
					<th> 제목 </th>
					<td> <input type="text" name="n_subject" value="${nDto.n_subject}" maxlength="50" 
						style="width:446px"> </td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td> <textarea name="n_content" rows="10" cols="58" >${nDto.n_content}</textarea> </td>
				</tr>
				<br><br>
				<tr>
					<th colspan="2">
						<input type="submit" value="작성">
						<input type="button" value="취소" 
							onclick="location='adminNoticeList.do?n_pageNum=${n_pageNum}'">
					</th> 
				</tr>
			</table>
		</form>
	
	</body>
	
</html>
	</center>