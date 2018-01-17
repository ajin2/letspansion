<%@page import="after.AfterDataBean"%>
<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="setting.jsp" %>
<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css" >
<script src="<%=project%>after/script.js"></script>

<h2> <%=page_modify%> </h2>

<%
	/* int result = (Integer) request.getAttribute( "result" ); */
	int am_num = (Integer) request.getAttribute( "am_num" );
	String pageNum = (String) request.getAttribute( "pageNum" );
%>

<%
AfterDataBean afterDto = (AfterDataBean) request.getAttribute( "afterDto" );
%>
<body onload="modifyfocus()">
	<form method="post" action="modifyPro.do" name="modifyform" 
		onsubmit="return modifycheck()">

	<input type="hidden" name="am_num" value="<%=am_num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	
		<table>
			<tr>
				<th> <%=str_writer%> </th>
				<td> <%=afterDto.getM_id()%></td>
			</tr>
			<tr>
				<th> <%=str_subject%></th>
				<td>
					<input class="input" type="text" name="am_subject"
						maxlength="50" value="<%=afterDto.getAm_subject()%>"
						style="width:260px">
				</td>
			</tr>
			<tr>
				<th> <%=str_content%> </th>
				<td>
					<textarea name="am_content" rows="10" cols="35"><%=afterDto.getAm_content()%></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_mod%>">
					<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
						onclick="location='list.do?pageNum=<%=pageNum%>'">
				</th>
			</tr>
		</table>
	</form>
</body>

