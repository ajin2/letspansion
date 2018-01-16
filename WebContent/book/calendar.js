/**
 * 
 */

var today = new Date(); // 오늘 날짜

var httpRequest = null;

var ny = parseInt(today.getFullYear());
var nm = parseInt(today.getMonth()+1);
var nd = parseInt(today.getDate());

var cstr;

var p = "<img src='/LetsPension/book/img/예.jpg'>";
var pn = "<img src='/LetsPension/book/img/대.jpg'>";
var n = "<img src='/LetsPension/book/img/완.jpg'>";

var payway;
var totalvalue = 0;
var restatus;
var restatusImg;

var a_1, a_2, a_3 ,rid;

var memid = "";

function memId(id){
	memid = id;
}


function prevCalendar() {
	// 이전 달을 today에 값을 저장하고 달력을 뿌려줍니다.
	 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	 buildCalendar();
}

function buildCalendar() {
		
	function makeend(){
		cell.innerHTML = i + "<br><br><br><br><br><font color='silver'><label>예약 종료</label></font><br><br><br>";
	}

	function makeres(){
		cell.innerHTML += "<label id='daylabel"+cstr+"' class='daylabel' onclick='selectDate("+d[0]+","+d[1]+","+d[2]+")'>"
					   + i +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>";
	}
	
	function makenext(){
		cell.innerHTML = i + "<br><br><br><br><br>예약 준비중<br><br><br>";
	}
	
	
	 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
	 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
	 var tblCalendar = document.getElementById("calendar");     // 테이블 달력을 만들 테이블
	 var tblCalendarYM = document.getElementById("calendarYM");    // yyyy년 m월 출력할 곳
	 tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  // yyyy년 m월 출력
	// 기존 테이블에 뿌려진 줄, 칸 삭제
	 while (tblCalendar.rows.length > 3) {
	  	tblCalendar.deleteRow(tblCalendar.rows.length - 1);
	 }
	 var row = null;
	 row = tblCalendar.insertRow();
	 var cnt = 0;
	// 1일이 시작되는 칸을 맞추어 줌
	 for (i=0; i<nMonth.getDay(); i++) {
		  cell = row.insertCell();
		  cnt = cnt + 1;
	 }
	// 달력 출력
	 for (i=1; i<=lastDate.getDate(); i++) { // 1일부터 마지막 일까지
		var cy = parseInt(today.getFullYear());
		var cm = parseInt(today.getMonth()+1);
		
		if((today.getMonth()+1) < 10) {
			var mm = "0" + (today.getMonth()+1);
		}else{
			var mm = (today.getMonth()+1);
		}
		
		if(i<10){
			var dd = "0" + i;
		}else{
			var dd = i;
		}
		
		cstr = today.getFullYear()+"-"+mm+"-"+dd;
		
	 	var str = today.getFullYear()+"a"+(today.getMonth() + 1)+"a"+i;
 		var d = str.toString().split('a');
 		
	    cell = row.insertCell();
	    
	    if(ny-cy > 0){						// 올해 전
	    	makeend();
	    } 
	    else if(ny-cy == 0){				// 올해 
	    	if(nm-cm > 0){					// 이번달 전
	    		makeend();
	    	} 
	    	else if(nm-cm == 0){			// 이번달
	    		if(nd-i > 0){				// 오늘 전
	    			makeend();
	    		} else if(nd-i <= 0){		// 오늘포함 이후 
	    			makeres();
	    			console.log(cstr);
	    			show(cstr);
	    		}
	    	} 
	    	else {							// 이번달 이후
	    		if(cm-nm < 3){				// 이번달 포함 3개월
	    			makeres();
	    			show(cstr);
	    		} else{						// 3개월 이후 예약 준비중으로 표시
	    			makenext();
	    		}
	    	}
	    } 
	    else{								// 올해 이후
	    	if(nm == 11){					// 2017년 11월 ~ 2018년 1월
	    		if(cm < 2){
	    			makeres();
	    			show(cstr);
	    		}else{
		    		makenext();
		    	}
	    	}
	    	
	    	else if(nm == 12){				// 2017년 12월 ~ 2018년 2월
	    		if(cm < 3){
	    			makeres();
	    			show(cstr);
	    		}else{
		    		makenext();
		    	}
	    	}
	    	
	    	else{
	    		makenext();
	    	}
	    	
	    }
	    
	    cnt = cnt + 1;
	    if (cnt%7 == 0){       // 1주일이 7일 이므로
	   	  row = calendar.insertRow();   // 줄 추가
	    }  
	 }
	 console.log(cnt);
	 
	 if(cnt%7 != 0){
		 for(var i=0; i<7-(cnt%7); i++){
			 console.log(cnt);
			 cell = row.insertCell();
			 cell.innerHTML += "";
		 }
	 }
	
}

function nextCalendar() {
	// 다음 달을 today에 값을 저장하고 달력을 뿌려줍니다.
	today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	buildCalendar();
}


