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

var path = "/LetsPension/adminmanage/productimg/";

var bookprice = 0;
var cnt = 0;
var total = 0;

var delbnum = [];

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
			var msg = "";
			
			var t = "<table class='table table-striped table-bordered table-hover' border='1' id='sc'>";
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
			
			if(data.book.length == 0){
				msg = "<h4 style='color:red'>** 예약 내역이 없습니다 **</h4>";
				$('#str_msg').html(msg);
				$('#bmoddel').html('');
				t = "";
			}else{
				for (var i = 0; i < data.book.length; i++) {
					cnt = Number(data.book[i].b_term);
					delbnum[i] = data.book[i].b_num;
					
					if(data.book[i].b_payway == 1){
						payway = "무통장 입금";
						if(data.book[i].b_status == 1){
							status = "입금 대기";
							msg = "<h4 style='color:red'>** 입금 대기 상태입니다. 입금 후 꼭 Q&A 게시판 or 전화문의를 통해 입금 확인 부탁드립니다 **</h4>";
							$('#str_msg').html(msg);
						}else{
							status = "결제 완료";
							msg = "<h4 style='color:red'>** 결제 완료 상태입니다. Q&A 게시판 or 전화문의를 통해 변경/취소 부탁드립니다 **</h4>";
							$('#str_msg').html(msg);
							$('#bmoddel').html('');
							$('#omoddel').html('');
						}
					} else{
						payway = "카드 결제";
						status = "결제 완료"; 
						msg = "<h4 style='color:red'>** 결제 완료 상태입니다. Q&A 게시판 or 전화문의를 통해 변경/취소 부탁드립니다 **</h4>";
						$('#str_msg').html(msg);
						$('#bmoddel').html('');
						$('#omoddel').html('');
					}
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
			}
			t += "</table>";
			$('#result1').html(t);
			for(var i=0; i<delbnum.length; i++){
				console.log(delbnum[i]+"<br>");
			}
			orderlist_select();
		}
	}
}


function orderlist_select(){ 
	var params = "bnum=" + Number($('#bnum').html());
	httpRequest = new HttpRequest(orderlistresult, "orderlist.do", params);
	httpRequest.sendRequest();
}

function orderlistresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue+ ")");
			
			var t = "<table class='table table-striped table-bordered table-hover' border='1' width='450px'>";
			t += "<tr>";
			t += "<th> 상품명 </th>";
			t += "<th> 이미지 </th>";
			t += "<th> 기준 수량 </th>";
			t += "<th> 주문 수량 </th>";
			t += "<th id='col'> 금액 </th>";
			t += "<th> 삭제 </th>";
			t += "</tr>";
			
			cnt = data.book.length;
			total = 0;
			
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
			$('.sub').html(t);
			delnoshow();
			
			if(total == 0){
				$('.banner2').html('');
				$('#omoddel').html('');
				$('.banner1').css('display','none');
			}
			
			var a = (Number(total) + Number(bookprice)) + "원";
			$('#totalprice').html(a);
		}
	}
}

function delnoshow(){
	for(var i=0; i<cnt; i++){
		$('#'+i).css('display','none');
	}
	
	var t = "";
	t += "<th> 상품명 </th>";
	t += "<th> 이미지 </th>";
	t += "<th> 기준 수량 </th>";
	t += "<th> 주문 수량 </th>";
	t += "<th id='col'> 금액 </th>";
	
	$('#col').closest('tr').html(t);
	$('#endcol').closest('tr').html("<td>총금액</td><td colspan='4' id='endcol'>"+total+" 원</td>");
}

function delshow(){
	for(var i=0; i<cnt; i++){
		$('#'+i).css('display','');
	}
	
	var t = "";
	t += "<th> 상품명 </th>";
	t += "<th> 이미지 </th>";
	t += "<th> 기준 수량 </th>";
	t += "<th> 주문 수량 </th>";
	t += "<th id='col'> 금액 </th>";
	t += "<th> 삭제 </th>";
	
	$('#col').closest('tr').html(t);
	$('#endcol').closest('tr').html("<td>총금액</td><td colspan='5' id='endcol'>"+total+" 원</td>");
}


function orderlistdel(pname, oprice, pid){
	$(pname).closest('tr').remove();
	
	total = total - Number(oprice);
	$('#endcol').html(total + " 원");
	
	var a = (Number(total) + Number(bookprice)) + "원";
	$('#totalprice').html(a);
	
	var params = "pid=" + pid + "&bnum=" + $('#bnum').html();
	
	$.ajax({
        type : 'get',
        url : 'orderlistdel.do',
        data : params,
        datatype : 'xml',
        processData : false,
        contentType : false,
        success : function(data) {
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
}

function booklistdel(){
	var params = "mid=" + $('#mid').html() + "&bnum=" + $('#bnum').html();
	
	$.ajax({
        type : 'get',
        url : 'booklistdel.do',
        data : params,
        datatype : 'xml',
        processData : false,
        contentType : false,
        success : function(data) {
        	$('#str_msg').html('');
        	booklist_select();
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
}



