/**
 * 
 */


var httpRequest = null;

var path = "/LetsPension/adminmanage/productimg/";


function orderaddbtn(){
	$('.banner').css('display','');
	$('#product').css('display','');
	$('#pconsole').css('display','');
	p_list('고기');
	delnoshow();
}

function ordermoddel(){
	delshow();
	$('#pconsole').html('');
	$('.banner').css('display','none');
}

function ordermoddel_cancel(){
	$('#pconsole').html('');
	$('.banner').css('display','none');
	delnoshow();
}

function ordermoddel_ok(){
	$('.banner').css('display','none');
	$('#omoddel').css('display','none');
	$('#orderlist').css('display','none');
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
	
	var total = 0;
	total = total + price;
	$('#price').html(total);
	
	
	$.ajax({
        type : 'get',
        url : 'orderinsert.do',
        data : params,
        datatype : 'text',
        processData : false,
        contentType : false,
        success : function(data) {
        	orderlist_select();
        	$('#product').css('display','');
        	delnoshow();
        },
        error : function(error) {
            alert("삭제 실패");
            console.log(error);
            console.log(error.status);
        }
    });
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
	$('#endcol').closest('tr').html("<td>총금액</td><td colspan='4' id='endcol'>"+Number($('#price').html())+" 원</td>");
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
	$('#endcol').closest('tr').html("<td>총금액</td><td colspan='5' id='endcol'>"+Number($('#price').html())+" 원</td>");
}


function orderlistdel(pname, oprice, pid){
	$(pname).closest('tr').remove();
	var total = Number($('#price').html());
	total = total - Number(oprice);
	$('#endcol').html(total + " 원");
	
	$('#price').html(total);
	total = Number($('#price').html());
	
	var a = (total + Number($('#totalprice').html())) + "원";
	var b = $('#bnum').html();
	$('.'+b).html(a);
	
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


function adminbookmod(){
	var params = "mid=" + $('#mid').html() + "&bnum=" + $('#bnum').html();
    window.location.href = 'adminmanagebookmod.do?' + params;
} 






