function selectDate(d1, d2, d3) {
	inputform.y.value = d1;
	inputform.m.value = d2;
	inputform.day.value = d3;
	daily(); 
}

// -------------------------------------------------------------------------------------------------------------------------
function show(cstr) {
	var params = "date=" + cstr;
	console.log("show : cstr " + cstr);
	httpRequest = new HttpRequest(showresult, "select.do", params);
	httpRequest.sendRequest();
}

function showresult() {
	var con = document.getElementById("console");
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
	        var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
	        
	        var t = "<br><br>";
	        
	        for(var i = 0; i < data.book.length; i++){
	        	
	        	if(data.book[i].b_payway == 1)	{
	        		if(data.book[i].b_status == 2){
	            		payway = "무통장 입금";
	            		restatus = n;
	            	} else{
	            		payway = "무통장 입금";
	            		restatus = pn;
	            	}
	        	} else if(data.book[i].b_payway == 2) {
	        		payway = "카드 결제";
	        		restatus = n; 
	        	} else{
	        		payway="";
	        		restatus = p;
	        	}
	        	
	        	if(cstr == data.book[i].b_reg_date){
	        		var a = data.book[i].b_reg_date.toString().split('-');
	        		if(restatus == p){
	        			t += "<label class='p' onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + restatus ;
	        			t += "&nbsp;&nbsp;&nbsp;" + data.book[i].r_id + "<br></label>";
	        		} else{
	        			t += "<label class='notp' onclick='premake("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + restatus ;
	        			t += "&nbsp;&nbsp;&nbsp;" + data.book[i].r_id + "<br></label>"; 
	        		}
	        		console.log("make -> show : "+cstr);
	        	}
	        }
			$('#daylabel'+cstr).append(t);
		}
	}
}


function daily() {
	if (inputform.m.value < 10) {
		var m = "0" + inputform.m.value;
	} else
		var m = inputform.m.value;
	if (inputform.day.value < 10) {
		var day = "0" + inputform.day.value;
	} else {
		var day = inputform.day.value;
	}
	var params = "date=" + inputform.y.value + "-" + m + "-" + day;
	httpRequest = new HttpRequest(dailyresult, "select.do", params);
	httpRequest.sendRequest();
}

function dailyresult() {
	var consolea = document.getElementById("console");
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");

			var t = "<table border='1' id='dbtable'>";
			t += "<tr>";
			t += "<th> 날짜 </th>";
			t += "<th> 방 번호 </th>";
			t += "<th colspan='2'> 결제 상태 </th>";
			t += "</tr>";
			
			for (var i = 0; i < data.book.length; i++) {

				var date = data.book[i].b_reg_date;
				var a = date.toString().split('-');
				
				if (data.book[i].b_payway == 1) {
					if (data.book[i].b_status == 2) {
						payway = "무통장 입금";
						restatus = n;
					} else {
						payway = "무통장 입금";
						restatus = pn;
					}
				} else if (data.book[i].b_payway == 2) {
					payway = "카드 결제";
					restatus = n;
				} else {
					payway = "";
					restatus = p;
				}

				t += "<tr>";
				t += "<td>" + data.book[i].b_reg_date + "</td>";
				t += "<td>" + data.book[i].r_id + "</td>";
				if(restatus == p){
					t += "<td>" + restatus + "</td>";
					t += "<td><input type='button' value='예약하기' onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
				} else{
					t += "<td>" + restatus + "</td><td> &nbsp;&nbsp;&nbsp; </td>";
				}
				t += "</tr>";
			}
			t += "</table>";

			consolea.innerHTML = t;
		}
	}
} 


function insertform(a1,a2,a3, r_id){
	$('#btn').css('display','');
	a_1 = a1;
	a_2 = a2;
	a_3 = a3;
	rid = r_id;
	var result = document.getElementById("result");
	if(a2 < 10){
		a2 = "0" + a2;
	}
	if(a3 < 10){
		a3 = "0" + a3;
	}
	
	var date = a1 + "-" + a2 + "-" + a3 ;
	var price, person;
	
	if(r_id == 1 || r_id == 2){
		person = 2;
		price = 100000;
	} else if(r_id == 3){
		price = 150000;
		person = 4
	} else if(r_id == 4){
		price = 160000;
		person = 4;
	} else{
		price = 200000;
		person = 8;
	}
	
	console.log(date + "///" + r_id);
	
	var t = "<br>";
		t += "<form name='form'>";
		t += "<table border='1' id='dbtable'>";
		t += "<tr>";
		t += "<th> 날짜 </th>";
		t += "<th> 방 번호 </th>";
		t += "<th> 인원 </th>";
		t += "<th> 결제 방법 </th>";
		t += "<th> 예약 금액 </th>";
		t += "<th> 상품 주문 </th>";
		t += "</tr>";
		
		t += "<tr>";
		t += "<td><input type='text' name='b_reg_date' value='"+date+"' style='width:100px' readonly></td>";
		t += "<td><input type='text' name='r_id' value='"+r_id+"' style='width:60px' readonly></td>";
		t += "<td><input type='number' name='b_person' value='"+person+"' " +
			 "min='"+person+"' max='"+(person+2)+"' onclick='total("+r_id+",b_person.value)'></td>";
		t += "<td style='width:100px'>";
		t += "<input type='radio' name='b_payway' value='1' style='width:10px'>무통장입금<br>";
		t += "<input type='radio' name='b_payway' value='2' style='width:10px'>카드결제";
		t += "</td>";
		t += "<td id='tp'> "+price+" </td>";
		t += "<td style='width:100px'>";
		t += "<input type='radio' name='orderP' value='1' style='width:10px' onclick='orderok(1)'>O<br>";
		t += "<input type='radio' name='orderP' value='2' style='width:10px' onclick='orderok(2)'>X";
		t += "</td>";
		t += "</tr>";
		t += "</table>";
		t += "</form>";
		
	result.innerHTML = t;
	$("[type='number']").keypress(function(evt){
		evt.preventDefault();
	});
}

