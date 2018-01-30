<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body> 
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>
	<br><br><br>
	<table class='table table-striped table-bordered table-hover'>
		<tr>
			<th> 주소 </th>
			<td> 서울특별시 강남구 테헤란로 14길 6 남도빌딩 4F Q강의실 (Tel: +82 10-4500-1723 / F: 070-1234-5678) </td>
		</tr>
		<tr>
			<th> 버스 </th>
			<td> 역삼역.포스코P&S타워 정류장 <br>
				<img src="${project}img/location/sub01_06_busB.jpg" alt="지선">  146 / 740 / 341 / 360 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="${project}img/location/sub01_06_busR.jpg" alt="간선">  1100 / 1700 / 2000 / 7007 / 8001
			</td>
		</tr>
		<tr>
			<th> 지하철 </th>
			<td> 지하철 2호선 역삼역 3번출구 100m </td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- googleMap 크기를 프로젝트 크기에 맞게 조절해주세요 -->
				<div id="googleMap" style="width: 100%; height: 400px;"></div>
			</td>
		</tr>
	</table>

	<script>
 		function myMap() {
			var myCenter = new google.maps.LatLng(37.4991233,127.0329797);	// 학원 좌표
			var mapCanvas = document.getElementById("googleMap");
			var zoomSize = 14;
			var mapOptions = {center: myCenter, zoom: zoomSize};
			var map = new google.maps.Map(mapCanvas, mapOptions);

			// Animation function
			var marker = new google.maps.Marker({
				position:myCenter,
				animation: google.maps.Animation.BOUNCE
			});
			
			marker.setMap(map);
			
			// Zoom function
			google.maps.event.addListener(marker,'click',function() {			
				zoomSize += 2;
				map.setZoom(zoomSize);
				map.setCenter(marker.getPosition());
			});
		}
		
 	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXzJV-FAbAusCWqcfyDXtkNK9lrqrzTcc&callback=myMap"></script>
</body>
</html>

