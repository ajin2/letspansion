<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<%@ include file="setting.jsp" %>
	<script src="${project}js/jquery-3.2.1.js"></script>
	<script src="${project}adminmanage/request.js"></script>
	<script src="${project}adminmanage/adminmanageproduct.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	
	<script type="text/javascript">
	//<!--
	    $(document).ready(function() {
	    	$(".banner .title").click(function() {
	            if($(this).next("div").is(":visible")){
	            $(this).next("div").slideUp("fast");
	            } else {
	                $(".banner1 .sub").slideUp("fast");
	                $(this).next("div").slideToggle("fast");
	            }
	        }); 
	        
	        $('.title').css('background','gray'); 
	        $('.sub').css('display','none');
	        $('#delimg').css('display','none');
	        $('#path').css('display','none');
	        $('#result').css('display','none');
	        $('#insertparam').css('display','none');
	        plist('${str_b}');
	    });
	
	    function fileSubmit() {
	        var formData = new FormData($("#fileForm")[0]);
	        $.ajax({
	            type : 'post',
	            url : 'adminManageProduct.do',
	            data : formData,
	            datatype : 'text',
	            processData : false,
	            contentType : false,
	            success : function(data) {
	            	console.log(data);
	            	console.log($('#result').html(data));
	            	addproduct_2($('#insertparam').html());
	            },
	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
	    } 
	    
	    function filemodSubmit() {
	        var formData = new FormData($("#filemodForm")[0]);
	        $.ajax({
	            type : 'post',
	            url : 'adminManageModProduct.do',
	            data : formData,
	            datatype : 'text',
	            processData : false,
	            contentType : false,
	            success : function(data) {
	            	console.log(data);
	            	console.log($('#result').html(data));
	            	mod_product($('#insertparam').html());
	            },
	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
	    } 
	    
	//-->
	</script>

	<body>
	<div id="alldiv" style="margin-left:50px;">
		<h2> 상품관리 </h2>
		<br><br>
		<div id="result"></div>
		<div id="insertparam"></div>
		<div id="delimg"></div>
		
		<input type="button" value="${btn_insert}" onclick="insertproduct()">
		<br><br>
		
		<div id="add_product"></div>
		<br><br>

		<!-- <form id="filemodForm" action="adminManageModProduct.do" method="post" enctype="multipart/form-data">
			<input type="file" id="filemod" name="filemod" /> 
			<input type="button" id="btn" value="전송" onclick="filemodSubmit()"/>
		</form> -->

		<table>
		<tr>
		<td>
		<div class="banner">
			<table id="product" style="margin-bottom:10px;">
				<tr>
					<th> <input type="button" value="${str_b}" onclick="plist('${str_b}')"> </th> 
					<th> <input type="button" value="${str_r}" onclick="plist('${str_r}')"> </th>
					<th> <input type="button" value="${str_d}" onclick="plist('${str_d}')"> </th>
					<th> <input type="button" value="${str_a}" onclick="plist('${str_a}')"> </th>
					<th> <input type="button" value="${btn_close}" onclick="order_cancel()"> </th>
				</tr>
			</table>
			<div class="sub"></div><div id="subp"></div> 
		</div>
		</td>
		<td>
		<div id="mod"></div>
		</td>
		</tr>
		</table>
	</div>
	<div style="margin-bottom:400px;"></div>
	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>


