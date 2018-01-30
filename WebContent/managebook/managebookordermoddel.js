/**
 * 
 */
var httpRequest = null;


function orderaddbtn(){
	$('.banner2').css('display','');
	$('#product').css('display','');
	$('#pconsole').css('display','');
	$('.banner1 .sub').css('display','');
	p_list('고기');
}

function ordermoddel(){
	delshow();
}

function ordermoddel_cancel(){
	$('#pconsole').html('');
	$('.banner2').css('display','none');
	$('.banner1 .sub').css('display','');
	delnoshow();
}

function p_list(param){
	var params = "cate=" + param;
	httpRequest = new HttpRequest(p_listresult, "productselect.do", params);
	httpRequest.sendRequest();
}

function p_listresult(){
	var con = document.getElementById("pconsole");
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
	        var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
	        
	        var t = "<form name='productform'>";
	        	t += "<table border='1' id='ptable'>";
	        	t += "<tr>";
	        	t += "<th>상품명</th>";
	        	t += "<th>이미지</th>";
	        	t += "<th>기준 수량</th>";
	        	t += "<th>금액</th>";
	        	t += "<th>주문 수량</th>";
	        	t += "<th></th>";
	        	t += "</tr>";
	        
	        for(var i = 0; i < data.product.length; i++){
	        	
        		t += "<tr>"+
        			"<td style='width:85px;'>"+ data.product[i].p_name +"</td>"+
        			"<td><img src='/LetsPension/book/img/"+ data.product[i].p_sys +"' style='width:100px; height:100px'></td>";
        		t += "<input type='hidden' name='pid"+i+"' value='"+data.product[i].p_id+"'>";
        		
        		if(data.product[i].p_cate == 'b'){
        			t += "<td>"+ data.product[i].p_amount +" g </td>" ;
        		} else{
        			t += "<td>"+ data.product[i].p_amount +" 개 </td>" ;
        		}
        			
        		t += "<td>"+ data.product[i].p_price +" 원 </td>"+
        			"<input type='hidden' name='name"+i+"' value='"+data.product[i].p_name+"'>"+
        			"<input type='hidden' name='price"+i+"' value='"+data.product[i].p_price+"'>";
        		t += "<td> 수량 <input type='number' name='cnt"+i+"' value='1' min='1' style='width:40px'> </td>";
        		t += "<td> <input type='button' value='추가' onclick='orderaddinsert(name"+i+".value, price"+i+".value, cnt"+i+".value, pid"+i+".value)'> </td></tr>";
	        }
	        t += "</table></form>";
	        con.innerHTML = t;
		}
	}
}


var totalprice =  0;

function orderaddinsert(pname, price, cnt, pid){
	var params = "pid=" + pid + "&amount=" + cnt + "&price=" + price + "&b_num=" + $('#bnum').html();
	
	$.ajax({
        type : 'get',
        url : 'orderinsert.do',
        data : params,
        datatype : 'text',
        processData : false,
        contentType : false,
        success : function(data) {
        	orderlist_select();
        	delshow();
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
}

