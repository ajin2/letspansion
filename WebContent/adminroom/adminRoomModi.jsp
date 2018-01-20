<%@ page import="room.RoomDataBean" %>
<%@ page import="room.RoomPictureDataBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/thumbnail-gallery.css" rel="stylesheet">
    
	<script src="${project}js/jquery-3.2.1.js"></script>
	<script src="${project}js/request.js"></script>
	<script src="${project}adminroom/script.js"></script>
	
    <script type="text/javascript">
		//<!--
		var r_id = r_idSplit[1];
	
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
		
		// test
		function alertCheck(data) {
			alert(data);
		}
		//-->
	</script>
	<body onload="pictureSelect()">
		<table>
			<tr>
				<th> <jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/> </th>	
				<td> <jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/> </td>
			</tr>
		</table>

		<form name="roomform" method="post" action="adminRoomModifyDone.do?r_id=${r_id}&r_minperson=${roomform.r_minperson.value}&r_maxperson=${r_maxperson}&r_price=${r_price}&r_content=${r_content}">
			<!-- location adminRoomDetail after saving edited data -->
			//////////////// 방 정보 수정하는 건 아직 미완성 
		<%-- 	<input class="inputbutton" type="button" value="방 수정 완료" onclick="alertCheck(${roomDto.r_minperson})">	
			<input class="inputbutton" type="submit" value="이건되냐"> --%>
			
			<!-- Room Information from pension_room table -->
			<table border="1">
				<tr> 
					<th> ${str_person} :1122 </th>
					<td> 
						<input class="input" type="text" name="r_minperson" value="${roomDto.r_minperson}">
						<input class="input" type="text" onkeydown='return onlyNumber(event)' onfocusout="removeChar(event)" onkeyup='removeChar(event)' 
									style='ime-mode:disabled; text-align:center; width:30px' name="r_minperson2" maxlength="2" value="${roomDto.r_minperson}"> ~ 
	               		<input class="input" type="text" onkeydown='return onlyNumber(event)' onfocusout="removeChar(event)" onkeyup='removeChar(event)' 
	               					style='ime-mode:disabled; text-align:center; width:30px' name="r_maxperson" maxlength="2" value="${roomDto.r_maxperson}"> 
					</td>
				</tr>
				<tr>
					<th> ${str_price} : </th>
					<td> <input class="input" type="text" onkeydown='return onlyNumber(event)' onfocusout="removeChar(event)" onkeyup='removeChar(event)' 
									style='ime-mode:disabled; text-align:right; width:100px' name="r_price" maxlength="7" value="${roomDto.r_price}"> 원 </td>
				</tr>
				<tr>
					<th> ${str_content} : </th>
					<td> <textarea maxlength="7" rows="3" cols="19" name="r_content">${roomDto.r_content}</textarea></td>
				</tr>
			</table>
		</form>
		<!-- FileUpload -->
		<form id="fileForm" action="fileUpload.do" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>
						사진 테스트 : <input type="file" id="file1" name="file1"/>
						<input type="button" value="사진 등록하기" onClick="fileSubmit();">
					</td>
				</tr>
			</table>
		</form>		
		
		<!-- Output picture -->
		<form id="modiForm" action='fileModify.do' method="post" enctype="multipart/form-data">
			<div class="container" id="pictureResult"  style="display:'none'"></div>
		</form>
		
		<hr color="red" size="2" align="left" width="50%">
		<div id="result"></div>
		<div id="test"></div>

	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>


