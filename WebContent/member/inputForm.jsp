<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
       <style type="text/css">
			button{
				color:red;
				}
		</style>
		
    <body onload="inputfocus()">
   
      <article class="container">
        <div class="page-header">
          <h1>회원가입 <small>Let's Pension</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form method="post" action="logonInputPro.do" name="inputform" onsubmit="return inputcheck()">
            <input type="hidden" name="confirm" value="0">
       		<input type="hidden" name="emailconfirm_value" value="0">
            
            <div class="form-group">
              <label for="inputId" id="a">*${str_id}</label>
              <div class="input-group">
              <input type="text" class="form-control" name="id" placeholder="아이디">
              <span class="input-group-btn">
                 <button class="btn btn-success" type="button" onclick="confirmid()">${btn_confirm}<i class="fa fa-mail-forward spaceLeft"></i></button>
              </span>
              </div>
            </div>
            
            <div class="form-group">
              <label for="InputPassword1">*${str_passwd}</label>
              <input type="password" class="form-control" name="passwd" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword2">*비밀번호 확인</label>
              <input type="password" class="form-control" name="repasswd" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요">
            </div>
            
            <div class="form-group">
              <label for="inputtel" id="a">전화번호</label>
              <input type="text" class="form-control" name="tel1" placeholder="-없이 입력해주세요">
            </div>
            
            <div class="form-group">
              <label for="inputEmail" id="a">*${str_email}</label>
              <div class="input-group">
              <input type="text" class="form-control" name="email1" placeholder="email을 입력해주세요" style="width:200px">
              <label>@</label>
              <select class="custom-select" name="email2" style="width:200px" >
                  <option value="0"> 직접입력 </option>
                      <option value="naver.com"> 네이버 </option>
                      <option value="daum.net"> 다음 </option>
                      <option value="gmail.com"> 구글 </option>
                      <option value="nate.com"> 네이트 </option>
                 </select> 
              <span class="input-group-btn">
                 <button class="btn btn-success" type="button" name="emailconfirm" onclick="emalicheck(inputform.email1.value, inputform.email2.value, 0)">${btn_email}<i class="fa fa-mail-forward spaceLeft"></i></button>
              </span>
              </div>
            </div>
            <script type="text/javascript">
   				//<!--
         			function emalicheck(email1,email2, emailvalue){
        			var url="emailckeck.do?email1="+email1+"&email2="+email2+"&emailvalue="+emailvalue;
        			open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=600, height=400" );
         			}
      
   				//-->
   			</script>
            <div class="form-group">
              <label for="inputpostcode" id="a">*${str_postcode}</label>
             <div class="input-group">
              <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호">
            <span class="input-group-btn">
              <button class="btn btn-success" type="button" onclick="sample2_execDaumPostcode()">우편 검색<i class="fa fa-mail-forward spaceLeft"></i></button>
            </span>
            </div>
            </div>
            <div class="form-group">
              <label for="inputpostcode" id="a"></label>
              <input class="form-control" type="text" id="address" name="address" placeholder="주소">
            </div>
            <div class="form-group">
              <label for="username">*상세주소</label>
              <input type="text" class="form-control" id="detailadd" name="detailadd" placeholder="상세주소를 입력해주세요">
            </div>
            
            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
  				 // 우편번호 찾기 화면을 넣을 element
   					var element_layer = document.getElementById('layer');

   					function closeDaumPostcode() {
       					// iframe을 넣은 element를 안보이게 한다.
       				element_layer.style.display = 'none';
   					}

   					function sample2_execDaumPostcode() {
       					new daum.Postcode({
           			oncomplete: function(data) {
               // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = data.address; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 기본 주소가 도로명 타입일때 조합한다.
               if(data.addressType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('address').value = fullAddr;
               
               document.getElementById('detailadd').focus();
               // iframe을 넣은 element를 안보이게 한다.
               // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
               
           },
           width : '100%',
           height : '100%'
       }).open();

       // iframe을 넣은 element를 보이게 한다.
       element_layer.style.display = 'block';

       // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
       initLayerPosition();
   }

   // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
   // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
   // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
   function initLayerPosition(){
       var width = 300; //우편번호 서비스가 들어갈 element의 width
       var height = 460; //우편번호 서비스가 들어갈 element의 height
       var borderWidth = 5; //샘플에서 사용하는 border의 두께

       // 위에서 선언한 값들을 실제 element에 넣는다.
       element_layer.style.width = width + 'px';
       element_layer.style.height = height + 'px';
       element_layer.style.border = borderWidth + 'px solid';
       // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
       element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
       element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
   }
</script>
            
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">${btn_in}<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-warning" onclick="location='pensionHome.do'">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </article>
 </body>

    