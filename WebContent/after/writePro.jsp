<%@page import="after.AfterDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>after/script.js"></script>

<h2> <%=page_write%> </h2>

<%
	int result = (Integer) request.getAttribute( "result" );
%>

<%
	if( result == 0 ) {
		// 작성 실패
		%>
		<script type="text/javascript">
			<!--
			erroralert( writeerror );
			//-->
		</script>
		<%
	} else {
		// 작성 성공
		response.sendRedirect( "list.do" );
	}
%>
	














