/*Author: Tatsumi Suenaga
  Description: custom.js currently contains JS only meant for home.html.erb yummily search function
*/
$(document).ready(function() { //Since it wouldn't work if document wasn't loaded and ready
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
				var i; //recipe iterator
				for (i = 0; i < max; i++) {
					out += '<h3>' + arr.matches[i].recipeName + '</h3>'+ '<p>';
					out += '<img src="' + arr.matches[i].smallImageUrls + '" alt="recipe image" width ="150" height="150"><br>';
					var z; //ingredients iterator
					for (z = 0; z < arr.matches[i].ingredients.length; z++) {
						if (z != arr.matches[i].ingredients.length - 1) {
							out += arr.matches[i].ingredients[z] + ', ';
						} else {
							out += arr.matches[i].ingredients[z] + '</p>';
						}
					}
				}
			} else {
				out += '<h3>No match found!</h3>';
			}
			
			document.getElementById("result").innerHTML = out;
		}
	});
});
