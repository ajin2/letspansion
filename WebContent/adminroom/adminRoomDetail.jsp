<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	<body>
		<div class="w3-container">
			<h2>Q Room </h2>
			<p> Q Room 사진 </p>
		</div>
	
		<form>
			<table>
				<tr>
					<th> <input type="button" value="${btn_roomAdd}" onclick="location='adminRoomWrite.do'"> </th>
				</tr>
			</table>
		</form>
		
		<div class="w3-content w3-display-container" style="max-width: 800px">
			<img class="mySlides" src="img/roomImg/Q_1.jpg" style="width: 100%">
			<img class="mySlides" src="img/roomImg/Q_2.jpg" style="width: 100%">
			<img class="mySlides" src="img/roomImg/Q_3.jpg" style="width: 100%">
			<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  			<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
			<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width: 100%">
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span> 
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span> 
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
			</div>
		</div>

		<div class="w3-row-padding w3-section">
			<div class="w3-col s4">
				<img class="demo w3-opacity w3-hover-opacity-off" src="img/room/pensionA1.jpg" style="width: 100%" onclick="currentDiv(1)">
			</div>
			<div class="w3-col s4">
				<img class="demo w3-opacity w3-hover-opacity-off" src="img/room/pensionA2.jpg" style="width: 100%" onclick="currentDiv(2)">
			</div>
			<div class="w3-col s4">
				<img class="demo w3-opacity w3-hover-opacity-off" src="img/room/pensionA3.jpg" style="width: 100%" onclick="currentDiv(3)">
			</div>
		</div>
		<script>
			var slideIndex = 1;
			showDivs(slideIndex);

			function plusDivs(n) {
				showDivs(slideIndex += n);
			}

			function currentDiv(n) {
				showDivs(slideIndex = n);
			}

			function showDivs(n) {
				var i;
				var x = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("demo");
				if (n > x.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = x.length
				}
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className.replace(" w3-white", "");
				}
				x[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " w3-white";
			}
			/* Auto Slide 
			var myIndex = 0;
			function carousel() {
			    var i;
			    var x = document.getElementsByClassName("mySlides");
			    for (i = 0; i < x.length; i++) {
			       x[i].style.display = "none";  
			    }
			    myIndex++;
			    if (myIndex > x.length) {myIndex = 1}    
			    x[myIndex-1].style.display = "block";  
			    setTimeout(carousel, 3000); // Change image every 3 seconds
			}
			 */
		</script>
	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>


