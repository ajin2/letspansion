<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<script src="${project}adminroom/script.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<body>
		<table>
			<tr>
				<th> <jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/> </th>	
				<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
			</tr>
		</table>
	
		<table border="1">
			<tr>
					<th colspan="2"> <input type="button" value="${btn_roomPictureModi}" onclick="location='adminRoomModi.do?r_id=${r_id}'"> </th>
			</tr>
			<tr> 
				<th> ${str_roomName} : </th>
				<td> ${roomDto.r_name}</td>
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
		
		<!-- 360 picture -->
		<input type="button" value="${btn_room360}" onclick="location='adminRoom360.do?r_id=${r_id}'">
		
		<div class="w3-content w3-display-container" style="max-width: 80%">
			<!-- Main Picture -->
			<c:forEach var="picture" items="${pictures}">			
				<img class="mySlides" src="${project}roomupload/${picture.pic_sys}" style="width: 100%; height:400px">
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
		<div class="w3-row-padding w3-section">
			<c:forEach var="picture" items="${pictures}" begin="0" end="${countPicture}" varStatus="status">
				<div class="w3-col s4">
					<img class="demo w3-opacity w3-hover-opacity-off" src="${project}/roomupload/${picture.pic_sys}" style="width: 100%; height:100px" onclick="currentDiv(${status.count})">
				</div>
				<c:if test="${(status.count % 3) == 0}"> 
					<br><br><br>
				</c:if>
			</c:forEach>
		</div>
	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
	
	<script type="text/javascript">
		//<!--
		showDivs(slideIndex);
		//-->
	</script>
</html>


