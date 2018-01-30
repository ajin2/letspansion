/**
 * 회원관리
 */

var iderror = "아이디를 입력하세요.";
var confirmerror = "중복확인을 하지 않았습니다.";
var passwderror = "비밀번호를 입력하세요.";
var repasswderror = "비밀번호가 다릅니다.";
var nameerror = "이름을 입력하세요.";
var juminerror = "주민등록번호를 입력하세요.";
var telerror = "전화번호를 입력하세요.";
var emailerror = "이메일이 형식에 맞지 않습니다.";
var emailnoerror = "이메일을 입력하세요.";
var zipcodeerror = "우편번호를 입력하세요.";
var adderror = "주소를 입력하세요.";
var ziperror = "읍/면/동 을 입력하세요.";
var emailconfirm_false = "이메일 인증을 해주세요.";
var senderror = "이메일이 전송되었습니다.";

var inputerror = "회원가입에 실패했습니다. \n잠시 후 다시시도하세요.";
var loginiderror = "입력하신 아이디가 없습니다.";
var loginpasserror = "입력하신 비밀번호가 다릅니다.";
var deleteerror = "회원탈퇴에 실패했습니다. \n잠시 후 다시시도하세요.";
var emailconfirmerror = "인증번호가 일치하지 않습니다.";
var emailconfirm = "인증에 성공했습니다.";
var finderror = "아이디 / 비밀번호 찾기에 실패했습니다. \n잠시 후 다시시도하세요.";
var delete_ok_error = "회원탈퇴가 성공적으로 완료되었습니다. \n계속하시려면 확인을 눌러주세요. \n취소버튼을 누르면 메인으로 이동합니다.";
var deleteconfirm = "회원을 탈퇴하시겠습니까?";
var returnValue = "false";	
var logindeletederror = "삭제된 아이디 입니다.";
var inputdone = "회원가입이 완료 되었습니다";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

function loginalert( msg ) {
	alert( msg );
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
	if( viewform.tel1.value  ) {
		if( viewform.tel1.value.length < 11 ) {
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

function findfocus(){
	findform.name.focus();
}

function findpfocus(){
	findform.id.focus();
}
 

function findcheck(){
  
	/*if(!findform.name.value){
		alert(nameerror);
		findform.email.focus();
		return false;
	}*/ if(!findform.email.value){
		alert(emailnoerror);
		findform.email.focus();
		return false;
	}
}

function findpcheck(){
	 if(!findform.email.value){
		alert(emailnoerror);
		findform.email.focus();
		return false;
	} else if(!findform.id.value){
		alert(iderror);
		findform.id.focus();
		return false;
	}
}

function findpasswdcheck(){
	if(!findform.passwd.value){
		alert(passwderror);
		findform.passwd.focus();
		return false;
	} else if(!findform.repasswd.value){
		alert(passwderror);
		findform.repasswd.focus();
		return false;
	} else if(findform.passwd.value != findform.repasswd.value){
		alert(repasswderror);
		findform.repasswd.focus();
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
///////email 인증
/*function emailcheck(email1, email2, emailvalue){
    // 인증을 위해 새창으로 이동
	var url="emailckeck.do?email1="+email1+"&email2="+email2+"&emailvalue="+emailvalue;
	open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=600, height=400" );
}*/

function confirmemail(emailconfirm_value, authNum, emailvalue){
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!emailconfirm_value || emailconfirm_value != authNum){
		alert(emailconfirmerror);
		emailconfirm_value="";
		self.close();
    // 인증코드가 일치하는 경우
	}else if(emailconfirm_value==authNum){
		alert(emailconfirm);
		emailconfirm_value="";
		self.close();
		if(emailvalue == "0"){
			opener.document.inputform.emailconfirm_value.value = "1";
		} else if(emailvalue == "1"){
			opener.document.viewform.emailconfirm_value.value = "1";
		}
	}
}
// 회원 가입
function inputfocus() {
	inputform.id.focus();
}
function inputcheck(){
	if(inputform.confirm.value == "0"){
		alert(confirmerror);
		inputform.id.focus();
		return false;
	}if(inputform.emailconfirm_value.value == "0"){
		alert(emailconfirm_false);
		inputform.email1.focus();
		return false;
	} else if(!inputform.id.value){	// 값이 없냐
		alert(iderror);
		inputform.id.focus();
		return false;
	} else if(!inputform.passwd.value){
		alert(passwderror);
		inputform.passwd.focus();
		return false;
	} else if(!inputform.repasswd.value){
		alert(passwderror);
		inputform.repasswd.focus();
		return false;
	} else if(inputform.passwd.value != inputform.repasswd.value){
		alert(repasswderror);
		inputform.repasswd.focus();
		return false;
	} else if(!inputform.name.value){
		alert(nameerror);
		inputform.name.focus();
		return false;
	} else if(!inputform.tel1.value){
		alert(telerror);
		inputform.email1.focus();
		return false;
	}else if(!inputform.email1.value){
		alert(emailerror);
		inputform.email1.focus();
		return false;
	} 
	if(!inputform.email1.value || !inputform.email2.value){ 
		alert(emailerror);
		inputform.email1.focus();
		return;
	} if(inputform.email1.value){
			if(inputform.email2.value==0){
				// 직접입력
				if(inputform.email1.value.indexOf("@")==-1){
					alert(emailerror);
					inputform.email1.focus();
					return false;
				}
			}else{
				// 선택입력
				if(inputform.email1.value.indexOf("@")!=-1){
					alert(emailerror);
					inputform.email1.focus();
					return false;
				}
			}
		}
	
	if(!inputform.postcode.value){
		alert(zipcodeerror);
		inputform.postcode.focus();
		return false;
	} else if(!inputform.address.value){
		alert(adderror);
		inputform.address.focus();
		return false;
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











