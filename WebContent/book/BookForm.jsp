<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>

<script src="${project}member/script.js"></script>
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${project}js/jquery-3.2.1.js"></script>

	<script src="${project}book/request.js"></script>
	<script src="${project}book/calendar.js"></script>
	<script src="${project}book/bookscript.js"></script>
	<link href="${project}book/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/boards.css"/>
	</head>
	
	<body id="talk" onload="memId('${sessionScope.memId}')">
	<div class="reser">
		<jsp:include page="/home/pensionHeader.jsp" flush="false"/>
		<div class="top_bg"><h3><span>예약</span></h3></div>
		<div class="board">
      	<div class="snb">
      	<div class="center">
      	<form name="inputform">
		<div class="form-group" id="a">
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
	<!-- 	</div>
		
		</div>
		</div> -->
		

		<div class="form-inline" id="b" style="position:absolute; top:120px; right:400px"> 
			<br>${today_date} : 
			<input class="form-control" type="text" name="todayDate" style="width:150px;">
			
			<br>${select_date} : 
			<input class="form-control" type="text" name="y" style="width:60px;margin-top:10px;">&nbsp;${str_year}
			<input class="form-control" type="text" name="m" style="width:50px;margin-top:10px;">&nbsp;${str_month}
			<input class="form-control" type="text" name="day" style="width:50px;margin-top:10px;">&nbsp;${str_day}
			
			<select class="form-control" style="margin-top:10px;" id="book_term" onchange="daily()">
			  <option value="1" selected="selected">${term_12}</option>
			  <option value="2">${term_23}</option>
			  <option value="3">${term_34}</option>
			  <option value="4">${term_45}</option>
			  <option value="5">${term_56}</option>
			  <option value="6">${term_67}</option>
			</select>

<%-- 			<span class="input-group-btn" >
               <button class="btn btn-success" type="button" onclick="daily()">${btn_ok}<i class="fa fa-mail-forward spaceLeft"></i></button>
            </span> --%>
			<input class="btn btn-success" type="button" value="${btn_ok}" onclick="daily()" style="margin-top:10px;">

			<div id="console" style="margin-top:10px;"></div>
				
		
			<div id="result" style="margin-top:10px;"></div>
			<jsp:include page="/book/productorder.jsp" flush="false"/>

		</div>
		</form>
		 </div>
		
		</div>
		
		</div>
		
		<script type="text/javascript">
		buildCalendar();
		
		var today = new Date();
		inputform.todayDate.value = today.getFullYear() + "${str_year}" 
								  + (today.getMonth()+1) + "${str_month}" 
								  + today.getDate() + "${str_day}" ;
		</script>
		
		</div> 
		
	</body>
</html>


