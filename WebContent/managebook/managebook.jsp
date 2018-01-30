<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<script src="${project}managebook/managebook.js"></script>
	<script src="${project}managebook/managebookordermoddel.js"></script>
	<script src="${project}managebook/request.js"></script>
	<script src="${project}js/jquery-3.2.1.js"></script>
	<link href="${project}managebook/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<%@ include file="setting.jsp" %>
	
	<script type="text/javascript">
	//<!--
		$(document).ready(function(){
			$(".banner1 .title").click(function() {
	            if($(this).next("div").is(":visible")){
	            $(this).next("div").slideUp("fast");
	            } else {
	                $(".banner1 .sub").slideUp("fast");
	                $(this).next("div").slideToggle("fast");
	            }
	        });
			
			$(".banner2 .title").click(function() {
	            if($(this).next("div").is(":visible")){
	            $(this).next("div").slideUp("fast");
	            } else {
	                $(".banner2 .sub").slideUp("fast");
	                $(this).next("div").slideToggle("fast");
	            }
	        });
	        
	        $('.title').css('background','gray');
	        $('.sub').css('display','none');
			$('#mid').css('display','none');
			$('#bnum').css('display','none');
			$('#product').css('display','none');
			$('#pconsole').css('display','none');
			$('#btn').css('display','none');
			$('#person').css('display','none');
			
			memId('${sessionScope.memId}');
			datemake();
			booklist_select();
		});
	//-->
	</script>
	
	
	<body>
		<h2> 예약 조회  </h2>
		
		<div id="str_msg"></div>
		<div id="bmoddel">
			<input class="btn btn-success" type="button" value="${btn_modd}" onclick="location='managebookmoddel.do'">
			<input class="btn btn-success" type="button" value="${btn_del}" onclick="booklistdel()">
		</div>
		
		<div id="mid"></div>
		<div id="bnum"></div>
		<div id="person"></div>
		<div id="result1"></div><br><br>
		
		<br>
		<div id="omoddel">
			<input class="btn btn-success" type="button" value="${btn_orderadd}" onclick="orderaddbtn()">
			<input class="btn btn-success" type="button" value="${btn_orderdel}" onclick="ordermoddel()">
			<input class="btn btn-success" type="button" value="${btn_close}" onclick="ordermoddel_cancel()">
		</div>
		<div class="banner1">
   			<div class="title"> ${str_order} </div>
   			<div class="sub"></div>
   		</div>
		
		<div class="banner2">
			<table id="product">
				<tr>
					<th> <input class="btn btn-success" type="button" value="${str_b}" onclick="p_list('${str_b}')"> </th> 
					<th> <input class="btn btn-success" type="button" value="${str_r}" onclick="p_list('${str_r}')"> </th>
					<th> <input class="btn btn-success" type="button" value="${str_d}" onclick="p_list('${str_d}')"> </th>
					<th> <input class="btn btn-success" type="button" value="${str_a}" onclick="p_list('${str_a}')"> </th>
				</tr>
			</table>
			<div class="sub"></div><div id="pconsole"></div>
		</div>
		
		<table class='table table-striped table-bordered table-hover' border="1" id="presult" style="display: none">
			<thead>
				<tr>
					<th> ${str_productname} </th>
					<th> ${str_productcnt} </th>
					<th> ${str_productprice} </th>
					<th> ${btn_cancel} </th>
				</tr>
			</thead>
			
			<tbody id="p_body">
			</tbody>
			
			<tfoot id="p_foot">
			</tfoot>
		</table>
		
		<div id="aaa"></div>
		<br><br>
			
	</body>
</html>