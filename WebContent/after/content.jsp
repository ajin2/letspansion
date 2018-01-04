<%@page import="java.text.SimpleDateFormat"%>
<%@page import="after.AfterDataBean"%>
<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css">

<h2> <%=page_content%> </h2>
    
<%
	String pageNum = (String) request.getAttribute( "pageNum" );
	AfterDataBean afterDto = (AfterDataBean) request.getAttribute( "afterDto" );
%>

<table>
	<tr>
		<th style="width: 10%"> <%=str_writer%> </th>
		<td style="width: 10%" align="center"> 
			<%=afterDto.getM_id()%> 
		</td>
		<th style="width: 10%"> <%=str_readcount%> </th>
		<td style="width: 10%" align="center"> 
			<%=afterDto.getAm_readcount()%> 
		</td>
	</tr>
	<tr>
		<th> <%=str_reg_date%> </th>
		<td align="center">
			<%
				SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
			%>
			<%=sdf.format( afterDto.getAm_reg_date() )%>
		</td>
	</tr>
	<tr>
		<th> <%=str_subject%> </th>
		<td colspan="3">
			<%=afterDto.getAm_subject()%>
		</td>
	</tr>
	<tr>
		<th> <%=str_content%> </th>
		<td colspan="3">
			<pre><%=afterDto.getAm_content()%></pre>
		</td>
	</tr>
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="<%=btn_modify%>"
				onclick="location='modifyForm.do?num=<%=afterDto.getAm_num()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_delete%>"
				onclick="location='deleteForm.do?num=<%=afterDto.getAm_num()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_reply%>"
				onclick="location='writeForm.do?num=<%=afterDto.getAm_num()%>'">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
				onclick="location='list.do?pageNum=<%=pageNum%>'">			
		</th>
	</tr>

</table>



