/**
 * 
 */

var bookcnt = 0;

var yesyes = [];
var cnt=0;
var book_p = [1,1,1,1,1];

function book_termok(){
	for(var k=0; k<cnt; k++){
		if(yesyes[k] == 1)	book_p[0] = 0;
		if(yesyes[k] == 2)	book_p[1] = 0;
		if(yesyes[k] == 3)	book_p[2] = 0;
		if(yesyes[k] == 4)	book_p[3] = 0;
		if(yesyes[k] == 5)	book_p[4] = 0;
	}
}

function Termselect(date){
	if (inputform.m.value < 10) {
		var m = "0" + inputform.m.value;
	} else{
		var m = inputform.m.value;
	}

	var day = inputform.day.value;
	var term = $("#book_term > option:selected").val();
	
	var params = "";
	
	for(var i=0; i<term; i++){
		day = Number(day) + i;
		if(day < 10)	day = "0" + day;
		
		var lastDate = new Date(inputform.y.value, m, 0);
		lastDate = lastDate.getDate();
		
		if(day > lastDate){
			m = Number(m)+1;
			if(m < 10)	m = "0" + m;
			day = day - lastDate;
			if(day < 10)	day = "0"+day;
		}
		
		params = "date=" + inputform.y.value + "-" + m + "-" + day;
		
		selectterm(params);
		
		day = inputform.day.value;
		if (inputform.m.value < 10) {
			var m = "0" + inputform.m.value;
		} else{
			var m = inputform.m.value;
		}
	}
}

function selectterm(date){
	var params = date ;
	httpRequest = new HttpRequest(selecttermresult, "termselect.do", params);
	httpRequest.sendRequest();
}

function selecttermresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");
			
			var r_id = "";
			
			for (var i = 0; i < data.book.length; i++) {
				if(data.book[i].b_payway != "" ){
					yesyes[cnt++] = data.book[i].r_id ;
				}
			}
		}
	}
}

function daily() {
	
	if(!inputform.m.value){
		alert("날짜를 선택 해 주세요");
		return;
	}
	
	if (inputform.m.value < 10) {
		var m = "0" + inputform.m.value;
	} else
		var m = inputform.m.value;
	if (inputform.day.value < 10) {
		var day = "0" + inputform.day.value;
	} else {
		var day = inputform.day.value;
	}
	var params = "date=" + inputform.y.value + "-" + m + "-" + day ;
	Termselect(params);
	book_termok();
	httpRequest = new HttpRequest(dailyresult, "select.do", params);
	httpRequest.sendRequest();
	resettable();
}

function dailyresult() {
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");

			var term = Number($("#book_term > option:selected").val());
			
			var t = "<table class='table table-striped table-bordered table-hover' border='1' id='dbtable'>";
			t += "<tr>";
			t += "<th> 방 번호 </th>";
			t += "<th> 숙박 일수 </th>";
			t += "<th> 입실 날짜 </th>";
			t += "<th> 퇴실 날짜 </th>";
			t += "<th colspan='2'> 결제 상태 </th>";
			t += "</tr>";
			
			for (var i = 0; i < data.book.length; i++) {

				var date = data.book[i].b_reg_date;
				var a = date.toString().split('-');
				var a2 = Number(a[2]) + (term-1);
				var a1 = Number(a[1]);
				
				var lastDate = new Date(a[0], a[1], 0);
				lastDate = lastDate.getDate();
				
				if(a2 > lastDate){
					a1 = a1 + 1;
					if(a1 < 10)		a1 = "0" + a1;
					a2 = a2 - lastDate;
					if(a2 < 10)		a2 = "0" + a2;
				}else{
					if(a1 < 10)		a1 = "0" + a1;
					if(a2 < 10)		a2 = "0" + a2;
				}
				
				var enddate = a[0] + "-" + a1 + "-" + a2;
				
				if (data.book[i].b_payway == 1) {
					if (data.book[i].b_status == 2) {
						restatus = n;
					} else {
						restatus = pn;
					}
				} else if (data.book[i].b_payway == 2) {
					restatus = n;
				} else {
					restatus = p;
				}
				
				t += "<tr>";
				t += "<td>" + data.book[i].r_id + "</td>";
				t += "<td>" + term + " 박 " + (term + 1) + " 일</td>";
				
				if(term == 1){//------------------------------------------------
					t += "<td>" + data.book[i].b_reg_date + "</td>";
					t += "<td>" + data.book[i].b_reg_date + "</td>";
					if(restatus == p){
						t += "<td>" + restatus + "</td>";
						t += "<td><input type='button' class='btn btn-success' value='예약하기' onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
					} else{
						t += "<td>" + restatus + "</td><td> &nbsp;&nbsp;&nbsp; </td>";
					}
				}else{//--------------------------------------------------------------------------------------------
					t += "<td>" + data.book[i].b_reg_date + "</td>";
					t += "<td>" + enddate + "</td>";
					if(book_p[i] == 1){
						restatus = p;
						t += "<td>" + restatus + "</td>";
						t += "<td><input type='button' class='btn btn-success' value='예약하기' onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
					} else{
						t += "<td>" + restatus + "</td><td> &nbsp;&nbsp;&nbsp; </td>";
					}
				}
					
				t += "</tr>";
			}
			t += "</table>";

			$('#console').html(t);
			yesyes = [];
			cnt=0;
			book_p = [1,1,1,1,1];
		}
	}
} 

