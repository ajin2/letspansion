<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	<script src="${project}managebook/managebookmoddel.js"></script>
	<script src="${project}managebook/bookdatemod.js"></script>
	<script src="${project}managebook/managebookmoddelorder.js"></script>
	<script src="${project}book/request.js"></script> 
	<script src="${project}js/jquery-3.2.1.js"></script>
	<link href="${project}managebook/style.css" rel="stylesheet" type="text/css">
	<%@ include file="setting.jsp" %>
	
	<script type="text/javascript">
	//<!--
		$(document).ready(function(){
			$('#mid').css('display','none');
			buildCalendar();
			datemake();
			booklist_select();
			$('#btn_mod').css('display','none');
			$('#bnum').css('display','none');
			$('#payway').css('display','none');
			$('#person').css('display','none');
			$('#status').css('display','none');
		});
	//-->
	</script>
	
	
	<body>
		<h2> 관리자 예약  변경  </h2>
		
		<input type="button" value="${btn_managebook}" onclick="location='adminManageBookPro.do'"><br>
		<div id="mid">${param.mid}</div> 
		<div id="bnum">${param.bnum}</div>
		<div id="payway"></div>
		<div id="person"></div>
		<div id="status"></div>

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

		<div id="result"></div>
		
		<div id="b">
		<form name="inputform">
			<br>${today_date} : 
			<input type="text" name="todayDate" style="width:120px; text-align:center">
			
			<br>${select_date} : 
			<input type="text" name="y" style="width:40px; text-align:center">${str_year}
			<input type="text" name="m" style="width:30px; text-align:center">${str_month}
			<input type="text" name="day" style="width:30px; text-align:center">${str_day}
			
			<select id="book_term" onchange="daily()">
			  <option value="1" selected="selected">${term_12}</option>
			  <option value="2">${term_23}</option>
			  <option value="3">${term_34}</option>
			  <option value="4">${term_45}</option>
			  <option value="5">${term_56}</option>
			  <option value="6">${term_67}</option>
			</select>
			
			<input type="button" value="${btn_ok}" onclick="daily()">
			
		</form>
		</div>
   		
   		<div id="modbook" style="width:500px"></div>
		
   		<div id="modbookresult" style="width:600px"></div>
		<div id="btn_mod"><input type="button" value="${btn_mod}" onclick="booklist_moddel()" ></div>
   		
		<div id="aaa"></div>	
		<br><br><br>
		
		<script type="text/javascript">
			var today = new Date();
			inputform.todayDate.value = today.getFullYear() + "${str_year}" 
									  + (today.getMonth()+1) + "${str_month}" 
									  + today.getDate() + "${str_day}" ;
		</script>
		
		
	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>