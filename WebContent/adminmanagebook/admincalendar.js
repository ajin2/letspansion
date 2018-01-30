/**
 * 
 */

var today = new Date(); // 오늘 날짜

var httpRequest = null;

var ny = parseInt(today.getFullYear());
var nm = parseInt(today.getMonth()+1);
var nd = parseInt(today.getDate());

var cstr;
var cnt = 0;

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
	 
	 if(cnt%7 != 0){
		 for(var i=0; i<7-(cnt%7); i++){
			 cell = row.insertCell();
			 cell.innerHTML += "";
		 }
	 }
	
}

function nextCalendar() {
	// 다음 달을 today에 값을 저장하고 달력을 뿌려줍니다.
	today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	buildCalendar();
	if(cnt == 0){
		prevCalendar();
		cnt = 1;
	}
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
	httpRequest = new HttpRequest(showresult, "bookselect.do", params);
	httpRequest.sendRequest();
}

function showresult() {
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
	        			t += "<label class='p' onclick='daily()'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + restatus ;
	        			t += "&nbsp;&nbsp;&nbsp;" + data.book[i].r_id + "<br></label><br>";
	        		} else{
	        			t += "<label class='notp' onclick='daily()'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + restatus ;
	        			t += "&nbsp;&nbsp;&nbsp;" + data.book[i].r_id + "<br></label><br>"; 
	        		}
	        	}
	        }
			$('#daylabel'+cstr).append(t);
		}
	}
}




