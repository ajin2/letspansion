/**
 * 게시판
 */

var writererror = "작성자를 입력하세요";
var subjecterror = "글제목을 입력하세요";
var contenterror = "글내용을 입력하세요";
var passwderror = "비밀번호를 입력하세요";

var writeerror = "글작성에 실패했습니다\n잠시 후 다시 시도하세요";
var repasswderror = "비밀번호가 다릅니다\n다시 확인하세요";
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";
var replyerror = "답글이 있는 글은 지울 수 없습니다";
var modifyerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";

function erroralert( msg ) {
	alert( msg );
	history.back();
}


//관리자 삭제
function adminDel(n_id, n_pageNum){
	var adelcheck = confirm("삭제하시겠습니까?");
	
	if(adelcheck == true){
		document.location.href="adminNoticeDelete.do?n_id="+n_id+"&n_pageNum="+n_pageNum;
	}
	else if(adelcheck == faluse){
		document.location.href="adminNoticeList.do?n_pageNum="+n_pageNum;
	}
	
}


function modifyfocus() {
	modifyform.subject.focus();
}
function modifycheck() {
	if( ! modifyform.subject.value ) {
		alert( subjecterror );
		modifyform.subject.focus();
		return false;
	} else if( ! modifyform.content.value ) {
		alert( contentterror );
		modifyform.content.focus();
		return false;
	} else if( ! modifyform.passwd.value ) {
		alert( passwderror );
		modifyform.passwd.focus();
		return false;
	}	
}

function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}


function writefocus() {
	writeform.writer.focus();
}
function writecheck() {
	if( ! writeform.writer.value ) {
		alert( writererror );
		writeform.writer.focus();
		return false;
	} else if( ! writeform.subject.value ) {
		alert( subjecterror );
		writeform.subject.focus();
		return false;
	} else if( ! writeform.content.value ) {
		alert( contenterror );
		writeform.content.focus();
		return false;
	} else if( ! writeform.passwd.value ) {
		alert( passwderror );
		writeform.passwd.focus();
		return false;
	}	
}








