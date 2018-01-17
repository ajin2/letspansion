<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=UTF-8">
		<%@ include file="setting.jsp"%>
		<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css">
		<script src="<%=project%>after/script.js"></script>
		
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

		<!-- include summernote css/js-->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
		

		<script type="text/javascript">
			$(document).ready(
				function () {
					$('#summernote').summernote({
				        height : 350,
				        onImageUpload : function(files, editor, welEditable) {
				            sendFile(files[0], editor, welEditable);
				        },
				        lang : 'ko-KR',
			        	height : 300,
						minHeight : null,
						maxHeight : null,
						focus : true
				    });
					
					$('#summernote').summernote();
					
					/*  $('#summernote').summernote({ // summernote를 사용하기 위한 선언
		                 	height: 400,
						    onImageUpload: function(files, editor, welEditable) {
						    	sendFile(files[0], editor, welEditable);
							}
						}); */
					
					/* function sendFile(file, editor, welEditable) {
						var data = new FormData();

				        data.append("file", file);

				        $.ajax({
				            type: "post",
				            cache: false,
				            contentType:false,
				            processData: false,
				            url: 'uploadImage',
				            data: data,
				            success: function(data) {
								editor.insertImage(welEditable, data);
				            },
				         });
				     } */
				}
			);
		</script>
	</head>
	<body onload="writefocus()">
		<h2> <%=page_write%> </h2>
		
		<%
		int am_num = (Integer) request.getAttribute( "am_num" );
		/* int ref = (Integer) request.getAttribute( "ref" );
		int re_step = (Integer) request.getAttribute( "re_step" );
		int re_level = (Integer) request.getAttribute( "re_level" ); */
		%>
		
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
							<input class="input" type="text" name="m_id" value="${sessionScope.memId}" maxlength="10" readonly>
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
							<textarea name="am_content" id="summernote" value=""></textarea>
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
</html>






    
    
    
    
    
    
    
    
    
    
    