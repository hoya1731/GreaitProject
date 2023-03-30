<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
	<head>
	<!-- 한성준 03-16 카카오맵 지도 -->
  <meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>극장지도</title>
    
    
	<link rel="stylesheet" href="<%=contextPath%>/eq/css/map.css">
	<link rel="stylesheet" href="<%=contextPath%>/eq/css/myCss.css">
 	<link rel="stylesheet" href="<%=contextPath%>/eq/js/jquery.bxslider.min.css">
	<link href="<%=contextPath %>/eq/css/sidebars.css" rel="stylesheet">
	
	<style type="text/css">
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;height:500px;}
		.bg_white {background:#fff;position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
	    #placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;} 
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
		
		.findMap{
			width : 98%;
			margin: auto;
			margin-top: 30px;
		}
		
		.findMap hr{
			border : 2px solid gray;
			width : 90%;
		}
		
	
	</style>
	
	</head>
		<!-- 부트스트랩 이용을 위한 jQuery와 CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<body>
	<center>
		<div class="findMap">
			<img alt="지도찾기" src="<%=contextPath%>/eq/img/banner/moviemapbanner.jpg" width="98%">
			
			<hr>
		
		<div class="map_wrap">
		    <div id="map" style="width:80%;height:500px;position:relative;overflow:hidden;"></div>	
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		                    키워드 : <select value=" " id="key1">
		                    		<optgroup label="경상남도">
			                    		<option value="양산" selected>양산</option>
		                    			<option value="거제">거제</option>
		                    		</optgroup>
		                    		<optgroup label="서울특별시">
		                    			<option value="서울">서울</option>
		                    		</optgroup>
		                    		<optgroup label="광역시">
	                    				<option value="부산">부산</option>
	                    				<option value="대전">대전</option>
	                    				<option value="울산">울산</option>
	                    			</optgroup>
	                    			<optgroup label="경기도">
	                    				<option value="광주">광주</option>
	                    			</optgroup>
	                    			<optgroup label="제주특별자치도">
	                    				<option value="제주도">제주도</option>
	                    			</optgroup>
		                    	   </select><br>
		                    검색 : <input type="text" value="메가박스" id="key2" size="15"><br>
		                    <button type="submit">검색하기</button> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div><br><br>
		</div>
        <!-- 부트스트랩 primary 버튼 -->
		<button type="button" class="btn btn-lg btn-outline-secondary" onclick="getCurrentPosBtn()">내 위치 가져오기</button>
		<br><br>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=03ee57845e2ad12c56c633932350ce12&libraries=services"></script>
		<script>
			// 마커를 담을 배열입니다
			var markers = [];
			let presentPosition;
	
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도의 중심좌표
			        level: 3, // 지도의 확대 레벨
// 			        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
			    }; 
			
			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		    if (navigator.geolocation) {
		        
		        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		        navigator.geolocation.getCurrentPosition(function(position) {
		            
		            var lat = position.coords.latitude, // 위도
		                lon = position.coords.longitude; // 경도
		            
		            var locPosition = new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표
		            presentPosition=locPosition;
		     
		            map.setCenter(locPosition);   
		                
		          });
		        
		    } else { // HTML5의 GeoLocation을 사용할 수 없을때 
		        
		        var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567)
		        alert('현재 위치를 찾을 수 없습니다!');
		    }
			
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  
			
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			// 키워드로 장소를 검색합니다
			searchPlaces();
			
			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {
			
			    var key1 = document.getElementById('key1').value;
				var key2 = document.getElementById('key2').value;
			    
				var keyword = key1+ key2;
				
			    if (!key2.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    }
			
			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB); 
			}
			
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			
			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);
			
			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);
			
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
			
			    } else if (status === kakao.maps.services.Status.ERROR) {
			
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
			
			    }
			}
			
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
			
			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);
			
			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {
					
			    	const lon = places[i].x;
		            const lat = places[i].y;
			    	
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
					
			     	// 마커와 검색결과 항목에 mouseover 했을때
			        // 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // mouseout 했을 때는 인포윈도우를 닫습니다
			        (function(marker, title) {
			        	kakao.maps.event.addListener(marker, 'mouseover', function() {
		                    displayInfowindow(marker, title);
		                });
		     
		                kakao.maps.event.addListener(marker, 'mouseout', function() {
		                    infowindow.close();
		                });
			        	
// 			        	kakao.maps.event.addListener(marker, 'click', function() {
// 				            displayInfowindow(marker, title)
// 				        });
			
			            itemEl.onmouseover =  function () {
			                displayInfowindow(marker, title);
			            };
			
			            itemEl.onmouseout =  function () {
			                infowindow.close();
			            };
			        })(marker, places[i].place_name);
			
			        fragment.appendChild(itemEl);
			        
			        // 마커와 검색 결과를 클릭했을때 좌표를 가져온다
		            (function(marker, title) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    searchDetailAddrFromCoords(presentPosition, function(result, status) {
		                        if (status === kakao.maps.services.Status.OK) {
		                            detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
		                            location.href = "https://map.kakao.com/?sName="+detailAddr+"&eName="+title
		                        }
		                    });
		                })
		     
	                itemEl.onclick =  function () {
	                    searchDetailAddrFromCoords(presentPosition, function(result, status) {
	                        if (status === kakao.maps.services.Status.OK) {
	                            detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
	                            location.href = "https://map.kakao.com/?sName="+detailAddr+"&eName="+title                                          
	                      	  }   
		                   });
		                };
		            })(marker, places[i].place_name);
		     
		            fragment.appendChild(itemEl);
			    }
			
			    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;
			
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}
			
			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
			
			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h5>' + places.place_name + '</h5>';
			
			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
			    } else {
			        itemStr += '    <span>' +  places.address_name  + '</span>'; 
			    }
			                 
			      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			                '</div>';           
			
			    el.innerHTML = itemStr;
			    el.className = 'item';
			
			    return el;
			}
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage
			        });
				
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			
			    return marker;
			}
			
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
			
			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i; 
			
			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }
			
			    for (i=1; i<=pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;
			
			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }
			
			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}
			
			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>'
			    			
			    infowindow.setContent(content);
			    infowindow.open(map, marker);
//			    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			}
			
			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			function locationLoadSuccess(pos){
			    // 현재 위치 받아오기
			    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

			    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
			    map.panTo(currentPos);
			    
			    /* // 마커 생성
			    var marker = new kakao.maps.Marker({
			        position: currentPos
			    });

			    // 기존에 마커가 있다면 제거
			    marker.setMap(null);
			    marker.setMap(map); */
			};

			function locationLoadError(pos){
			    alert('위치 정보를 가져오는데 실패했습니다.');
			};

			// 위치 가져오기 버튼 클릭시
			function getCurrentPosBtn(){
			    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
			    
				//지도 레벨을 2으로 한뒤, 애니메이션 효과 옵션 설정
			    map.setLevel(2, {animate: true});
			};
			 // 좌표 -> 주소
		    var geocoder = new kakao.maps.services.Geocoder();
		    function searchDetailAddrFromCoords(coords, callback) {
		        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		    }
		</script>
		</center>
	</body>
</html>