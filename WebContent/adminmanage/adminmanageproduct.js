
var pid = 0;
var pcate = "";
var path = "/LetsPension/adminmanage/productimg/";

function plist(param){
	var params = "cate=" + param;
	httpRequest = new HttpRequest(p_listresult, "productselect.do", params);
	httpRequest.sendRequest();
}

function p_listresult(){
	var divid = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
	        var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
	        
	        var t = "<form name='productform'>";
	        	t += "<table border='1' width='550px'>";
	        	t += "<tr>";
	        	t += "<th>상품명</th>";
	        	t += "<th>이미지</th>";
	        	t += "<th>수량</th>";
	        	t += "<th>가격</th>";
	        	t += "<th colspan='2'></th>";
	        	t += "</tr>";
	        
	        for(var i = 0; i < data.product.length; i++){
	        	if(i == 0){
	        		if(data.product[i].p_cate == '고기') divid = "sub_b";
	        		else if(data.product[i].p_cate == '라면') divid = "sub_r";
	        		else if(data.product[i].p_cate == '음료') divid = "sub_d";
	        		else if(data.product[i].p_cate == '주류') divid = "sub_a";
	        	}
	        	
        		t += "<tr>"+
        			"<td style='width:140px;' id='"+data.product[i].p_id+"'>"+ data.product[i].p_name +"</td>";
        		
        		if(data.product[i].p_sys == null || data.product[i].p_sys == ''){
        			t += "<td>이미지 없음</td>";
        		}else{
        			t += "<td><img src='"+ path + data.product[i].p_sys +"' style='width:100px; height:100px'></td>";
        		}
        		t += "<input type='hidden' name='pid"+i+"' value='"+data.product[i].p_id+"'>";
        		
        		if(data.product[i].p_cate == '고기'){
        			t += "<td>"+ data.product[i].p_amount +" g </td>" ;
        		} else{
        			t += "<td>"+ data.product[i].p_amount +" 개 </td>" ;
        		}
        		
        		t += "<td>"+ data.product[i].p_price +" 원 </td>"+
        			"<input type='hidden' name='name"+i+"' value='"+data.product[i].p_name+"'>"+
        			"<input type='hidden' name='cate"+i+"' value='"+data.product[i].p_cate+"'>"+
        			"<input type='hidden' name='sys"+i+"' value='"+data.product[i].p_sys+"'>"+
        			"<input type='hidden' name='price"+i+"' value='"+data.product[i].p_price+"'>";
        		t += "<td> <input type='button' value='수정' onclick='modproduct(pid"+i+".value, cate"+i+".value )'> </td>";
        		t += "<td> <input type='button' value='삭제' onclick='delproduct(pid"+i+".value, sys"+i+".value)'> </td></tr>";
        		
	        }
	        t += "</table></form>";
	        $('#'+divid).html(t);
		}
	}
}

function insertproduct(){
	var t = "<form id='fileForm' action='adminManageProduct.do' method='post' enctype='multipart/form-data'>";
	t +="<table border='1'><tr>";
	t += "<th>분류</th>";
	t += "<th>상품명</th>";
	t += "<th>이미지</th>";
	t += "<th>수량</th>";
	t += "<th>가격</th>";
	t += "<th colspan='2'></th></tr><tr>";
	t += "<td id='inserttd'> <input type='text' name='pcate' placeholder='고기, 라면, 음료, 주류 중 택 1' style='width:180px'> </td>";
	t += "<td> <input type='text' name='pname' style='width:120px'> </td>";
	t += "<td> <input type='file' name='fileup' id='fileup' style='width:180px'> </td>";
	t += "<td> <input type='number' name='amount' style='width:80px'> </td>";
	t += "<td> <input type='number' name='price' style='width:100px'> </td>";
	t += "<td> <input type='button' name='btn_insert' id='btn_insert' value='확인' ";
	t += "onclick='addproduct(pcate.value, pname.value, fileup.value, amount.value, price.value)'> </td>";
	t += "<td> <input type='button' name='btn_close' value='취소' onclick='tdclose()'> </td></tr></table></form>";

	$('#add_product').html(t);
}

function tdclose(){
	$('#add_product').html('');
}

function addproduct(pcate, pname, pic, amount, price){
	var pcate = pcate;
	var pic = pic;
	var amount = amount;
	var price = price;
	
	if(!pcate){
		alert("분류를 입력하세요");
		return;
	} else if(!pname){
		alert("상품명을 입력하세요");
		return;
	} else if(!amount){
		alert("수량을 입력하세요");
		return;
	} else if(!price){
		alert("가격을 입력하세요");
		return;
	}
	
	amount = Number(amount);
	price = Number(price);
	
	if(pic == null || pic == ""){
		var ori = "";
		var sys = "";
	} else{
		fileSubmit();
	}
	
	var params = "pcate=" + pcate + "&pname=" + decodeURI(pname) + "&amount=" + amount + "&price=" + price ;
	
	$('#insertparam').text(params);
}

