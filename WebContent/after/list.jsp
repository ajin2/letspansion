<%@page import="java.text.SimpleDateFormat"%>
<%@page import="after.AfterDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp"%>
		
	<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="css/boards.css"/>

</head>
<%
	int count = (Integer) request.getAttribute( "count" );

	String pageNum = (String) request.getAttribute( "pageNum" );
	int currentPage = (Integer) request.getAttribute( "currentPage" );
	int pageBlock = (Integer) request.getAttribute( "pageBlock" );
	int number = (Integer) request.getAttribute( "number" );
	int startPage = (Integer) request.getAttribute( "startPage" );
	int endPage = (Integer) request.getAttribute( "endPage" );
	int pageCount = (Integer) request.getAttribute( "pageCount" );
	
%>
	<body onload="inputfocus()" id="talk">
    <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span>후기</span></h3></div>
      <div class="board">
      <div class="snb">
      <div class="center">

<h2> <%=page_list%> ( <%=str_count%> : <%=count%> ) </h2>

<table>
	<tr>
		<th colspan="6" align="right">
			<a href="writeForm.do">
				<%=str_write%>
			</a>&nbsp;&nbsp;&nbsp;
		</th> 
	</tr>
	<tr>
		<th style="width: 8%;"> 
			<%=str_num%> 
		</th>
		<th style="width: 40%;"> 
			<%=str_subject%>
		</th>	
		<th style="width: 10%;">
			<%=str_writer%>
		</th>
		<th style="width: 15%;">
			<%=str_reg_date%>
		</th>
		<th style="width: 8%;">
			<%=str_readcount%>
		</th>
	</tr>
	<%
		if( count == 0 ) {
			// 글이 없는 경우
			%>
			<tr>
				<td colspan="6" align="center">
					<%=msg_list_x%>
				</td>
			</tr>
			<%
		} else {
			// 글이 있는 경우
			 ArrayList<AfterDataBean> articles
				= (ArrayList<AfterDataBean>) request.getAttribute( "articles" );
			
			for( int i=0; i<articles.size(); i++ ) {
				AfterDataBean article = articles.get(i);
				%>
				<tr>
					<td align="center">
						<%=number--%>	
					</td>
					<td align="center">
						<a href="content.do?am_num=<%=article.getAm_num()%>&pageNum=<%=pageNum%>">
							<%=article.getAm_subject()%>
						</a>
					</td>
					<td align="center">
						<%=article.getM_id()%>
					</td>
					<td align="center">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
						%>
						<%=sdf.format( article.getAm_reg_date() )%>
					</td>
					<td align="center">
						<%=article.getAm_readcount() %>
					</td>
				</tr>	
				<%
			}		
		}	
	%>	
	
</table>
<br>
<%
	if( count > 0 ) {
		
		// [◀◀]	처음
		// [▶▶]	끝
		
		if( startPage > pageBlock ) {
			%>
			<a href="list.do">[◀◀]</a>
			<a href="list.do?pageNum=<%=startPage-pageBlock%>">[◀]</a>
			<%
		}
		
		for( int i=startPage; i<=endPage; i++ ) {
			if( i == currentPage ) {
				%>
				<b>[<%=i%>]</b>
				<%				
			} else {
				%>
				<a href="list.do?pageNum=<%=i%>">[<%=i%>]</a>
				<%
			}
		}
		
		if( pageCount > endPage ) {
			%>
			<a href="list.do?pageNum=<%=startPage + pageBlock%>">[▶]</a>
			<a href="list.do?pageNum=<%=pageCount%>">[▶▶]</a>
			<%
		}
		
	}
%>

</div></div></div></div>

</body>