//-------------------------------------------------------------------------------------------------------------------------
function insertform(a1,a2,a3, r_id){
	$('#result').css('display','');
	$('#btn').css('display','');
	var term = Number($("#book_term > option:selected").val());
	a_1 = a1;
	a_2 = a2;
	a_3 = a3;
	rid = r_id;
	
	if(a2 < 10){
		a2 = "0" + a2;
	}
	if(a3 < 10){
		a3 = "0" + a3;
	}
	
	var date = a1 + "-" + a2 + "-" + a3 ;
	var price = 0;
	var person = 0;
	
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
	
	var t = "<br>";
		t += "<form name='formdd'>";
		t += "<table class='table table-striped table-bordered table-hover' border='1' id='dbtable'>";
		t += "<tr>";
		t += "<th> 날짜 </th>";
		t += "<th> 방 번호 </th>";
		t += "<th> 인원 </th>";
		/*t += "<th> 결제 방법 </th>";*/
		t += "<th> 예약 금액 </th>";
		t += "<th> 상품 주문 </th>";
		t += "</tr>";
		
		t += "<tr>";
		t += "<td><input type='text' name='b_reg_date' value='"+date+"' style='width:100px' readonly></td>";
		t += "<td><input type='text' name='r_id' value='"+r_id+"' style='width:60px' readonly></td>";
		t += "<td><input type='number' id='b_person' name='b_person' value='"+person+"' " +
			 "min='"+person+"' max='"+(person+2)+"' onclick='total("+r_id+",b_person.value)'></td>";
		/*t += "<td style='width:100px'>";
		t += "<input type='radio' name='b_payway' value='1' style='width:10px'>무통장입금<br>";
		t += "<input type='radio' name='b_payway' value='2' style='width:10px'>카드결제";
		t += "</td>";*/
		t += "<td id='tp'>"+(price * term)+"</td>";
		t += "<td style='width:100px'>";
		t += "<input type='radio' name='orderP' value='1' style='width:10px' onclick='orderok(1)'>O<br>";
		t += "<input type='radio' name='orderP' value='2' style='width:10px' onclick='orderok(2)'>X";
		t += "</td>";
		t += "</tr>";
		t += "</table>";
		t += "</form>";
		
	$('#result').html(t);
	$('#person').html(person);
	/*$("[type='number']").keypress(function(evt){
		evt.preventDefault();
	});*/
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

function total(r_id, person){
	var term = Number($("#book_term > option:selected").val());
	var price = 0;
	
	if(r_id == 1 || r_id == 2){
		if(person == 2){
			price = 100000 * term;
		}else if(person == 3){
			price = 100000 * term + 20000;
		}else if(person == 4){
			price = 100000 * term + 40000;
		}
	} else if(r_id == 3){
		if(person == 4){
			price = 150000 * term;
		}else if(person == 5){
			price = 150000 * term + 20000;
		}else if(person == 6){
			price = 150000 * term + 40000;
		}
	} else if(r_id == 4){
		if(person == 4){
			price = 160000 * term;
		}else if(person == 5){
			price = 160000 * term + 20000;
		}else if(person == 6){
			price = 160000 * term + 40000;
		}
	} else{
		if(person == 8){
			price = 200000 * term;
		}else if(person == 9){
			price = 200000 * term + 20000;
		}else if(person == 10){
			price = 200000 * term + 40000;
		}
	}
	
	$('#tp').html(price);
	totalvalue = 1;
}

//-------------------------------------------------------------------------------------------------------------------------
function bookinsert(payway){
	var term = Number($("#book_term > option:selected").val());
	var b_person = Number($('#person').html());
	var b_payway = payway;
	
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
	
	if(b_payway == 1) var b_status = 1;
	else if(b_payway == 2) var b_status = 2;
	
	if(term == 1){
		var date = a2 + "/" + a3 + "/" + a1;
		
		var price = Number($('#tp').text());
		
		var params = "date=" + date + "&r_id=" + parseInt(r_id) 
		+ "&m_id=" + memid + "&b_person=" + b_person 
		+ "&b_totalprice=" + price + "&b_payway=" + parseInt(b_payway) + "&b_status=" + parseInt(b_status) + "&term=" + term;
		
		httpRequest = new HttpRequest(insertresult, "insert.do", params);
		httpRequest.sendRequest();
	}else{
		var price = Number($('#tp').text()) / term;
		for(var i=0; i<term; i++){
			bookcnt = bookcnt + 1;
			a3 = a3 + i;
			
			var lastDate = new Date(a1, a2, 0);
			lastDate = lastDate.getDate();
			
			if(a3 > lastDate){
				a2 = Number(a2)+1;
				if(a2 < 10)	a2 = "0" + a2;
				a3 = a3 - lastDate;
				if(a3 < 10)	a3 = "0" + a3;
			}
			
			var date = a2 + "/" + a3 + "/" + a1;
			
			var params = "date=" + date + "&r_id=" + parseInt(r_id) 
			+ "&m_id=" + memid + "&b_person=" + b_person 
			+ "&b_totalprice=" + price + "&b_payway=" + parseInt(b_payway) + "&b_status=" + parseInt(b_status) + "&term=" + term;
			
			httpRequest = new HttpRequest(insertresult, "insert.do", params);
			httpRequest.sendRequest();
			a3 = a_3;
			a2 = a_2;
		}
	}
	
	paywayvalue=0;
}

function resettable(){
	$('#result').css('display','none');
	$('#btn').css('display','none');
	$('#product').css('display','none');
	$('#pconsole').css('display','none');
	$('#presult').css('display','none');
	$('#p_body').html('');
	$('#book_total').text('');
	totalprice = 0;
	$('#tp').text('');
}

function insertresult() {
	var result = document.getElementById("result");
	var msg = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
	       	var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
	       	var term = Number($("#book_term > option:selected").val());
	       	
	       	 if(code == "success"){
		           /* msg += "insert : 성공성공성공성공!!! <br>b_num : " + message + "<br>";*/
		            
		            if(term == 1){
		            	bookproductonce(message);
		            }else{
		            	if(bookcnt == 1){
		            		bookproductonce(message);
		            	}
		            }
		        	
		        	show(cstr);
		        	resettable();
		            
	       	 }else{
	       		result.innerHTML = "";
		            msg += "insert : "+message + "<br>";
	       	 }
	       	 
	       	 buildCalendar();
	       	 result.innerHTML = msg;
	       	 $('#result').css('display','');
	       	 daily();
		}
	}
} 

function bookproductonce(message){
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
			orderinsert(params);
			params = "";
		}
	});
}

function premake(a1,a2,a3,r_id){
	var result = document.getElementById("result");
	
	result.innerHTML = a1 + "-" + a2 + "-" + a3 + " 날짜의 방" + r_id + "은 예약할 수 없습니다.";
}
