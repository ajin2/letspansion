<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<%@ include file="setting.jsp" %>
	<script src="${project}book/jquery-3.2.1.js"></script>
	<script src="${project}book/request.js"></script>
	<script src="${project}book/productlist.js"></script>
	<script src="${project}book/bookscript.js"></script>
	<link href="${project}book/style.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	//<!--
		$(document).ready(
			function(){
				book_product();
			}
		);
	//-->
	</script>
	
	<body>
		
		<table id="wrap_product">
			<tr>
				<td style="width:600px;">
					<table id="product" border="1">
						<tr>
							<th> <input type="button" value="${str_b}" onclick="p_list('b')"> </th>
							<th> <input type="button" value="${str_r}" onclick="p_list('r')"> </th>
							<th> <input type="button" value="${str_d}" onclick="p_list('d')"> </th>
							<th> <input type="button" value="${str_a}" onclick="p_list('a')"> </th>
							<th> <input type="button" value="${btn_close}" onclick="order_cancel()"> </th>
						</tr>
					</table>
					
					<div id="pconsole"></div>
				</td>
				<td style="width:400px;">
					<table border="1" id="presult" style="display: none">
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
				</td>
				<td style="width:200px;">
					<div id="total">
						${str_total} : <label id="book_total"></label>
					</div>	
					<div id="btn">
						<input type="button" name="bookbtn" value="${btn_pay}" onclick="bookinsert()">
					</div>
				</td>
			</tr>
		</table>
		
		<script type="text/javascript">
			$('#product').css('display','none');
			$('#pconsole').css('display','none');
		</script>
		
	</body>
</html>


