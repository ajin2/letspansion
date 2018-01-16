<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<%@ include file="setting.jsp" %>
	<script src="${project}book/jquery-3.2.1.js"></script>
	<script src="${project}book/request.js"></script>
	<script src="${project}book/calendar.js"></script>
	<link href="${project}book/style.css" rel="stylesheet" type="text/css">
	<body onload="memId('${sessionScope.memId}')">
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
		
		<br><br>
		<div id="console"></div>
		
		<br>
		<div id="result"></div>
		
		<script type="text/javascript">
		buildCalendar();
		
		var today = new Date();
		inputform.todayDate.value = today.getFullYear() + "${str_year}" 
								  + (today.getMonth()+1) + "${str_month}" 
								  + today.getDate() + "${str_day}" ;
		</script>
		
	</body>
</html>


