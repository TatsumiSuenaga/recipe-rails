/*Author: Tatsumi Suenaga
Description: custom.js currently contains JS only meant for home.html.erb yummily search function
*/
var go = function () {
	$('[data-toggle="offcanvas"]').click(function () {
    		$('.row-offcanvas').toggleClass('active')
  	});
	$("#searchfield").keyup(function(event){
    		if(event.keyCode == 13){
        		$("#search").click();
   	 	}
	});
	$('#search').click(function(){
		var xmlhttp = new XMLHttpRequest();
		var baseURL = 'http://api.yummly.com/v1/api/recipes?_app_id=2857ec1f&_app_key=df850babfefb762882d0e2357d74fc4a&q=';
		var searchString = '';
		searchString = $('#searchfield').val();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				callback(xmlhttp.responseText);
			}
		}
		xmlhttp.open("GET", baseURL + searchString + '&requirePictures=true', true);
		xmlhttp.send();

		function callback(response) {
			var arr = JSON.parse(response);
			var out = '';
			if (arr.totalMatchCount > 0) {
				var max = 10;
				if (arr.totalMatchCount < 10 && arr.totalMatchCount > 0) {
					max= arr.totalMatchCount;
				}
				out += '<h3>Yummly Recipes</h3>';
				var i; //recipe iterator
				for (i = 0; i < max; i++) {
					out += '<div id="box"><div class="title"><h4>' + arr.matches[i].recipeName + '</h4></div>';
					out += '<img src="' + arr.matches[i].smallImageUrls + '" alt="recipe image" width ="240" height="240"><br>';
					out += '<div class="ingredients"><p>';
					var z; //ingredients iterator
					for (z = 0; z < arr.matches[i].ingredients.length; z++) {
						if (z != arr.matches[i].ingredients.length - 1) {
							out += arr.matches[i].ingredients[z] + ', ';
						} else {
							out += arr.matches[i].ingredients[z] + '</p><p><a class="btn btn-default" href="http://yummly.com/recipe/' + arr.matches[i].id+'" role="button" target="_blank" >View on Yummly »</a></p></div></div></div>';
						}
					}
				}
				
			} else {
				out += '<h3>No match found!</h3>';
			}
			
			document.getElementById("result").innerHTML = out;
		}
	});
}
$(document).ready(go);
$(document).on('page:load', go);

