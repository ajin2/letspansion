<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>after/script.js"></script>    

<h2> <%=page_delete%> </h2>

<%
	/* int resultCheck = (Integer) request.getAttribute( "resultCheck" ); */
	String pageNum = (String) request.getAttribute( "pageNum" );
%>

<%
	response.sendRedirect( "list.do?pageNum=" + pageNum );
%>