function orderok(value){
	if(value == 1){
		$('#product').css('display','');
		$('#pconsole').css('display','');
	} else {
		$('#product').css('display','none');
		$('#pconsole').css('display','none');
	}
}

function total(r_id, b_person){
	var tp = document.getElementById("tp");
	
	var price ;
	if(r_id == 1 || r_id == 2){
		if(b_person == 2){
			price = 100000;
		}else if(b_person == 3){
			price = 120000;
		}else{
			price = 140000;
		}
	} else if(r_id == 3){
		if(b_person == 4){
			price = 150000;
		}else if(b_person == 5){
			price = 170000;
		}else{
			price = 190000;
		}
	} else if(r_id == 4){
		if(b_person == 4){
			price = 160000;
		}else if(b_person == 5){
			price = 180000;
		}else{
			price = 200000;
		}
	} else{
		if(b_person == 8){
			price = 200000;
		}else if(b_person == 9){
			price = 220000;
		}else{
			price = 240000;
		}
	}
	
	
	tp.innerHTML = price;
	totalvalue = 1;
}


function bookinsert(){
	var b_person = form.b_person.value;
	var b_payway = form.b_payway.value;
	var a1 = a_1;
	var a2 = a_2;
	var a3 = a_3;
	var r_id = rid;
	
	if(memid == ""){
		alert("관리자는 예약이 불가");
		return;
	}
	
	if(!b_payway){
		alert("결제 방법을 선택하세요.");
		return ;
	} 
	
	var result = document.getElementById("result");
	
	var price = $('#book_total').text();
	price = Number(price);
	
	var date = a2 + "/" + a3 + "/" + a1;
	
	var t = "날짜 : " + date + "<br>방 번호 : " + parseInt(r_id) + "<br>결제 금액 : " + parseInt(price) 
		  + "<br>회원 id : " + memid;
	
	if(b_payway == 1) var b_status = 1;
	else if(b_payway == 2) var b_status = 2;
	
	var params = "date=" + date + "&r_id=" + parseInt(r_id) 
			   + "&m_id=" + memid + "&b_person=" + b_person 
			   + "&b_totalprice=" + price + "&b_payway=" + parseInt(b_payway) + "&b_status=" + parseInt(b_status);
	
	httpRequest = new HttpRequest(insertresult, "insert.do", params);
	httpRequest.sendRequest();
	
	paywayvalue=0;
	
	result.innerHTML += t;
	
	daily();
}

function resettable(){
	$('#btn').css('display','none');
	$('#product').css('display','none');
	$('#pconsole').css('display','none');
	$('#presult').css('display','none');
	$('#p_body').html('');
	$('#book_total').text('');
	totalprice = 0;
}

function insertresult() {
	var result = document.getElementById("result");
	var msg = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
	       	var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
	
	       	 if(code == "success"){
		            msg += "insert : 성공성공성공성공!!! <br>b_num : " + message + "<br>";
		            
		            var params = "";
		        	$('#p_body').find('td').each(function(index){
		        		if(index % 5 == 0){
		        			params = "pid=" + Number($(this).text());
		        		} else if(index % 5 == 2){			
		        			params += "&amount=" + Number($(this).text());
		        		} else if(index % 5 == 3){
		        			params += "&price=" + Number($(this).text());
		        		} else if(index % 5 == 4){
		        			params += "&b_num=" + Number(message);
		        			productinsert(params);
		        			params = "";
		        		}
		        		
		        	});
		        	
		        	show(cstr);
		        	resettable();
		            
	       	 }else{
	       		result.innerHTML = "";
		            msg += "insert : "+message + "<br>";
	       	 }
	       	 
	       	 buildCalendar();
	       	 result.innerHTML = msg;
		}
	}
} 

function premake(a1,a2,a3,r_id){
	var result = document.getElementById("result");
	
	result.innerHTML = a1 + "-" + a2 + "-" + a3 + " 날짜의 방" + r_id + "은 예약할 수 없습니다.";
}