function addproduct_2(){
	var params = $('#insertparam').text() + "&ori=" + $('#originName').html() + "&sys=" + $('#systemName').html();
	httpRequest = new HttpRequest(addproductresult, "productinsert.do", params);
	httpRequest.sendRequest();
	
	insertproduct();
	$('#add_product').html('');
}

function addproductresult(){
	var msg = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
			
	       	if(code == "success"){
	       		msg = message;
	       		plist(message);
		            
	       	}else{
	       		msg = message ;
	       	}
	       	console.log(msg);
	       	$('.sub_'+msg).css('display','');
		}
	}
}


function modproduct(p_id, cate){
	pid = Number(p_id);
	pcate = cate;
	var params = "cate=" + cate;
	httpRequest = new HttpRequest(modproductresult, "productselect.do", params);
	httpRequest.sendRequest();
}

function modproductresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
			
			var p = pid;
			
			for(var i = 0; i < data.product.length; i++){
				console.log(data.product[i].p_id);
				if(data.product[i].p_id == p){
		    		formmod(p, data.product[i].p_cate, data.product[i].p_name, data.product[i].p_sys, 
		    				data.product[i].p_amount, data.product[i].p_price, data.product[i].p_ori);
				}
	        }
		}
	}
}

function formmod(pid, pcate, pname, psys, pamount, pprice, pori){
	if(psys == null || psys == ''){
		var msg = "<td>이미지 없음";
	} else{
		var msg = "<td><img src='"+ path + psys +"' style='width:100px; height:100px'>";
	}
	
	var t = "<form id='filemodForm' action='adminManageModProduct.do' method='post' enctype='multipart/form-data'>";
	t += "<table border='1'><tr>";
	t += "<th>상품명</th>";
	t += "<th>이미지</th>";
	t += "<th>수량</th>";
	t += "<th>가격</th>";
	t += "<th colspan='2'></th></tr><tr>";
	t += "<input type='hidden' name='pcate' value='"+pcate+"'>";
	t += "<input type='hidden' name='pori' value='"+pori+"'>";
	t += "<input type='hidden' name='psys' value='"+psys+"'>";
	t += "<td id='"+pid+"'><input type='text' name='pname' value='"+pname+"' style='width:120px'> </td>";
	t += msg;
	t += "<input type='file' name='filemod' id='filemod' style='width:180px'> </td>";
	t += "<td> <input type='number' name='amount' value='"+pamount+"' style='width:80px'> gram/개 </td>";
	t += "<td> <input type='number' name='price' value='"+pprice+"' style='width:100px'> 원</td>";
	
	t += "<td> <input type='button' value='확인' onclick='mod(pname.value, "+pid+", filemod.value, amount.value, price.value, pori.value, psys.value)'> </td>";
	t += "<td> <input type='button' value='수정 취소' onclick='modcancel()'> </td></tr>";
	t += "</table></form>";

	$('#mod').html(t);
}

function modcancel(){
	var t = "";
	$('#mod').html(t);
}

function mod(pname, pid, pic, amount, price, ori, sys){
	if(pic == null || pic == ""){
		var ori = ori;
		var sys = sys;
	} else{
		filemodSubmit();
	}
	
	var params = "pname=" + pname + "&pid=" + Number(pid) + "&amount=" + Number(amount) + "&price=" + Number(price);
	$('#insertparam').text(params);
}

function mod_product(){
	var params = $('#insertparam').text() + "&ori=" + $('#originName').html() + "&sys=" + $('#systemName').html();
	httpRequest = new HttpRequest(modresult, "productmod.do", params);
	httpRequest.sendRequest();
}

function modresult(){
	var msg = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
			
			if(code == "success"){
	       		msg = message;
	       		plist(msg);
	       	}else{
	       		msg = message ;
	       	}
	       	console.log(msg);
	       	modcancel();
		}
	}
}

function delproduct(pid, psys){
	$('#delimg').text(psys);
	alert($('#delimg').text(psys));
	
	var params = "pid=" + Number(pid);
	httpRequest = new HttpRequest(delproductresult, "productdelete.do", params);
	httpRequest.sendRequest();
}

function delproductresult(){
	var msg = "";
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
			
			if(code == "success"){
	       		msg = message;
	       		fileDelSubmit();
		            
	       	}else{
	       		msg = message ;
	       	}
	       	console.log(msg);
	       	plist(msg);
	       	$('.sub_'+msg).css('display','');
		}
	}
}

function fileDelSubmit(){
	var params = "delfile=" + $('#delimg').html();
	httpRequest = new HttpRequest(delfileresult, "adminManageDelProduct.do", params);
	httpRequest.sendRequest();
}

function delfileresult(){
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			console.log("성공");
		}
	}
}






