/**
 * 
 */

var httpRequest = null;
var today = new Date();

var y = today.getFullYear();
var m = today.getMonth()+1;
var d = today.getDate();

var yy = "";
var mm = "";
var dd = "";

var date = "";
var termdb = 0;

var path = "/LetsPension/adminmanage/productimg/";

var bookprice = 0;

function datemake(){
	if(m < 10)	m = "0"+m;
	if(d < 10)	d = "0"+d;
	
	date = y + "-" +  m + "-" + d ;
}

function memId(mid){
	var id = mid;
	$('#mid').html(id);
}

function booklist_select(){ 
	var id = $('#mid').html();
	var params = "mid=" + id + "&date=" + date;
	httpRequest = new HttpRequest(booklistresult, "booklist.do", params);
	httpRequest.sendRequest();
}

function booklistresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");
			
			var payway = "";
			var status = "";
			var cnt = 0;
			
			var msg = "<font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;** 결제 금액은 상품 주문 금액을 포함하지 않은 숙소 예약 금액입니다 **</font><br><br>";
			
			var t = "<table class='table table-striped table-bordered table-hover' border='1'>";
			t += "<tr>";
			t += "<th> 숙박 일수 </th>";
			t += "<th> 입실 날짜 </th>";
			t += "<th> 퇴실 날짜 </th>";
			t += "<th> 방 번호 </th>";
			t += "<th> 인원 </th>";
			t += "<th> 결제 방법 </th>";
			t += "<th> 결제 금액 </th>";
			t += "<th> 예약 상태 </th>";
			t += "</tr>";
			
			for (var i = 0; i < data.book.length; i++) {
				cnt = Number(data.book[i].b_term);
				
				if(data.book[i].b_payway == 1){
					payway = "무통장 입금";
					if(data.book[i].b_status == 1){
						status = "입금 대기";
					}else{
						status = "결제 완료";
					}
				} else{
					payway = "카드 결제";
					status = "결제 완료"; 
				}
				
				$('#payway').html(payway);
				$('#status').html(status);
				
				if(data.book[i].m_id == $('#mid').html()){
					var price = Number(data.book[i].b_totalprice) * cnt; 
					if(cnt > 1){
						if(i == 0){
							var d = data.book[i].b_reg_date.toString().split('-');
							yy = d[0];
							mm = d[1];
							dd = d[2];
							
							$('#bnum').html(data.book[i].b_num);
							termdb = cnt;
							
							t += "<tr><td>" + cnt + "박" + (cnt+1) + "일" + "</td>"; 
							t += "<td>" + data.book[i].b_reg_date + "</td>"; 
						} else if(i == data.book.length-1){
							t += "<td>" + data.book[i].b_reg_date + "</td>";
							t += "<td>" + data.book[i].r_id + "</td>";
							t += "<td>" + data.book[i].b_person + "</td>";
							t += "<td>" + payway + "</td>";
							t += "<td id='totalprice'>" + price + "원 </td>";
							t += "<td>" + status + "</td></tr>";
							bookprice = price;
						}
					}else if(cnt == 1){
						var d = data.book[i].b_reg_date.toString().split('-');
						yy = d[0];
						mm = d[1];
						dd = d[2];
						
						$('#bnum').html(data.book[i].b_num);
						termdb = cnt;
						
						t += "<tr><td>" + cnt + "박" + (cnt+1) + "일" + "</td>"; 
						t += "<td>" + data.book[i].b_reg_date + "</td>"; 
						t += "<td>" + data.book[i].b_reg_date + "</td>";
						t += "<td>" + data.book[i].r_id + "</td>";
						t += "<td>" + data.book[i].b_person + "</td>";
						t += "<td>" + payway + "</td>";
						t += "<td id='totalprice'>" + price + "원 </td>";
						t += "<td>" + status + "</td></tr>";
						bookprice = price;
					}
				}
			}
			t += "</table>";
			t = msg + t;
			$('#result').html(t);
		}
	}
}



function booklist_moddel(){
	var term = Number($("#book_term > option:selected").val());
	var b_person = form.b_person.value;
	var a1 = a_1;
	var a2 = a_2;
	var a3 = a_3;
	var r_id = rid;
	var b_num = bnum;
	
	if(a2 < 10){
		a2 = "0"+a2;
	}
	if(a3 < 10){
		a3 = "0"+a3;
	}
	
	if(term == 1){
		// b_num을 제외한 예약 삭제 / b_num = update
		
		var date = a2 + "/" + a3 + "/" + a1;
		
		var price = Number($('#tp').text());
		
		var params = "bnum=" + $('#bnum').html() + "&date=" + date + "&r_id=" + parseInt(r_id) 
		+ "&m_id=" + $('#mid').html() + "&b_person=" + b_person 
		+ "&b_totalprice=" + price + "&term=" + term;
		
		httpRequest = new HttpRequest(booklist_delresult, "booklistdel_ordermod.do", params);
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
			
			var payway = 0;
			if($('#payway').html() == '카드 결제'){
				payway = 2;
			}else{
				payway = 1;
			}
			var status = 0;
			if($('#status').html() == '결제 완료'){
				status = 2;
			}else{
				status = 1;
			}
			
			var params = "bnum=" + $('#bnum').html() + "&date=" + date + "&r_id=" + parseInt(r_id) 
			+ "&m_id=" + $('#mid').html() + "&b_person=" + b_person 
			+ "&b_totalprice=" + price + "&term=" + term 
			+ "&b_payway=" + Number(payway) + "&b_status=" + Number(status);
			
			if(i == 0){
				// update = b_num 유지, b_num을 제외한 예약 삭제
				httpRequest = new HttpRequest(booklist_delresult, "booklistdel_ordermod.do", params);
				httpRequest.sendRequest();
			}else{
				// 삽입
				httpRequest = new HttpRequest(booklist_delresult, "bookinsert.do", params);
				httpRequest.sendRequest();
			}
			
			a3 = a_3;
			a2 = a_2;
		}
	}
	
	paywayvalue=0;
}

function booklist_delresult() {
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
	       	var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
	       	var term = Number($("#book_term > option:selected").val());
	       	
	       	 if(code == "success"){
	       		 message = "<br><h3 style='color:red'>예약이 성공적으로 변경되었습니다.</h3>";
	       		$('#modbookresult').html(message);
	       	 }else{
		        $('#modbookresult').html(message);
	       	 }
	       	 daily();
	       	 buildCalendar();
	       	 booklist_select();
	       	 $('#modbookresult').css('display','');
		}
	}
} 



























