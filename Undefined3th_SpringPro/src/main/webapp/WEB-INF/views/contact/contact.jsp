<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact 페이지</title>
<jsp:include page="../ui/myResource.jsp" />
<jsp:include page="../ui/navbar.jsp"></jsp:include>
<style>
.item-box {
   text-align: center;
}
.contactListForm {
   margin: 200px 20px 100px 50px;
   width: 60%;
}

.img-center {
   max-width: 100%;
   height: auto;
}
.mapDiv{
    width: 100%;
   margin: 0 auto;
}
#map {
  bottom:0px;
  height: 400px;
  right: 0px;
}
</style>
<script>
  // Error message in case of fail to load google api map
  function googleError(){
    alert("Fail to load Google map");
  }
</script>
</head>
<body>
   <div class="mainContent">
      <div class="contactListForm">
         <h3>팀원소개</h3>
         <div class='item-box col-xs-12 col-sm-4'>
            <div class="well well-xs">
               <div class='row'>
                  <div class='col-xs-12'>
                     <img id="contact_one" class='img-center'
                        src="<%=request.getContextPath()%>/resources/images/2.png"
                        alt=''>
                  </div>
                  <div class='col-xs-12'>
                     <h4>
                        <strong>윤수현</strong>
                     </h4>
                     <p>
                        	'울트라캡쑝코드마스터'
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <div class='col-xs-12 col-sm-4 item-box'>
            <div class="well well-xs">
               <div class='row'>
                  <div class='col-xs-12'>
                     <img id="contact_two" class='img-center'
                        src="<%=request.getContextPath()%>/resources/images/4.png"
                        alt=''>
                  </div>
                  <div class='col-xs-12'>
                     <h4>
                        <strong>김진국</strong>
                     </h4>
                     <p>
                        	'트둥이 덕후'
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <div class='col-xs-12 col-sm-4 item-box'>
            <div class="well well-xs">
               <div class='row'>
                  <div class='col-xs-12'>
                     <img id="contact_three" class='img-center'
                        src="<%=request.getContextPath()%>/resources/images/1.png"
                        alt=''>
                  </div>
                  <div class='col-xs-12'>
                     <h4>
                        <strong>임지영</strong>
                     </h4>
                     <p>
                        	'쟤보단 낫겠지'에서 '쟤'
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <a href="${pageContext.request.contextPath }/visitor/visitors.do" class="bt-default btn-sm pull-right" style="float: right; text-decoration: none; font-size:15px;">
         	무엇이든지 물어보세요
         </a>
	      <h3 style="clear: both;">오시는길</h3>
	        <!-- Google map part -->
	        <div class="row mapDiv">
	            <div class="col-xs-12 col-md-6">
	                <div id="map"></div>
	            </div>
	            <div id="contact-info" class="col-xs-12 col-md-6">
	                <h4>본사</h4>
	                <p><strong>#UNDEFINED | (주) HBI 연구소 Acorn 아카데미 : 서울특별시 중구 다동88 <br/>동아빌딩15층</strong></p>
	                <p><strong>대표: O O O | 무허가 TEL: 010-2559-0921 </strong></p>
	            </div>
	        </div>
	        <!-- Google map part END-->            
	  </div>
   </div>
   <script>
   $("#contact_one").on("mouseover", function(){
	   $(this).fadeOut("1", function(){
		   $(this).attr("src","<%=request.getContextPath()%>/resources/images/0.png").fadeIn(1000);
	   });
   })
   $("#contact_one").on("mouseout", function(){
	   $(this).fadeOut("1", function(){
      $(this).attr("src","<%=request.getContextPath()%>/resources/images/4.png").fadeIn(1000);
	   });
   })
   $("#contact_two").on("mouseover", function(){
	   $(this).fadeOut("1", function(){
	   $(this).attr("src","<%=request.getContextPath()%>/resources/images/1.png").fadeIn(1000);
	   });
   })
   $("#contact_two").on("mouseout", function(){
	   $(this).fadeOut("1", function(){
	   $(this).attr("src","<%=request.getContextPath()%>/resources/images/4.png").fadeIn(1000);
	   });
   })
   $("#contact_three").on("mouseover", function(){
	   $(this).fadeOut("1", function(){
	   $(this).attr("src","<%=request.getContextPath()%>/resources/images/2.png").fadeIn(1000);
	   });
   })
   $("#contact_three").on("mouseout", function(){
	   $(this).fadeOut("1", function(){
	   $(this).attr("src","<%=request.getContextPath()%>/resources/images/4.png").fadeIn(1000);
	   });
   })
   </script>
    <!-- Google API -->
    <script async defer
        src= "https://maps.googleapis.com/maps/api/js?libraries=places,geometry,drawing&key=AIzaSyBIkqvtFh0pIqMEl0PniMK8_ciIHAYnaS8&v=3&callback=initMap" onerror="googleError()">
    </script>
    <script>
    // Google map part
    var map;
    var infowindow;

    function initMap() {
        //locations Setting
        var location = {
            title: 'Acorn Academy',
            location: {lat: 37.567758, lng: 126.982301},
            imgURL: "<%=request.getContextPath()%>/resources/images/donga.png"
        };

        // Create map object
        map = new google.maps.Map(document.getElementById('map'), {
    		center: {lat: 37.567758, lng: 126.982301},
    		zoom: 14,
    		mapTypeControl: false
    	});

        infowindow = new google.maps.InfoWindow();

        // Marker Icon
        var defaultIcon = makeMarkerIcon('0091ff');

        // Create Map marker
        var marker = new google.maps.Marker({
            map: map,
            animation: google.maps.Animation.DROP,
            position: location.location,
            title: location.title,
            icon: defaultIcon
        });

        marker.addListener('click', function() {
            infowindow.setContent("<div><h4>"+location.title+"</h4><p>동아빌딩 15층 Acorn Academy</p><img src='"+location.imgURL+"'style='width:70%;'></div>")
            infowindow.open(map,this);
        })

        function makeMarkerIcon(markerColor) {
    		var markerImage = new google.maps.MarkerImage(
    			'http://chart.googleapis.com/chart?chst=d_map_spin&chld=1.15|0|'+ markerColor +
    			'|40|_|%E2%80%A2',
    			new google.maps.Size(21, 34),
    			new google.maps.Point(0, 0),
    			new google.maps.Point(10, 34),
    			new google.maps.Size(21,34));
    		return markerImage;
    	}
    }    
    </script>
</body>
