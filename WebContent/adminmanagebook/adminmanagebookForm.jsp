<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<%@ include file="setting.jsp" %>
	<script src="${project}js/jquery-3.2.1.js"></script>
	<script src="${project}book/request.js"></script>
	<script src="${project}adminmanagebook/admincalendar.js"></script>
	<script src="${project}adminmanagebook/adminbookscript.js"></script>
	<script src="${project}adminmanagebook/adminmanagebook.js"></script>
	<link href="${project}adminmanagebook/style.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	//<!--
		$(document).ready(function(){
			$(".banner .title").click(function() {
	            if($(this).next("div").is(":visible")){
	            $(this).next("div").slideUp("fast");
	            } else {
	                $(".banner .sub").slideUp("fast");
	                $(this).next("div").slideToggle("fast");
	            }
	        });
	        
			$('#mid').css('display','none');
			$('#bnum').css('display','none');
			$('#totalprice').css('display','none');
			$('#price').css('display','none');
			$('#regdate').css('display','none');
			
	        $('.title').css('background','gray');
	        $('.banner').css('display','none');
	        $('.sub').css('display','none');
			
			$('#omoddel').css('display','none');
			$('#orderlist').css('display','none');
			
			$('#product').css('display','none');
			$('#pconsole').css('display','none');
			$('#presult').css('display','none');
			
		});
	//-->
	</script>
	
	<body>
		<form name="inputform">
		<div id="a">
			<table id="calendar" border="1"> 
				<tr style="height:40px; background:pink; font-size:1.3em">
			     	<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
			        <td colspan="5" align="center" id="calendarYM">yyyy${str_year} m${str_month}</td>
			        <td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
			    </tr>
			    <tr style="height:10px;">
			    	<td colspan="7"></td>
			    </tr>
			    <tr style="height:20px; background:pink">
					<td align="center">${str_sun}</td>
					<td align="center">${str_mon}</td>
					<td align="center">${str_tue}</td>
					<td align="center">${str_wed}</td>
					<td align="center">${str_thu}</td>  
					<td align="center">${str_fri}</td>
					<td align="center">${str_sat}</td>
			    </tr>
			</table>
		</div>
		<div id="b">
			<br>${today_date} : 
			<input type="text" name="todayDate" style="width:120px; text-align:center">
			
			<br>${select_date} : 
			<input type="text" name="y" style="width:40px; text-align:center">${str_year}
			<input type="text" name="m" style="width:30px; text-align:center">${str_month}
			<input type="text" name="day" style="width:30px; text-align:center">${str_day}
			
			<input type="button" value="${btn_ok}" onclick="daily()">
			
		</div>
		</form>
		
		<div id="totalprice"></div>
		<div id="price"></div>
		<div id="mid"></div>
		<div id="bnum"></div>
		<div id="regdate"></div>
		
		<br><br>
		<div id="console"></div>
		
		<div id="omoddel">
			<input type="button" value="${btn_orderadd}" onclick="orderaddbtn()">
			<input type="button" value="${btn_orderdel}" onclick="ordermoddel()">
			<input type="button" value="${btn_close}" onclick="ordermoddel_cancel()">
			<input type="button" value="${btn_ok}" onclick="ordermoddel_ok()">
		</div>
		
		<div id="orderlist"></div>
		
		<div class="banner">
			<table id="product">
				<tr>
					<th> <input class="title" type="button" value="${str_b}" onclick="p_list('${str_b}')"> </th> 
					<th> <input class="title" type="button" value="${str_r}" onclick="p_list('${str_r}')"> </th>
					<th> <input class="title" type="button" value="${str_d}" onclick="p_list('${str_d}')"> </th>
					<th> <input class="title" type="button" value="${str_a}" onclick="p_list('${str_a}')"> </th>
				</tr>
			</table>
			<div class="sub"></div><div id="pconsole"></div>
		</div>
		
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
		
		<script type="text/javascript">
		buildCalendar();
		
		var today = new Date();
		inputform.todayDate.value = today.getFullYear() + "${str_year}" 
								  + (today.getMonth()+1) + "${str_month}" 
								  + today.getDate() + "${str_day}" ;
		</script>
		
	</body>
</html>


