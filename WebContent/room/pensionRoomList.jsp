<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<jsp:include page="/home/pensionHeader.jsp" flush="false"/>	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	<body>
	<br><br><br><h2> Let's Pension 방 소개 </h2><br><br><br><br>
	
		<div class="w3-row-padding w3-margin-top">
			<c:forEach var="picture" items="${pictures}" varStatus="status">
				<div class="w3-third ">
					<div class="w3-card w3-round">				<!-- class="w3-round" 사진 살짝 둥글게 -->
						<img src="${project}roomupload/${picture.pic_sys}" class="w3-round" style="width: 100%; cursor:pointer" onclick="location='pensionRoomDetail.do?r_id=${picture.r_id}'">
						<div class="w3-container">
							<h4>${roomDto[status.index].r_name}</h4>
						</div>
					</div>
				</div>
				<c:if test="${(picture.r_id % 3) == 0}"> 
					<br><br><br><br><br><br><br><!-- <br><br><br><br><br><br><br><br><br><br><br> -->
				</c:if>
			</c:forEach>
		</div>
	</body>
	<jsp:include page="/home/pensionBottom.jsp" flush="false"/>
</html>

