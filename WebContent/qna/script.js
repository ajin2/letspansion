/**
 * 게시판
 */

var writererror = "작성자를 입력하세요";
var subjecterror = "글제목을 입력하세요";
var contenterror = "글내용을 입력하세요";
var passwderror = "비밀번호를 입력하세요";

var n_writeerror = "글작성에 실패했습니다\n잠시 후 다시 시도하세요";
var repasswderror = "비밀번호가 다릅니다\n다시 확인하세요";
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";
var replyerror = "답글이 있는 글은 지울 수 없습니다";
var modifyerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";

function erroralert( msg ) {
	alert( msg );
	history.back();
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

/*function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}*/


// 회원 삭제 확인
function DelCheck(q_num, ref, re_step, re_level, pageNum){
	var delcheck = confirm("삭제하시겠습니까?");
	
	if(delcheck == true){
		document.location.href="questionDelete.do?q_num="+q_num+"&ref="+ref+"&re_step="+re_step+"&re_level="+re_level+"&pageNum="+pageNum;
	}
	else if(delcheck == faluse){
		document.location.href="questionlist.do?pageNum="+pageNum;
	}
	
}


function writefocus() {
	writeform.writer.focus();
}
function writecheck() {
	if( ! questionform.subject.value ) {
		alert( subjecterror );
		questionform.subject.focus();
		return false;
	} else if( ! questionform.content.value ) {
		alert( contenterror );
		questionform.content.focus();
		return false;
	} 
}








