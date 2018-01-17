<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
	</head>
	
	<body>
		<table>
			<tr>
				<th> <jsp:include page="adminPensionMenu.jsp" flush="false"/> </th>	
				<td> <jsp:include page="adminPensionHeader.jsp" flush="false"/> </td>
			</tr>
		</table>
		<jsp:include page="adminPensionMain.jsp" flush="false"/>
	</body>
	<jsp:include page="adminPensionBottom.jsp" flush="false"/>
</html>
	