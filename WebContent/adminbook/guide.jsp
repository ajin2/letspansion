<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>
    <body>
    	
    	<pre style="background:#2d5475">
    	
    	
    	
    	
    	
    	
    	
    	</pre>
    	
    	<pre>
    	
    	* <font size="3em" color="navy"><b>예약 안내</b></font> *
    	
    	
    	예약 시 환불기준을 숙지하시고 예약하시기 바랍니다.

	-  입금대기시간이 경과되면 자동으로 예약신청이 취소됩니다.
	-  입금 시 반드시 예약자명으로 입금해주셔야 확인가능하며, 입금자명이 다를 경우 반드시 펜션으로 연락을 주셔야 합니다.​
	
	• 입금 계좌
	
	     신한 110-273-381245 (예금주 : 김대호)
	
	• 예약문의
	
	     휴대전화 : 010-1234-5678    일반전화 : 02-111-2222

	• 입금 대기시간
	
	    1) 예약신청 후 3시간 내로 전액을 입금하셔야 예약이 완료 됩니다.
	    2) 당일 예약 / 하루전 예약시 1시간 내로 결제를 완료 해 주셔야 합니다.
	    ※ 입금 대기 시간이 경과되면 예약신청이 자동 취소됩니다.

	• 추가인원 요금
	
	    1 인 20,000
    	</pre>
    	
    	<pre>
    	
    	* <font size="3em" color="navy"><b>이용 안내</b></font> *
    	
    	
    	• 입실시간 : 15 시 ( 20 시 이후의 입실은 사전에 반드시 연락을 주시기 바랍니다. )
	• 퇴실시간 : 11 시
	
	1. 궁금하신 사항은 언제든 펜션주에게 문의주세요^^ 
	2. 보호자를 동반하지 않은 미성년자는 어떠한 경우에도 입실 하실 수 없습니다.
	3. 오후 10시 이후의 바비큐장 이용 및 고성방가는 타 객실 손님을 위하여 금하오니 양해바랍니다.
	4. 객실 내에서는 금연입니다.
	5. 애완동물은 부득이 타 객실 및 손님을 위해 입실을 금하오니 양해 바랍니다.
	6. 바비큐는 화재 및 냄새로 인한 타 손님의 배려 차원에서 지정된 장소에서만 이용 가능합니다.
	7. 퇴실 시 음식물을 비롯한 모든 쓰레기는 분리 수거해 주시고, 사용하신 주방기구는 다음 손님을 위해 세척 해 주시기 바랍니다. 
	8. 객실 정리가 끝나시면 펜션지기에게 연락하시어 퇴실점검을 받으시기 바랍니다.
    	</pre>
    	
    	
    	<pre>
    	
    	* <font size="3em" color="navy"><b>환불 안내</b></font> *
    	
    	
    	1. 올바른 예약문화 정착을 위하여 더모스트펜션에서는 예약취소 시 환불기준을 아래와 같이 운영하고 있으니 확인하시고 예약해 주시기 바랍니다.
	2. 취소 환불은 객실요금 100% 입금 시 적용됩니다.
	3. 입실 당일 ~ 입실 3일 전 예약취소 시 환불이 불가능합니다.
		
		<table border="1" style="margin-left:50px;">
			<tr>
				<th> 이용 당일 ~ 이용 3일전 </th>
				<th> 이용 4일전 </th>
				<th> 이용 5일전 </th>
				<th> 이용 6일전 </th>
				<th> 이용 7일전 </th>
			</tr>
			<tr>
				<td> 환불 불가 </td>
				<td> 60% 환불 </td>
				<td> 60% 환불 </td>
				<td> 80% 환불 </td>
				<td> 80% 환불 </td>
			</tr>
		</table>
		</pre>
    	
    	<br>
    	<form name="checkform">
	    	<input type="checkbox" value="0" name="agreecheck" style="margin-left:70px;margin-top:30px;" onchange="checkvalue(1)">
	    	${str_agreecheck}
	    	<input class="btn btn-success" type="button" value="${btn_book}" onclick="agreecheckDo()" style="margin-left:10px;">
    	</form>
    	<br><br><br>
    	
    	
    	<script type="text/javascript">
    	function checkvalue(check){
    		checkform.agreecheck.value = check;
    	}
    	
    	function agreecheckDo(){
    		if(checkform.agreecheck.value == 0){
    			alert('${str_agreecheck0}');
    			return;
    		}else{
    			window.location.href = "adminBookPro.do";
    		}    		
    	}
    	</script>
    	
    </body>
    <jsp:include page="/home/pensionBottom.jsp" flush="false"/>