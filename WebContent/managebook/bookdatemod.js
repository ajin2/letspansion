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
	
	httpRequest = new HttpRequest(dailyresult, "bookselect.do", params);
	httpRequest.sendRequest();
}

function dailyresult() {
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");

			var term = Number($("#book_term > option:selected").val());
			
			var t = "<table border='1' id='dbtable'>";
			t += "<tr>";
			t += "<th> 숙박 일수 </th>";
			t += "<th> 입실 날짜 </th>";
			t += "<th> 퇴실 날짜 </th>";
			t += "<th> 방 번호 </th>";
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
					if(a2 < 10)		a2 = "0"+a2;
				}else{
					if(a1 < 10)		a1 = "0" + a1;
					if(a2 < 10)		a2 = "0" + a2;
				}
				
				var enddate = a[0] + "-" + a1 + "-" + a2;
				var payway = "";
				
				if (data.book[i].b_payway == 1) {
					if (data.book[i].b_status == 2) {
						restatus = n;
						payway = "무통장입금";
					} else {
						restatus = pn;
						payway = "무통장입금";
					}
				} else if (data.book[i].b_payway == 2) {
					restatus = n;
					payway = "카드결제";
				} else {
					restatus = p;
				}
				
				t += "<tr>";
				t += "<td>" + term + " 박 " + (term + 1) + " 일</td>";
				
				if(term == 1){//------------------------------------------------
					t += "<td>" + data.book[i].b_reg_date + "</td>";
					t += "<td>" + data.book[i].b_reg_date + "</td>";
					t += "<td>" + data.book[i].r_id + "</td>";
					if(restatus == p){
						t += "<td>" + restatus + "</td>";
						t += "<td><input type='button' value='변경하기' " +
								"onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
					} else{
						if($('#mid').html() == data.book[i].m_id){
							t += "<td>" + restatus + "</td>";
							t += "<td><input type='button' value='변경하기' " +
									"onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
						}else{
							t += "<td>" + restatus + "</td><td> &nbsp;&nbsp;&nbsp; </td>";
						}
					}
				}else{//--------------------------------------------------------------------------------------------
					t += "<td>" + data.book[i].b_reg_date + "</td>";
					t += "<td>" + enddate + "</td>";
					t += "<td>" + data.book[i].r_id + "</td>";
					if(book_p[i] == 1){
						restatus = p;
						t += "<td>" + restatus + "</td>";
						t += "<td><input type='button' value='변경하기' " +
								"onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
					} else{
						if($('#mid').html() == data.book[i].m_id){
							t += "<td>" + restatus + "</td>";
							t += "<td><input type='button' value='변경하기' " +
									"onclick='insertform("+a[0]+","+a[1]+","+a[2]+","+data.book[i].r_id+")'></td>";
						}else{
							t += "<td>" + restatus + "</td><td> &nbsp;&nbsp;&nbsp; </td>";
						}
					}
				}
					
				t += "</tr>";
			}
			t += "</table>";

			$('#modbook').html(t);
			yesyes = [];
			cnt=0;
			book_p = [1,1,1,1,1];
			$('#modbookresult').css('display','none');
			$('#btn_mod').css('display','none');
		}
	}
} 


function insertform(a1,a2,a3, r_id){
	$('#modbookresult').css('display','');
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
	
	var lastDate = new Date(a1, a2, 0);
	lastDate = lastDate.getDate();
	
	var dd = Number(a3) + (term-1);
	var mm = a2;
	
	if(dd > lastDate){
		mm = Number(a2)+1;
		if(mm < 10)	mm = "0" + mm;
		dd = dd - lastDate;
		if(dd < 10)	dd = "0" + dd;
	}else{
		dd = Number(a3) + (term-1);
		if(dd < 10){
			dd = "0" + dd;
		}
	}
	
	var enddate = a1 + "-" + mm + "-" + dd;
	
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
		t += "<form name='form'>";
		t += "<table border='1' id='dbtable'>";
		t += "<tr>";
		t += "<th> 숙박 일수 </th>";
		t += "<th> 입실 날짜 </th>";
		t += "<th> 퇴실 날짜 </th>";
		t += "<th> 방 번호 </th>";
		t += "<th> 인원 </th>";
		t += "<th> 결제 방법 </th>";
		t += "<th> 결제 금액 </th>";
		t += "</tr>";
		
		t += "<tr>";
		t += "<td>" + term + " 박 " + (term + 1) + " 일</td>";
		t += "<td>"+date+"</td>";
		t += "<td>" + enddate + "</td>";
		t += "<td><input type='text' name='r_id' value='"+r_id+"' style='width:60px' readonly></td>";
		t += "<td><input type='number' name='b_person' value='"+person+"' " +
			 "min='"+person+"' max='"+(person+2)+"' onclick='total("+r_id+",b_person.value)'></td>";
		t += "<td>" + $('#payway').html() + "</td>";
		t += "<td id='tp'>"+(price * Number($("#book_term > option:selected").val()))+"</td>";
		t += "</tr>";
		t += "</table>";
		t += "</form>";
		
	$('#modbookresult').html(t);
	$('#btn_mod').css('display','');
	$('#person').html(person);
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







