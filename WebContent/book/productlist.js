/**
 * 
 */

var httpRequest = null;

function order_cancel(){
	$('#pconsole').html('');
}

function p_list(param){
	var params = "cate=" + param;
	httpRequest = new HttpRequest(p_listresult, "productselect.do", params);
	httpRequest.sendRequest();
	
	console.log(params);
}

function p_listresult(){
	var con = document.getElementById("pconsole");
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
	        var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
	        
	        var t = "<form name='productform'>";
	        	t += "<table border='1'>";
	        
	        for(var i = 0; i < data.product.length; i++){
	        	
        		t += "<tr>"+
        			"<td style='width:140px;'>"+ data.product[i].p_name +"</td>"+
        			"<td><img src='/LetsPension/book/img/"+ data.product[i].p_ori +"' style='width:100px; height:100px'></td>";
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
        		t += "<td> <input type='button' value='주문' onclick='orderlist(name"+i+".value, price"+i+".value, cnt"+i+".value, pid"+i+".value)'> </td></tr>";
	        }
	        t += "</table></form>";
	        con.innerHTML = t;
		}
	}
}


var totalprice = 0;

function orderlist(pname, price, cnt, pid){
	$('#presult').css('display', '');
	
	var cnt_2 = 0;
	var t = "";
	
	totalprice += (price * cnt);
	price = parseInt(price);
	cnt = parseInt(cnt);
	
	console.log($("#"+pname+":contains("+pname+")").length);
	
 	if($("#"+pname+":contains("+pname+")").length == 1){
 		cnt_2 = $("#"+pname+":contains("+pname+")").next().text();
 		cnt_2 = Number(cnt_2);
 		
 		cnt = cnt + cnt_2;
 		price = cnt * price;
 		
 		var newtext = "<input type='button' name='btn_del' value='삭제' onclick='orderlistremove("+pname+","+price+")'>";
 		
 		$("#"+pname+":contains("+pname+")").next().text(cnt);
 		$("#"+pname+":contains("+pname+")").next().next().text(price);
 		$("#"+pname+":contains("+pname+")").next().next().next().html(newtext);
 		
 		console.log("if를 탄다");
 		
 	} else {
 		t = "<tr>";
 		t += "<td style='display:none'>"+pid+"</td>";
 		t += "<td id='"+pname+"'>" + pname + "</td>";
 		t += "<td>" + cnt + "</td>";
 		t += "<td>" + (price * cnt) + "</td>" ;
 		t += "<td> <input type='button' name='btn_del' value='삭제' onclick='orderlistremove("+pname+","+(price * cnt)+")'> </td></tr>";
 		$('#p_body').append(t);
 		console.log("else를 탄다");
 		console.log(pname);
 	}
 	
	
	var f = "<tr>";
	f += "<td colspan='2'> 총 금액 </td>";
	f += "<td colspan='2' id='totalp'>" +totalprice+ "</td></tr>";
	
	$('#p_foot').html(f);
}


function orderlistremove(pname, dayprice){
	
	dayprice = Number(dayprice);
	console.log(dayprice);
	
	totalprice = totalprice - dayprice;
	
	if(totalprice == 0){
		$('#presult').css('display', 'none');
	} else{
		$('#totalp').html(totalprice);
	}
	
	pname.closest('tr').remove();
}

function book_product(){
	var bookprice = $('#tp').text();
	var payprice = totalprice + Number(bookprice);
	$('#book_total').html(payprice);
	setInterval("book_product()", 1000);
}


function productinsert(param){
	var params = param;
	httpRequest = new HttpRequest(productinsertresult, "orderinsert.do", params);
	httpRequest.sendRequest();
}

function productinsertresult(){
	var msg = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
			
	       	if(code == "success"){
	       		msg = message;
		            
	       	}else{
	       		msg = message ;
	       	}
	       	console.log(msg);
		}
	}
}















