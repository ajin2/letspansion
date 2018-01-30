<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="${project}js/request.js"></script>
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
					<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
				</tr>
			</table>
			<div class="w3-container w3-teal">
				<h1>관리자 Let's Pension</h1>
			</div>
	
			<div class="w3-row-padding w3-margin-top">
				<c:forEach var="picture" items="${pictures}" varStatus="status">
					<c:if test="${picture.r_id != null }">	
						<div class="w3-third ">
							<div class="w3-card w3-round" style="width:80%; height:300px; margin-left:20%; margin:5px;">				<!-- class="w3-round" 사진 살짝 둥글게 -->
								<img src="${project}roomupload/${picture.pic_sys}" class="w3-round" style="width: 100%; height:250px; cursor:pointer" onclick="location='adminRoomDetail.do?r_id=${picture.r_id}'">
								<div class="w3-container">
									<h4>${roomDto[status.index].r_name}</h4>
								</div>
							</div>
						</div>
					</c:if>	
				</c:forEach>
			</div>
		</body>
	</c:if>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>
	