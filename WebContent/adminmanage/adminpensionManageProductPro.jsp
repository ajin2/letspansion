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
	<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>
	
	<script type="text/javascript">
	//<!--
	    $(document).ready(function() {
	        $(".banner .title").click(function() {
	            if($(this).next("div").is(":visible")){
	            $(this).next("div").slideUp("fast");
	            } else {
	                $(".banner .sub").slideUp("fast");
	                $(this).next("div").slideToggle("fast");
	            }
	        });
	        
	        $('.title').css('background','gray');
	        
	        $('.sub').css('display','none');
	        //$('#delimg').css('display','none');
	        $('#path').css('display','none');
	        $('#result').css('display','none');
	        $('#insertparam').css('display','none');
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
	                alert("파일 업로드하였습니다.");
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
	                alert("파일 업로드하였습니다.");
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
		<h2> 상품관리 </h2>
		
		<div id="result"></div>
		<div id="insertparam"></div>
		<div id="delimg"></div>
		
		<input type="button" value="${btn_insert}" onclick="insertproduct()">
		<div id="add_product"></div>

		<!-- <form id="filemodForm" action="adminManageModProduct.do" method="post" enctype="multipart/form-data">
			<input type="file" id="filemod" name="filemod" /> 
			<input type="button" id="btn" value="전송" onclick="filemodSubmit()"/>
		</form> -->

		<table>
		<tr>
		<td>
		<div class="banner">
		    <div class="title" onclick="plist('${str_b}')"> ${str_b} </div>
		    <div class="sub"><div id="sub_b"></div></div>
		    <div class="title" onclick="plist('${str_r}')"> ${str_r} </div>
		    <div class="sub"><div id="sub_r"></div></div>
		    <div class="title" onclick="plist('${str_d}')"> ${str_d} </div>
		    <div class="sub"><div id="sub_d"></div></div>
		    <div class="title" onclick="plist('${str_a}')"> ${str_a} </div>
		    <div class="sub"><div id="sub_a"></div></div>
		</div>
		</td>
		<td>
		<div id="mod"></div>
		</td>
		</tr>
		</table>

	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>


