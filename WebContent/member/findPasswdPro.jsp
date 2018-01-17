<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

    <h2> ${page_input} </h2><hr>
    
	<c:if test="${result == 0}">
    	<script type="text/javascript">
    	<!--
    		erroralert(finderror);
    	//-->
    	</script>
    </c:if>
    <c:if test="${result != 0}">
    	<c:redirect url="logonMain.do">
    	</c:redirect>
	</c:if>    