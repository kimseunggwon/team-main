<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ga" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<meta charset="UTF-8">
<title>Google Analytics API</title>
</head>
<body>
	<div class="container">
		<canvas id="siteUse"></canvas>
		
		<h1>구글 애널리틱스</h1>

<h1>Hello Analytics Reporting API V4</h1>

<!-- The Sign-in button. This will run `queryReports()` on success. -->
<!-- p class="g-signin2" data-onsuccess="queryReports"-->

<!-- The API response will be printed here. -->
<textarea cols="80" rows="20" id="query-output"></textarea>

<script>
  // Replace with your view ID.
  var VIEW_ID = '248683561';

  // Query the API and print the results to the page.
  function queryReport (startDate, endDate, expression, name, label) {
		
		var key = new Array();
		var value = new Array();
		
		var param = {
				startDate : startDate,
				endDate : endDate,
				metrics : expression,
				dimensions : name
			}
		$.ajax({
			method: 'GET',
			dataType: 'json',
			url:_ctx + "${appRoot}/get/ga",
			data:param,
			async:false,
			success:function(result){
				console.log(result);
				for(var i=0; i<result.length; i++){
			    	key[i]=result[i].dimensions[0];
			    	value[i]=result[i].metrics[0].values[0];
				}
				 
			},
			error:function(error){
				
			}
		})

	    	main.drawChart(key,value,label); 
	}
	
	function drawChart (key, value, label_name){
		
		for(var i=0; i<key.length; i++){
			var year=key[i].substring(0,4);
			var month=key[i].substring(4,6);
			var date=key[i].substring(6,8);
			
			key[i]=month+'-'+date;
		}
		
		 /*차트*/
		 var ctx = document.getElementById('siteUse').getContext('2d');
		 var myChart = new Chart(ctx, {
		     type: 'line',
		     data: {
		         labels: key,
		         datasets: [{
		        	 label : label_name,
		             data: value,
		             backgroundColor: [
		                 'rgba(255, 255, 255, 0)'
		             ],
		             borderColor: [
		                 'rgba(244, 121, 42, 1)'
		             ],
		             borderWidth: 1
		         }]
		     },
		     options: {
		         scales: {
		             yAxes: [{
		                 ticks: {
		                     beginAtZero: true
		                 },
		             }]
		         }
		     }
		 });

		
	}


  function displayResults(response) {
    var formattedJson = JSON.stringify(response.result, null, 2);
    document.getElementById('query-output').value = formattedJson;
  }
</script>

<!-- Load the JavaScript API client and Sign-in library. -->
<script src="https://apis.google.com/js/client:platform.js"></script>


	</div>
</body>
</html>