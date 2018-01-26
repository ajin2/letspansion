<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
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
			<table>
				<tr>
					<th> <jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/> </th>	
					<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
				</tr>
			</table>
			<div class="w3-container w3-teal">
				<h1>관리자 Let's Pension</h1>
			</div>
	
			<div class="w3-row-padding w3-margin-top">
				<c:forEach var="picture" items="${pictures}" varStatus="status">
					<c:if test="${picture.pic_sys != null }">	
						<div class="w3-third ">
							<div class="w3-card w3-round">				<!-- class="w3-round" 사진 살짝 둥글게 -->
								<img src="${project}roomupload/${picture.pic_sys}" class="w3-round" style="width: 100%; cursor:pointer" onclick="location='adminRoomDetail.do?r_id=${picture.r_id}'">
								<div class="w3-container">
									<h4>${roomDto[status.index].r_name}</h4>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${picture.pic_sys == null }">		<!-- "방어코드" 방에 등록된 사진이 없다면 사진 등록하러 가기 -->
						<input type="button" value="${roomDto[status.index].r_name} 방 사진 등록하러 가기" onclick="location='adminRoomDetail.do?r_id=${picture.r_id}'">
					</c:if>	
					<c:if test="${(picture.r_id % 3) == 0}"> 
						<br><br><br><br><br><br><br><!-- <br><br><br><br><br><br><br><br><br><br><br> -->
					</c:if>
				</c:forEach>
			</div>
		</body>
	</c:if>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>
	