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
	httpRequest = new HttpRequest(dailyresult, "bookselect.do", params);
	httpRequest.sendRequest();
}

function dailyresult() {
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");

			var t = "<table border='1' id='dbtable' style='width:900px'>";
			var cnt = 0;
			
			for (var i = 0; i < data.book.length; i++) {
				if(data.book[i].m_id != ""){
					if(cnt == 0){
						t += "<tr style='font-weight: bold;'>";
						t += "<td> 이름 </td>";
						t += "<td> 전화번호 </td>";
						t += "<td> 방 </td>";
						t += "<td> 숙박 일수 </td>";
						t += "<td> 입실 </td>";
						t += "<td> 퇴실 </td>";
						t += "<td> 인원 </td>";
						t += "<td> 금액 </td>";
						t += "<td> 결제 날짜 </td>";
						t += "<td> 상태 </td>"; 
						t += "<td> 입금 확인 </td>";
						t += "<td> 주문 수정 </td>";
						t += "<td> 예약 수정 </td>";
						t += "<td> 예약 취소 </td>";
						t += "</tr>";
						cnt = 1;
					}
				}
				
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
					t += "<td>" + data.book[i].m_name + "</td>";
					t += "<td>" + data.book[i].m_tel + "</td>";
					t += "<td>" + data.book[i].r_id + "</td>";
					t += "<td>" + b_term + " 박 " + (b_term + 1) + " 일</td>";
					
					var a = data.book[i].b_reg_date.toString().split('-');
					var a2 = Number(a[2]) + b_term; 
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
					
					if(b_term == 1){//---------------------------------------------------------------------------------
						t += "<td>" + data.book[i].b_reg_date + "</td>";
						t += "<td>" + enddate + "</td>";
						t += "<td>" + data.book[i].b_person + "</td>";
						
						var bnum = data.book[i].b_num;
						$('#bnum').html(bnum);
						orderlist_select();
						var total = Number($('#price').html());
						var price = Number(data.book[i].b_totalprice);
						$('#totalprice').html(price);
						price = Number($('#totalprice').html());
						
						t += "<td class='"+$('#bnum').html()+"'>" + (total + price) + "원</td>";
						t += "<td>" + data.book[i].b_book_date + "</td>";
						t += "<td>" + restatus + "</td>";
						if(restatus == pn){
							t += "<td><input type='button' value='확인' onclick='adminbookupdate()'></td>";
						}else{
							t += "<td></td>";
						}
						t += "<td><input type='button' value='수정' onclick='adminbookordermod()'></td>";
						t += "<td><input type='button' value='수정' onclick='adminbookmod()'></td>";
						t += "<td><input type='button' value='취소' onclick='adminbookdel()'></td>";
					}else{//--------------------------------------------------------------------------------------------
						if(i == 0){
							var bnum = data.book[i].b_num;
							$('#bnum').html(bnum);
						}
						
						termconfirm();
						t += "<td>" + $('#regdate').html() + "</td>";
						t += "<td>" + enddate + "</td>";
						t += "<td>" + data.book[i].b_person + "</td>";
						
						orderlist_select();
						var total = Number($('#price').html());
						var price = Number(data.book[i].b_totalprice) * b_term ;
						$('#totalprice').html(price);
						price = Number($('#totalprice').html());
						
						t += "<td class='"+$('#bnum').html()+"'>" + (total + price) + "원</td>";
						t += "<td>" + data.book[i].b_book_date + "</td>";
						t += "<td>" + restatus + "</td>"; 
						if(restatus == pn){
							t += "<td><input type='button' value='확인' onclick='adminbookupdate()'></td>";
						}else{
							t += "<td></td>";
						}
						t += "<td><input type='button' value='수정' onclick='adminbookordermod()'></td>";
						t += "<td><input type='button' value='수정' onclick='adminbookmod()'></td>";
						t += "<td><input type='button' value='취소' onclick='adminbookdel()'></td>";
					}
				}
				
				t += "</tr>";
			}
			t += "</table>";

			$('#console').html(t);
			$('#omoddel').css('display','none');
			$('#orderlist').css('display','none');
		}
	}
} 

//-------------------------------------------------------------------------------------------------------------------------
function adminbookordermod(){
	orderlist_select();
	$('#omoddel').css('display','');
	$('#orderlist').css('display','');
}

function orderlist_select(){ 
	var params = "bnum=" + Number($('#bnum').html());
	httpRequest = new HttpRequest(orderlistresult, "orderlist.do", params);
	httpRequest.sendRequest();
	$('#product').css('display','none');
	$('#presult').css('display','none');
}

function orderlistresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");
			
			var t = "<table border='1' width='450px'>";
			t += "<tr>";
			t += "<th> 상품명 </th>";
			t += "<th> 이미지 </th>";
			t += "<th> 기준 수량 </th>";
			t += "<th> 주문 수량 </th>";
			t += "<th id='col'> 금액 </th>";
			t += "<th> 삭제 </th>";
			t += "</tr>";
			
			cnt = data.book.length;
			var total = 0;
			
			for (var i = 0; i < data.book.length; i++) {
				var price = Number(data.book[i].o_price); 

				for(var j=i+1; j < data.book.length; j++){
					if(data.book[i].p_id == data.book[j].p_id){
						data.book[i].o_amount = Number(data.book[i].o_amount) + Number(data.book[j].o_amount);
						data.book[i].o_price = Number(data.book[i].o_price) + Number(data.book[j].o_price);
						data.book[j] = ""; 
					}
				}
				
				if(data.book[i] != ""){
					t += "<tr><td id='"+data.book[i].p_name+"'>" + data.book[i].p_name + "</td>"; 
					t += "<td><img src='"+ path + data.book[i].p_sys +"' style='width:100px; height:100px'></td>";
					
					if(data.book[i].p_cate == '고기'){ 
						t += "<td>" + data.book[i].p_amount + "  g</td>"; 
					}else{
						t += "<td>" + data.book[i].p_amount + "  개 </td>"; 
					}
					
					t += "<td>" + data.book[i].o_amount + "</td>"; 
					t += "<td>" + data.book[i].o_price + "원 </td>";
					t += "<td id='"+i+"'><input type='button' value='삭제' " +
						"onclick='orderlistdel("+data.book[i].p_name+","+data.book[i].o_price+","+data.book[i].p_id+")'></td>";

					price = Number(data.book[i].o_price);
					total = total + price; 
				}
			}
			t += "<tr><td>총 금액</td>";
			t += "<td colspan='5' id='endcol'>"+ total +"원</td></tr>";
			t += "</table>";
			$('#orderlist').html(t);
			delnoshow();
			
			$('#price').html(total);
			total = Number($('#price').html());
			
			var a = (total + Number($('#totalprice').html())) + "원";
			var b = $('#bnum').html();
			$('.'+b).html(a);
		}
	}
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
        	buildCalendar();
        	daily();
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
}



function adminbookupdate(){
	var params = "m_id=" + $('#mid').html();
	
	$.ajax({
        type : 'get',
        url : 'adminbookpayupdate.do',
        data : params,
        datatype : 'xml',
        processData : false,
        contentType : false,
        success : function(data) {
        	buildCalendar();
        	daily();
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
}














