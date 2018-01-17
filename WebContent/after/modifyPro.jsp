<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css" >
<script src="<%=project%>after/script.js"></script>

<h2> <%=page_modify%> </h2>

<%
	/* int result = (Integer) request.getAttribute( "result" ); */
	String pageNum = (String) request.getAttribute( "pageNum" );
%>
<%
	response.sendRedirect("list.do?pageNum="+pageNum);
%>





