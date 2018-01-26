<%@page import="after.AfterDataBean"%>
<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<head>
	<meta charset=UTF-8">
	<%@ include file="setting.jsp" %>
	<link href="<%=project%>after/style.css" rel="stylesheet" type="text/css" >
	<script src="<%=project%>after/script.js"></script>
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
		
	<script type="text/javascript">
	function sendFile(file, editor, welEditable) {
		 
        // 파일 전송을 위한 폼생성
 		data = new FormData();
 	    data.append("uploadFile", file);
 	    $.ajax({ // ajax를 통해 파일 업로드 처리
 	        data : data,
 	        type : "POST",
 	        url : "image.do",
 	        enctype: 'multipart/form-data',
 	        cache : false,
 	        contentType : false,
 	        processData : false,
 	        success : function(data) { // 처리가 성공할 경우
                // 에디터에 이미지 출력
                var originContent = $('#summernote').summernote('code'); 
 	        	$('#summernote').summernote('code', originContent + '<img src=\"'+data+'\">');
 	        },
 	       error:function(request,status,error){
 	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 	       }
 	    });
 	} 
	
		$(document).ready(function (){
			
			$('#summernote').summernote({
			        height : 350,
			        lang : 'ko-KR',
		        	height : 300,
					minHeight : null,
					maxHeight : null,
					focus : true,
					callbacks: {
				       onImageUpload: function(files, editor, welEditable) {
				    	   sendFile(files[0],editor,welEditable);
				        }
				     }
			    });
			});
		</script>
		
</head>
        
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
					<textarea name="am_content" id="summernote"><%=afterDto.getAm_content()%></textarea>
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

