<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="container" style="height: 710px;">
		
		<h2>오시는길</h2>
      <p>지도가 안보일시에는 <a href="http://www.mmso.or.kr/map.do">http://www.mmso.or.kr/map.do</a> 로 들어와 봐주시기 바랍니다.</p> 
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">국립과천과학관 오시는길</a></li>
			<li><a data-toggle="tab" href="#menu1">주관사</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<script type="text/javascript"
				src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=rkO8P4yl0MKcGx_rhomX"></script>
				<p style="margin-left: 20px"></p>
			<div id="map2" style="border: 1px solid rgb(245, 245, 245);;margin-left: 20px; float: left;margin-top: 10px"></div>
                
			
                <div class="well well-sm" style="padding-left: 500px;">
                    <p>지하철 이용시</p>
<br>
 <p>4호선 대공원역 6번 출구 바로 앞</p>
 <p>4호선 경마공원역 5번 출구 (도보 약 10분 소요)</p>
<br>
  <p>자가용 이용시</p>
<br>
 <p>01 과천/사당방면에서 오시는 길</p>
 <p>과천대로 >  대공원 방면으로 고가도로 >  대공원역 삼거리에서 좌회전 >  약 600m 진행 후 좌회전 >  주차장입구</p>
 <p>02 양재/선바위방면에서 오시는 길</p>
 <p>과천대로 >  경마공원역 방향으로 직진 >  과천과학관 출입구로 우회전 >  주차장입구</p>
 <p>03 수원/안양방면에서 오시는길</p>
 <p>과천대로 >  사당 방면으로 지하차도 옆길 >  대공원방면으로 우회전 >  주차장입구</p>
 <p>04 고속도로 이용시</p>
 <p>영동, 경부 고속도로 이용 시</p>
 <p>양재IC >  양재대로(과천방향) >  선바위검문소에서 좌회전 >  경마공원 >  과천과학주차장</p>
 <p>서해안고속도로 이용 시</p>
 <p>조남 JC >  서울외곽순환도로(판교방향) >  평촌IC지나서 >  학의분기점(과천방면) >  과천터널 후 서울방향 >  오른쪽차선으로 진행 >  대공원방향으로 우회전 >  주차장입구</p>
                </div>
			<!-- <div id="map2" style="border: 1px solid #000;margin-left: 20px; float: left;"></div> -->
			<script type="text/javascript">
				var oPoint = new nhn.api.map.LatLng(37.4382450, 127.0059150);
				nhn.api.map.setDefaultPoint('LatLng');
				oMap = new nhn.api.map.Map('map2', {
					center : oPoint,
					level : 10, // - 초기 줌 레벨은 10이다.
					enableWheelZoom : true,
					enableDragPan : true,
					enableDblClickZoom : false,
					mapMode : 0,
					activateTrafficMap : false,
					activateBicycleMap : false,
					activateRealtyMap : true,
					minMaxLevel : [ 1, 14 ],
					size : new nhn.api.map.Size(450, 400)
				});
				var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
				mapZoom.setPosition({
					left : 20,
					bottom : 20
				}); // - 줌 컨트롤 위치 지정.
				oMap.addControl(mapZoom); // - 줌 컨트롤 추가.

				var oSize = new nhn.api.map.Size(28, 37);
				var oOffset = new nhn.api.map.Size(14, 37);
				var oIcon = new nhn.api.map.Icon(
						'http://static.naver.com/maps2/icons/pin_spot2.png',
						oSize, oOffset);
				// - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
				// - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
				// - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.

				var oMarker1 = new nhn.api.map.Marker(oIcon, {
					title : '국립과천과학관 '
				}); //마커 생성 
				oMarker1.setPoint(oPoint); //마커 표시할 좌표 선택
				oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
				var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
				oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
				oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기
			</script>
			</div>
			<div id="menu1" class="tab-pane fade">
				<script type="text/javascript"
				src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=rkO8P4yl0MKcGx_rhomX"></script>
				<p style="margin-left: 20px">
			<div id="map" style="border: 1px solid rgb(245, 245, 245);;margin-left: 20px; float: left;margin-top: 10px"></div>
                <div class="well well-sm" style="padding-left: 500px;">
                    <img alt="map2" src="img/map2.jpg" style="max-width: 100%; height: auto; text-align: center; margin-bottom: 15px">
			</div>
			<!-- <div id="map2" style="border: 1px solid #000;margin-left: 20px; float: left;"></div> -->
			<script type="text/javascript">
				var oPoint = new nhn.api.map.LatLng(37.4017734, 126.9680896);
				nhn.api.map.setDefaultPoint('LatLng');
				oMap = new nhn.api.map.Map('map', {
					center : oPoint,
					level : 10, // - 초기 줌 레벨은 10이다.
					enableWheelZoom : true,
					enableDragPan : true,
					enableDblClickZoom : false,
					mapMode : 0,
					activateTrafficMap : false,
					activateBicycleMap : false,
					activateRealtyMap : true,
					minMaxLevel : [ 1, 14 ],
					size : new nhn.api.map.Size(450, 400)
				});
				var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
				mapZoom.setPosition({
					left : 20,
					bottom : 20
				}); // - 줌 컨트롤 위치 지정.
				oMap.addControl(mapZoom); // - 줌 컨트롤 추가.

				var oSize = new nhn.api.map.Size(28, 37);
				var oOffset = new nhn.api.map.Size(14, 37);
				var oIcon = new nhn.api.map.Icon(
						'http://static.naver.com/maps2/icons/pin_spot2.png',
						oSize, oOffset);
				// - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
				// - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
				// - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.

				var oMarker1 = new nhn.api.map.Marker(oIcon, {
					title : '안양 메가밸리 '
				}); //마커 생성 
				oMarker1.setPoint(oPoint); //마커 표시할 좌표 선택
				oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
				var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
				oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
				oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기
			</script></p>
			</div>
		</div>
	</div>