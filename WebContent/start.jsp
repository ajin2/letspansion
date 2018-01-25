<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
서버정보 
<%=application.getServerInfo() %>
<br>
서블릿정보
<%=application.getMajorVersion()%>.<%= application.getMinorVersion() %>
<br>
JSP정보
<%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
<br>

<br>

<br>

<br>

<br>

<br>

<br>

<br>