<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<%@ include file="setting.jsp" %>
	<script src="${project}js/jquery-3.2.1.js"></script>
	<script src="${project}book/request.js"></script>
	<script src="${project}book/bookscript.js"></script>
	<script src="${project}book/productlist.js"></script>
	<link href="${project}book/style.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	//<!--
		$(document).ready(
			function(){
				book_product();
				
				$(".banner .title").click(function() {
		            if($(this).next("div").is(":visible")){
		            $(this).next("div").slideUp("fast");
		            } else {
		                $(".banner1 .sub").slideUp("fast");
		                $(this).next("div").slideToggle("fast");
		            }
		        }); 
			}
		);
	
	//-->
	</script>
	
	<body>
	
		<div class="banner">
			<table class="table table-striped table-bordered table-hover" id="product">
				<tr>
					<th> <input class="btn btn-success" type="button" value="${str_b}" onclick="p_list('${str_b}')"> </th> 
					<th> <input class="btn btn-success" type="button" value="${str_r}" onclick="p_list('${str_r}')"> </th>
					<th> <input class="btn btn-success" type="button" value="${str_d}" onclick="p_list('${str_d}')"> </th>
					<th> <input class="btn btn-success" type="button" value="${str_a}" onclick="p_list('${str_a}')"> </th>
					<th> <input class="btn btn-success" type="button" value="${btn_close}" onclick="order_cancel()"> </th>
				</tr>
			</table>
			<div class="sub"></div><div id="pconsole"></div>
		</div>
	
	
		<table class="table table-striped table-bordered table-hover" border="1" id="presult" style="display: none">
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
		
		<div id="total-btn">
			<div id="total">
				${str_total} : <label id="book_total"></label>
			</div>	
			<div id="btn">
				<input class="btn btn-success" type="button" name="bookbtn" value="${btn_pay}" onclick="bookinsert(1)">
				<input class="btn btn-success" type="button" name="bookbtn" value="${btn_cardpay}" onclick="bookinsert(2)">
			</div>
		</div>
		<div id="person" style="display:none"></div>
		<script type="text/javascript">
			$('#product').css('display','none');
			$('#pconsole').css('display','none');
		</script>
		
	</body>
</html>


