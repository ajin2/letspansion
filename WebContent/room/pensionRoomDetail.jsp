<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="css/boards.css" />
	<script src="${project}room/script.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<body id="talk">
		<div class="talk">
			<jsp:include page="/home/pensionHeader.jsp" flush="false" />
			<div class="top_bg">
				<h3>
					<span> </span>
				</h3>
			</div>
			<div class="board">
				<div class="snb">
					<div class="center"></div>
				</div>
			</div>
		</div>
		<table class='table table-striped table-bordered table-hover' style="width:70%;">
			<tr> 
				<th> &nbsp;${str_roomName} : </th>
				<td> ${roomDto.r_name}</td>
				<td rowspan="4" width=100><!-- 360 picture -->
					<input type="button" value="${btn_room360}" onclick="location='pensionRoom360.do?r_id=${r_id}'">
				</td>
			</tr>
			<tr> 
				<th> ${str_person} : </th>
				<td> ${roomDto.r_minperson} ~ ${roomDto.r_maxperson} </td>
			</tr>
			<tr>
				<th> ${str_price} : </th>
				<td> ${roomDto.r_price} 원 </td>
			</tr>
			<tr>
				<th> ${str_content} : </th>
				<td> ${roomDto.r_content} </td>
			</tr>
		</table>
		<br><br><br>
		
		<div class="w3-content w3-display-container" style="max-width: 50%">
			<!-- Main Picture -->
			<c:forEach var="picture" items="${pictures}">			
				<img class="mySlides" src="${project}roomupload/${picture.pic_sys}" style="width: 100%; height:450px">
			</c:forEach>
			
			<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  			<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
			
			<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width: 100%">
				<c:forEach var="i" begin="1" end="${countPicture}">
					<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(${i})"></span>
				</c:forEach>
			</div>
		</div>
		<!-- Small Picture -->
		<div class="w3-row-padding w3-section" style="max-width: 100%; max-height: 100%">
			<c:forEach var="picture" items="${pictures}" begin="0" end="${countPicture}" varStatus="status">
				<div class="w3-col s4">
					<img class="demo w3-opacity w3-hover-opacity-off" src="${project}/roomupload/${picture.pic_sys}" style="width: 70%; height:30%; margin-left:10%; margin:10px;" onclick="currentDiv(${status.count})">
				</div>
			</c:forEach>
		</div>
	</body><br><br><br><br><br>
	<jsp:include page="/home/pensionBottom.jsp" flush="false"/>
	
	<script>
		//
		showDivs(slideIndex);
		//
	</script>
</html>


