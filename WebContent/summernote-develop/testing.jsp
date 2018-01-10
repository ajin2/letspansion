<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset=UTF-8">
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
						height : 300,
						minHeight : null,
						maxHeight : null,
						focus : true
					});
					
					$('#summernote').summernote();
				}
			);
		</script>
	</head>
	<body>
		<textarea name="content" id="summernote" value=""></textarea>
	</body>
	<br><br>
	<div id="result"></div>
</html>