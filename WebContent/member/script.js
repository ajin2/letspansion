/**
 * 회원관리
 */

var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";
var repasswderror = "비밀번호가 다릅니다";
var nameerror = "이름을 입력하세요";
var juminerror = "주민등록번호를 입력하세요";
var telerror = "전화번호를 입력하세요";
var emailerror = "이메일 형식에 맞지 않습니다";

var inputerror = "회원가입에 실패했습니다\n잠시 후 다시 시도하세요";
var confirmerror = "아이디 중복확인을 해주세요"; 
var loginiderror = "입력하신 아이디가 없습니다";
var loginpasserror = "입력하신 비밀번호가 다릅니다";
var deleteerror = "회원탈퇴에 실패했습니다\n잠시 후 다시 시도하세요";
var updateerror = "회원정보 수정에 실패했습니다\n잠시 후 다시 시도하세요";	

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// 회원 정보 수정
function viewfocus() {
	viewform.passwd.focus();
}
function viewcheck() {
	if( ! viewform.passwd.value ) {
		alert( passwderror );
		viewform.passwd.focus();
		return false;
	} else if( viewform.passwd.value != viewform.repasswd.value ) {
		alert( repasswderror );
		viewform.repasswd.focus();
		return false;
	}
	if( viewform.email1.value || viewform.email2.value ) {
		if( ! viewform.email1.value || ! viewform.email2.value ) {
			alert( emailerror );
			viewform.email1.focus();
			return false;
		}
		if( viewform.email1.value.indexOf( "@" ) != -1 
		||	viewform.email2.value.indexOf( "@" ) != -1	) {
			alert( emailerror );
			viewform.email1.focus();
			return false;
		}
	}
	if( viewform.tel1.value 
			|| viewform.tel2.value
			|| veiwform.tel3.value ) {
		if( viewform.tel1.value.length < 3 
			|| viewform.tel2.value.length < 4 
			|| viewform.tel3.value.length < 4 ) {
			alert( telerror );
			viewform.tel1.focus();
			return false;			
		}		
	} 	
	
	
	
	// 이메일 란은 하나라도 값이 있으면 모두 값이 없으면 경고
	// 이메일 란은 두 칸 모드 @가 있으면 경고
}


// 회원 탈퇴
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


// 중복 확인
function confirmid() {
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();
		return;
	}	
	var url = "logonConfirmId.do?id=" + inputform.id.value;
	open( url, "confirm", "scrollbars=no, menubar=no, status=no, width=400, height=200");
}

function confirmfocus() {
	confirmform.id.focus();
}
function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( iderror );
		return false;
	}
}

function setid( id ) {
	opener.document.inputform.id.value = id;
	window.close();
	opener.document.inputform.passwd.focus();
	opener.document.inputform.confirm.value = "1";
}


// 메인
function mainfocus() {
	mainform.id.focus();
}
function maincheck() {
	if( ! mainform.id.value ) {
		alert( iderror );
		mainform.id.focus();
		return false;
	} else if( ! mainform.passwd.value ) {
		alert( passwderror );
		mainform.passwd.focus();
		return false;
	} 
}

// 회원 가입
function inputfocus() {
	inputform.id.focus();
}
function inputcheck() {
	// 아이디 비밀번호 이름 주민1 주민2 는 not null 이다.
	// passwd 와 repassws 는 같아야 한다.	
	
	if( inputform.confirm.value == "0" ) {
		alert( confirmerror );
		inputform.id.focus();
		return false;
	}
	
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();
		return false;
	} else if( ! inputform.passwd.value ) {
		alert( passwderror );
		inputform.passwd.focus();
		return false;
	} else if( inputform.passwd.value != inputform.repasswd.value ) {
		alert( repasswderror );
		inputform.repasswd.focus();
		return false;
	} else if( ! inputform.name.value ) {
		alert( nameerror );
		inputform.name.focus();
		return false;
	} else if( inputform.tel1.value 
			|| inputform.tel2.value 
			|| inputform.tel3.value ) {
			//	전화번호 1 2 3 란 하나 입력했다면 모두 값이 있어야 한다
			//	모두 값을 입력했다면 3 3 4 보다 작으면 안된다.
			if( inputform.tel1.value.length < 3 
				|| inputform.tel2.value.length < 3 
				|| inputform.tel3.value.length < 4 ) {
				alert( telerror );
				inputform.tel1.focus();
				return false;
			}				
	}
	
	if( inputform.email1.value ) {
		if( inputform.email2.value == "0" ) {
			// 직접입력 
			if( inputform.email1.value.indexOf( "@" ) == -1 ) {
				// @가 없다
				alert( emailerror );
				inputform.email1.focus();
				return false;
			}			
		} else {
			// 선택입력
			if( inputform.email1.value.indexOf( "@" ) != -1 ) {
				// @가 없다
				alert( emailerror );
				inputform.email1.focus();
				return false;
			}
		}		
	}
	
	// 	1. null 인 경우		이동
	// 	2. 직접입력일 경우		email1 란에 @가 없으면 경고
	// 	3. 선택입력일 경우		email1 란에 @가 있으면 경고
	//	단 전화번호가 있건 없건 모두 가능
}

function nextjumin2() {
	if( inputform.jumin1.value.length == 6 ) {
		inputform.jumin2.focus();
	} 
}
function nexttel1() {
	if( inputform.jumin2.value.length == 7 ) {
		inputform.tel1.focus();
	} 
}
function nexttel2() {
	if( inputform.tel1.value.length == 3 ) {
		inputform.tel2.focus();
	}
}
function nexttel3() {
	if( inputform.tel2.value.length == 4 ) {
		inputform.tel3.focus();
	}
}
function nextemail1() {
	if( inputform.tel3.value.length == 4 ) {
		inputform.email1.focus();
	}	
}











