/**
 * 
 */

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
	httpRequest = new HttpRequest(dailyresult, "select.do", params);
	httpRequest.sendRequest();
}

function dailyresult() {
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");

			var t = "<table border='1' id='dbtable'>";
			t += "<tr>";
			t += "<th> ID </th>";
			t += "<th> 이름 </th>";
			t += "<th> 전화번호 </th>";
			t += "<th> 이메일 </th>";
			t += "<th> 방 번호 </th>";
			t += "<th> 숙박 일수 </th>";
			t += "<th> 입실 날짜 </th>";
			t += "<th> 퇴실 날짜 </th>";
			t += "<th> 결제 금액 </th>";
			t += "<th> 결제 날짜 </th>";
			t += "<th> 결제 상태 </th>";
			t += "<th> 수정 </th>";
			t += "<th> 취소 </th>";
			t += "</tr>";
			
			for (var i = 0; i < data.book.length; i++) {
				var b_term = Number(data.book[i].b_term);
				
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
				
				if(restatus != p){
					var mid = data.book[i].m_id;
					$('#mid').html(mid);
					t += "<tr>";
					t += "<td>" + mid + "</td>";
					t += "<td>" + data.book[i].m_name + "</td>";
					t += "<td>" + data.book[i].m_tel + "</td>";
					t += "<td>" + data.book[i].m_email + "</td>";
					t += "<td>" + data.book[i].r_id + "</td>";
					t += "<td>" + b_term + " 박 " + (b_term + 1) + " 일</td>";
					
					if(b_term == 1){//---------------------------------------------------------------------------------
						t += "<td>" + data.book[i].b_reg_date + "</td>";
						var bnum = data.book[i].b_num;
						$('#bnum').html(bnum);
						orderlist_select(bnum);
						var total = Number($('#totalprice').html());
						var price = Number(data.book[i].b_totalprice);
						t += "<td>" + (total + price) + "</td>";
						t += "<td>" + data.book[i].b_book_date + "</td>";
						t += "<td>" + restatus + "</td>";
						t += "<td><input type='button' value='수정' onclick='adminbookmod()'></td>";
						t += "<td><input type='button' value='취소' onclick='adminbookdel()'></td>";
					}else{//--------------------------------------------------------------------------------------------
						termconfirm();
						t += "<td>" + $('#regdate').html() + "</td>";
						
						var date = $('#regdate').html();
						var a = date.toString().split('-');
						var a2 = Number(a[2]) + (b_term-1);
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
						
						t += "<td>" + enddate + "</td>";
						
						orderlist_select($('#bnum').html());
						var total = Number($('#totalprice').html());
						var price = Number(data.book[i].b_totalprice) * b_term ;
						t += "<td>" + (total + price) + "</td>";
						t += "<td>" + data.book[i].b_book_date + "</td>";
						t += "<td>" + restatus + "</td>"; 
						t += "<td><input type='button' value='수정' onclick='adminbookmod()'></td>";
						t += "<td><input type='button' value='취소' onclick='adminbookdel()'></td>";
					}
				}
				
				t += "</tr>";
			}
			t += "</table>";

			$('#console').html(t);
		}
	}
} 

//-------------------------------------------------------------------------------------------------------------------------
function orderlist_select(bnum){ 
	var params = "bnum=" + Number(bnum);
	httpRequest = new HttpRequest(orderlistresult, "orderlist.do", params);
	httpRequest.sendRequest();
}

function orderlistresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");
			
			cnt = data.book.length;
			total = 0;
			
			for (var i = 0; i < data.book.length; i++) {
				var price = Number(data.book[i].o_price); 

				for(var j=i+1; j < data.book.length; j++){
					if(data.book[i].p_id == data.book[j].p_id){
						data.book[i].o_price = Number(data.book[i].o_price) + Number(data.book[j].o_price);
						data.book[j] = ""; 
					}
				}
				
				if(data.book[i] != ""){
					price = Number(data.book[i].o_price);
					total = total + price; 
				}
			}
			$('#totalprice').html(total);
		}
	}
}


function adminbookdel(){
	var params = "mid=" + $('#mid').html() + "&bnum=" + $('#bnum').html();
	
	$.ajax({
        type : 'get',
        url : 'booklistdel.do',
        data : params,
        datatype : 'xml',
        processData : false,
        contentType : false,
        success : function(data) {
        	daily();
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
}


function termconfirm(){
	var params = "m_id=" + $('#mid').html();
	httpRequest = new HttpRequest(termconfirmresult, "adminmanagebookterm.do", params);
	httpRequest.sendRequest();
}

function termconfirmresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");
			
			for (var i = 0; i < data.book.length; i++) {
				if(i == 0){
					$('#bnum').html(data.book[i].b_num);
					$('#totalprice').html(data.book[i].b_totalprice);
					$('#regdate').html(data.book[i].b_reg_date);
				}
			}
		}
	}
}


function adminbookmod(){
	
}














