<%@page import="java.text.SimpleDateFormat"%>
<%@page import="after.AfterDataBean"%>
<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css">
<script>
	/* $(document).ready(function(){
		$.ajax({
			url: ~~~, // 자바 .do 경로
			type: ~~~
			data:~~~
			success:function(data)
			{
				$('#댓글 div').Append(
					""	
				);
			}
		});
	}); */
	/* function addComment(){
		alert("Aaa");
		var re_content = document.addForm.re_content.value;
		var params = "re_content="+ encodeURIComponent(re_content);
		alert("ccc");
		new ajax.xhr.Request('content.jsp', params, addResult, 'POST' );
	}
	function addResult( req ) {
		alert("bbb");
		if( req.readyState == 4) {
			if( req.status == 200 ){
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				
				if( code == 'success' ){
					var comment = eval( "(" +xmlDoc.getElementByTagName('data').item(0).firstChild.nodeValue + ")" );
					var listDiv = document.getElementById("commentList");
					var commentDiv = makeCommentView(comment);
					listDiv.appendChild(commentDiv);
					
					document.addForm.m_id.value = "";
					document.addForm.re_content.value = "";
					
					alert("등록했습니다!["+comment.id+"]");
				} else if( code == 'fail' ) {
					var message = xmlDoc.getElementByTagName("message").item(0).firstChild.nodeValue;
					alert("에러발생 : " + message );
				}
			} else {
				alert("서버 에러 발생 : " + req.status );
			}
		}
	} */
	var httpRequest = null;
	var number = 0;
	function insert() {
		alert("aaa");
		var params = "name=" + inputform.m_id.value
					+ "&content=" + inputform.re_content.value;
		httpRequest = new HttpRequest(insertresult, "insert.jsp", params );
		httpRequest.sendRequest();
	}
	function insertresult() {
		alert("bbb");
	}
	
	function makecomment( comment, setnumber ){
		alert("ccc");
		var newdiv = document.createElement("div");
		if( setnumber ){
			number = setnumber;
		} else {
			++number;
		}
		new div.innerHTML
		= "<table>"
		+ 	"<tr>"
		+		"<th style='width: 20px'>" + number + "</th>"
		+		"<th style='width: 50px'>" + comment.m_id + "</th>"
		+		"<td>&nbsp;" + comment.re_content + "</td>"
		+		"<th style='width: 200px'>"
		+			"<input class='inputbutton' type='button' value='수정' onclick='javascript:mod("+comment.num+")'>"
		+			"<input class='inputbutton' type='button' value='삭제' onclick='javascript:del("+comment.num+")'>"
		+		"</th>"
		+	"</tr>"
		+ "</table>";
		
		newdiv.comment = comment;
		newdiv.number = number;
		newdiv.setAttribute("m_id", "comment_" + comment.num );
		return newdiv;
	}
	
	// 글목록
	function select() {
		httpRequest = new HttpRequest(selectresult, "select.jsp");
		httpRequest.sendRequest();
	}
	function selectresult() {
		var result = document.getElementById("result");
	}
</script>

<h2> <%=page_content%> </h2>
    
<%
	int am_num = (Integer) request.getAttribute( "am_num" );
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
		<c:if test="${sessionScope.memId == afterDto.getM_id() }">
			<input class="inputbutton" type="button" value="<%=btn_modify%>"
				onclick="location='modifyView.do?am_num=<%=afterDto.getAm_num()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_delete%>"
				onclick="location='deletePro.do?am_num=<%=afterDto.getAm_num()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
				onclick="location='list.do?pageNum=<%=pageNum%>'">
		</c:if>
		<c:if test="${sessionScope.memId != afterDto.getM_id() }">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
				onclick="location='list.do?pageNum=<%=pageNum%>'">
		</c:if>
		</th>
	</tr>
</table>

<!--  댓글 시작  -->
<%-- <form method="post" name="replyform" action="reply.do">
	<input type="hidden" name="am_num" value="<%=am_num%>">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table style="width:100%;">
		<tr>
			<th> 아이디 </th>
			<td> <input type="text" name="m_id" value="${sessionScope.memId}" readonly>
		</tr>
		<tr>
			<th style="width: 20%;"> 댓글 </th>
			<td>
				<textarea name="re_content" rows="4" cols="34" style="width:90%;"></textarea>
				<input class="inputbutton" type="submit" name="reply_save" value="저장" style="width: 70px; height: 30px; position:relative; right:-10px; top:-25px; ">
			</td>
		</tr>
	</table>
</form>
<div id="reply_div">
<c:set var="counting" value="0"/>

</div> --%>

<%-- <div id="commentAdd">
	<form action="reply.do" name="addForm">
		<table border="1">
			<tr>
				<th> 아이디 </th>
				<td> <input type="text" name="m_id" value="${sessionScope.memId}" size="10" readonly> </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea name="re_content" cols="20" rows="2"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="등록" onclick="addComment()">
				</th>
			</tr>
		</table>
	</form>
</div>

<div id="commentUpdate" style="display:none">
	<form action="replyUpdate" name="updateForm">
		<input type="hidden" name="am_num" value="<%=am_num%>"/>
		이름 : <input type="text" name="name" size="10"> <br/>
		내용 : <textarea name="re_content" cols="20" rows="2"></textarea><br/>
		<input type="button" value="등록" onclick="updateComment()">
		<input type="button" value="취소" onclick="cancelUpdate()">
	</form>
</div> --%>

<body onload="select()">

	<!-- 글 작성 -->
	<hr color="red" size="2" align="left" width="50%">
	<form name="inputform">
		<table>
			<tr>
				<th> 이름 </th>
				<td> <input class="input" type="text" name="m_id" value="${sessionScope.memId}" readonly> </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td>
					&nbsp;<textarea name="re_content" rows="3" cols="21"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="button" value="작성" onclick="insert()">
					<input class="inputbutton" type="reset" value="취소">
				</th>
			</tr>
		</table>
	</form>
	<br><br>
	
	<hr color="red" size="2" align="left" width="50%">
	<div id="result"></div>
	
	
	<!-- 글 목록 -->
	<div id="listcomment">
	</div>
	<br><br>
</body>
<!-- 댓글 끝 -->












