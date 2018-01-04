<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css">
<script src="<%=project%>after/script.js"></script>

<h2> <%=page_write%> </h2>

<%
	int am_num = (Integer) request.getAttribute( "am_num" );
	/* int ref = (Integer) request.getAttribute( "ref" );
	int re_step = (Integer) request.getAttribute( "re_step" );
	int re_level = (Integer) request.getAttribute( "re_level" ); */
%>

<body onload="writefocus()">
	<form method="post" action="writePro.do"
	 	name="writeform" onsubmit="return writecheck()">
	 	
	 	<input type="hidden" name="am_num" value="<%=am_num%>">
	 	<%-- <input type="hidden" name="ref" value="<%=ref%>">
	 	<input type="hidden" name="re_step" value="<%=re_step%>">
	 	<input type="hidden" name="re_level" value="<%=re_level%>"> --%>
	 	
		<table>
			<tr>
				<th colspan="2" align="right">
					<a href="list.jsp"><%=str_list%></a>&nbsp;&nbsp;&nbsp;
				</th> 
			</tr>
			<tr>
				<th> <%=str_writer%> </th>
				<td>
					<input class="input" type="text" name="m_id" maxlength="10">
				</td>
			</tr>
			<tr>
				<th> <%=str_subject%> </th>
				<td>
					<input class="input" type="text" name="am_subject"
						maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th> <%=str_content%> </th>
				<td>
					<textarea name="am_content" rows="10" cols="38"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">	
					<input class="inputbutton" type="submit" value="<%=btn_write%>">
					<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_list%>"
						onclick="location='list.do'">
				</th>
			</tr>
		</table>	
	</form>
</body>
    
    
    
    
    
    
    
    
    
    
    