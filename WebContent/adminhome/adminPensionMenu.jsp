<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<a href="adminPensionHome.do">Home</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerroomchk();">관리자 Room</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerbookchk();">관리자 Book</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerqnachk();">관리자 Q & A</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerafterchk();">관리자 후기</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="findPension.do"> 찾아 오는 길</a> &nbsp; ㅣ &nbsp;
		<a href="adminChatting.do"> 1:1 채팅하기 </a> &nbsp; ㅣ &nbsp;
		
		<script type="text/javascript">
		//<!-- 에러 아니니 신경 X
			function managerroomchk(){
			    if(${sessionScope.adminId != null}){
			        location.href = "adminRoomList.do";
			        return true;
			    } else {
			    	var adminloginerror = "로그인해야지";
			    	alert( adminloginerror );
			        return false;
			    }
			}
			function managerbookchk(){
			    if(${sessionScope.adminId != null}){
			        location.href = "adminBookPro.do";
			        return true;
			    } else {
			    	var adminloginerror = "어디가 로그인해야지";
			    	alert( adminloginerror );
			        return false;
			    }
			}
			function managerqnachk(){
			    if(${sessionScope.adminId != null}){
			        location.href = "adminQnaPro.do";
			        return true;
			    } else {
			    	var adminloginerror = "로그인안해?";
			    	alert( adminloginerror );
			        return false;
			    }
			}
			function managerafterchk(){
			    if(${sessionScope.adminId != null}){
			        location.href = "adminAfterPro.do";
			        return true;
			    } else {
			    	var adminloginerror = "로그인 하고 가";
			    	alert( adminloginerror );
			        return false;
			    }
			}
		//-->
		</script>
	</body>
</html>

