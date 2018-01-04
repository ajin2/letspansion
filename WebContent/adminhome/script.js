/**
 * 		adminhome script.js
 */

var adminiderror = "관리자 아이디를 입력하세요";
var adminpasswderror = "관리자 비밀번호를 입력하세요";


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