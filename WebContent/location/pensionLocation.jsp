<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body> 
	<jsp:include page="/home/pensionHeader.jsp" flush="false"/>
	
	<!-- googleMap 크기를 프로젝트 크기에 맞게 조절해주세요 -->
	<div id="googleMap" style="width: 100%; height: 400px;"></div>

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

