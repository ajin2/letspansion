/**
 * 		amdin	script.js
 */


var adminiderror = "관리자 아이디를 입력하세요";
var adminpasswderror = "관리자 비밀번호를 입력하세요";

var adminloginiderror = "입력하신 아이디가 없습니다";
var adminloginpasswderror = "입력하신 비밀번호가 다릅니다";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// admin login
function adminidfocus() {
	adminhomeform.adminid.focus();
}

// admin login check
function adminlogincheck() {
	if(!adminhomeform.adminid.value) {
		alert(adminiderror);
		adminhomeform.adminid.focus();
		return false;
	} else if(!adminhomeform.adminpasswd.value) {
		alert(adminpasswderror);
		adminhomeform.adminpasswd.focus();
		return false;
	}
}