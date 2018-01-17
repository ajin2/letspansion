<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<c:if test="${(sessionScope.adminId == null || sessionScope.adminId == '')}">
		<script type="text/javascript">
		//<!--
           var returnValue = alert(adminloginerror);
           if(returnValue == true){
              window.location.href = "adminPensionHome.do";
           } else {
              window.location.href = "adminPensionHome.do";
           }
        //-->
        </script>
	</c:if>
	
	<c:if test="${sessionScope.adminId != null}">
		<body>
			<div class="w3-container w3-teal">
				<h1>관리자 Let's Pension</h1>
			</div>
	
			<div class="w3-row-padding w3-margin-top">
				<div class="w3-third">
					<div class="w3-card">
						<img src="img/roomImg/A_1.jpg" class="w3-round" style="width: 100%" onclick="location='adminRoomDetail.do?r_id=1'">
						<div class="w3-container">
							<h4>A Room</h4>
						</div>
					</div>
				</div>
				<div class="w3-third">
					<div class="w3-card">
						<img src="img/roomImg/B_1.jpg" style="width: 100%" onclick="location='adminRoomDetail.do?r_id=2">
						<div class="w3-container">
							<h4>B Room</h4>
						</div>
					</div>
				</div>
				<div class="w3-third">
					<div class="w3-card">
						<img src="img/roomImg/C_1.jpg" style="width: 100%" onclick="location='adminRoomDetail.do?r_id=3">
						<div class="w3-container">
							<h4>C Room</h4>
						</div>
					</div>
				</div>
			</div>
			
			<div class="w3-row-padding w3-margin-top">
				<div class="w3-third">
					<div class="w3-card">
						<img src="img/roomImg/D_1.jpg" style="width: 100%" onclick="location='pensionRoomD.do'">
						<div class="w3-container">
							<h4>D Room</h4>
						</div>
					</div>
				</div>
				<div class="w3-third">
					<div class="w3-card">
						<img src="img/roomImg/E_1.jpg" style="width: 100%" onclick="location='pensionRoomE.do'">
						<div class="w3-container">
							<h4>E Room</h4>
							놀아볼까
						</div>
					</div>
				</div>
				<div class="w3-third">
					<div class="w3-card">			<!-- class="w3-round" 사진 살짝 둥글게 -->
						<img src="img/roomImg/Q_1.jpg" class="w3-round" style="width: 100%" onclick="location='adminRoomDetail.do?r_id=6'"> 
						<div class="w3-container">
							<h4>편의시설</h4>
						</div>
					</div>
				</div>	
			</div>
		</body>
	</c:if>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>
	