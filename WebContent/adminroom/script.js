/**
 * 		room sript.js
 */


var adminloginerror = "관리자 로그인 이후 이용해주세요";

var httpRequest = null;
var test = document.getElementById("test");
var urlSplit = document.location.href.split("?");
var r_idSplit = urlSplit[1].split("=");
var r_id = r_idSplit[1];

var slideIndex = 1;
function plusDivs(n) {
	showDivs(slideIndex += n);
}

function currentDiv(n) {
	showDivs(slideIndex = n);
}

function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("demo");
	if (n > x.length) {
		slideIndex = 1
	}
	if (n < 1) {
		slideIndex = x.length
	}
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" w3-white", "");
	}
	x[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className += " w3-white";
}
/* Auto Slide 
var myIndex = 0;
function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); // Change image every 3 seconds
}
 */



////////////////////////////// adminRoomModi.jsp
function pictureDelete(pict_id) {
	var params = "pict_id=" + pict_id + "&r_id=" + r_id;
	httpRequest = new HttpRequest(pictureDeleteResult, "pictureDelete.do", params);
	httpRequest.sendRequest();
}

function pictureDeleteResult() {
	var pictureResult = document.getElementById("pictureResult");
	var result = document.getElementById("result");
	var msg = "";
	if(httpRequest.request.readyState == 4){
		if(httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			if (code == "success") {
				var pict_id = xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue;
				var deldiv = document.getElementById("picId_" + pict_id);	
				result.innerHTML = pict_id;
				pictureResult.removeChild(deldiv);
				msg += "-------- 글삭제 : 성공";
			} else {
				var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
				msg += "글삭제 : " + message;
			}	
		}
	} else {
		msg += "글삭제 : 통신중";
	}
	result.innerHTML = msg;
}

function pictureModify(picture) {
	var newdiv = document.createElement("div");
	newdiv.innerHTML = 	"<input class='inputbutton' type='button' value='사진 바꾸기' onclick='javascript:fileModify(" + picture.pict_id + ")'>  &nbsp;&nbsp;"
					+	"<input class='inputbutton' type='button' value='수정취소' onclick='javascript:pictureDelete(" + picture.pict_id + ")'>";
	newdiv.setAttribute("id", "picId_" + picture.pict_id);
	
	var olddiv = document.getElementById("picId_" +picture.pict_id);
	var pictureResult = document.getElementById("pictureResult");
	pictureResult.replaceChild(newdiv, olddiv);
	
	fileModify(picture);
}

function fileModify(pict_id) {
	var formData = new FormData($("#modiForm")[0]);
	alert(pict_id + " : " + r_id);
	$.ajax({
        type : 'post',
        url : 'fileModify.do?pict_id=' + pict_id + '&r_id=' + r_id,
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
            alert("파일이 수정되었습니다.");
        },
        error : function(error) {
            alert("파일 업로드에 실패하였습니다.");
            console.log(error);
            console.log(error.status);
        }
    });	
	pictureSelect();
}

function fileSubmit() {
    var formData = new FormData($("#fileForm")[0]);
    //var params = "formDate=" + formData + "&r_id=" + r_id;
    $.ajax({
        type : 'post',
        url : 'fileUpload.do?r_id=' + r_id,
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
            alert("파일 업로드하였습니다.");
        },
        error : function(error) {
            alert("파일 업로드에 실패하였습니다.");
            console.log(error);
            console.log(error.status);
        }
    });
	pictureSelect();
}

// 이거 지금 안씀
function pictureInsert(r_id) {
	var result = document.getElementById("result");
	var msg = "";
	
	if(httpRequest.request.readyState == 4) {
		if(httpRequest.reqeust.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			if(code == "success") {
				var comment = eval("(" + xmldoc.getElementsByTagName("comment").item(0).firstChild.nodeValue + ")");
				
				var newdiv = makecomment(comment);
				pictureResult.appendChild(newdiv);
				msg += "사잊 삽입 : 끝!";
			} else {
				var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
				msg += "사진 삽입 : " + message;
			}
		} else {
			msg += "사진 삽입 : 에러발생";
		}
	} else {
		msg += "사진 삽입 통시ㅣㄴ중";
	}
	result.innerHTML = msg;
} 

function pictureSelect() {
	var params = "r_id=" + r_id;
	httpRequest = new HttpRequest(pictureSelectResult, "pictureSelect.do", params);
	httpRequest.sendRequest();
}

function pictureSelectResult() {
	var pictureResult = document.getElementById("pictureResult");
	pictureResult.innerHTML = "";									// 기존에 출력되어있던 사진 지우기
	var result = document.getElementById("result");
	var msg = "";	
	
	if (httpRequest.request.readyState == 4) {
		if (httpRequest.request.status == 200) {
			var xmldoc = httpRequest.request.responseXML;
			var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
			if(code == "success") {
				var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
				for(var i = 0; i < data.pictures.length; i++) {
					var newdiv = makepicture(data.pictures[i]);
					msg += data.pictures.length;
					pictureResult.appendChild(newdiv);
				}
				msg += "사진 목록 : 정상조오료";
			}
		} else {
			msg += "사진 목록 : 에러";
		}
	} else {
		msg += "사진 목록 : 통신중";
	}
	result.innerHTML = msg;
}

function makepicture(picture) {
	var newdiv = document.createElement("div");

	newdiv.innerHTML = 	"<div class='col-lg-3 col-md-4 col-xs-6' width='100px'>"
        			+ 		"<img src='${project}/roomupload/" + picture.pic_sys + "' class='img-fluid img-thumbnail' alt=''>"
					+	"</div>"
					+	"<input type='file' id='file" + picture.pict_id + "' name='file" + picture.pict_id + "' value='사진 찾기'>"
					+	"<input class='inputbutton' type='button' value='사진 수정' onclick='javascript:fileModify(" + picture.pict_id + ");'>"
					+	"<input class='inputbutton' type='button' value='사진 삭제' onclick='javascript:pictureDelete(" + picture.pict_id + ")'>";

	newdiv.picture = picture;
	newdiv.setAttribute("id", "picId_" + picture.pict_id);
	newdiv.setAttribute("class", "row text-center text-lg-left");
	return newdiv;
}

// number check
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
