/*
Author: Tatsumi Suenaga
This is the main javascript file for the APIs.
Only Last.fm APIs are used.
*/

var cache = new LastFMCache();
var lastfm = new LastFM({
apiKey : '9f548c76cd5eb31879e8ae14473fc395',
apiSecret : 'c82680bbc6921d9d86e264a2e05e8998',
cache : cache
});

$(document).ready(function() { //Since it wouldn't work if document wasn't loaded and ready
	$('#search').click(function(){
		var artistName = $('#searchField').val();
		lastfm.artist.getInfo({artist: artistName}, {success: function(data){ //This method gets the info of the searched artist
			$('#success #artistName').html(data.artist.name);
			$('#success #artistImage').html('<img src="' + data.artist.image[2]['#text'] + '" />');
			$('#success #artistBio').html(data.artist.bio.summary);
			$('#error').empty();
			lastfm.artist.getTopTracks({artist: artistName}, {success: function(data){ //This method gets the top track of the artist
				$('#success #artistTrack').html('Top Track: ' + data.toptracks.track[0].name);
				$('#success #artistTrackURL').html(data.toptracks.track[0].url);
				$('#success #artistTrackURL').attr("href", data.toptracks.track[0].url);
				}, error: function(code, message){
					$('#success #artistTrack').html('Artist Has No Top Track!');
					$('#success #artistTrackURL').empty();
					$('#success #artistTrackURL').empty();
					$('#error').html('Error Code: ' + code + ', Error Message: ' + message);
			}});
			lastfm.artist.getEvents({artist: artistName}, {success: function(data){ //This method gets the future events
				if(Number(data.events.total) != 0){ //If there are upcoming events... (it gives NaN or 0... can't get it to give me the true number)
					$('#artistEvents #upcoming').html('Upcoming Events');
					$('#artistEvents #event1 #time').html(data.events.event[0].startDate);
					$('#artistEvents #event1 #venue').html(data.events.event[0].venue.name);
					$('#artistEvents #event2 #time').html(data.events.event[1].startDate);
					$('#artistEvents #event2 #venue').html(data.events.event[1].venue.name);
					$('#artistEvents #event3 #time').html(data.events.event[3].startDate);
					$('#artistEvents #event3 #venue').html(data.events.event[3].venue.name);
					
				} else { //No events
					$('#artistEvents #upcoming').html("No Events Found!");
					$('#artistEvents #event1 #time').empty();
					$('#artistEvents #event1 #venue').empty();
					$('#artistEvents #event2 #time').empty();
					$('#artistEvents #event2 #venue').empty();
					$('#artistEvents #event3 #time').empty();
					$('#artistEvents #event3 #venue').empty();
				}
				}, error: function(code, message){
					$('#artistEvents #upcoming').empty();
					$('#artistEvents #event1 #time').empty();
					$('#artistEvents #event1 #venue').empty();
					$('#artistEvents #event2 #time').empty();
					$('#artistEvents #event2 #venue').empty();
					$('#artistEvents #event3 #time').empty();
					$('#artistEvents #event3 #venue').empty();
					$('#error').html('Error Code: ' + code + ', Error Message: ' + message);
			}});
			}, error: function(code, message){ //Error when no artist is typed in
				$('#artistEvents #upcoming').empty();
				$('#artistEvents #event1 #time').empty();
				$('#artistEvents #event1 #venue').empty();
				$('#artistEvents #event2 #time').empty();
				$('#artistEvents #event2 #venue').empty();
				$('#artistEvents #event3 #time').empty();
				$('#artistEvents #event3 #venue').empty();
				$('#success #artistName').empty();
				$('#success #artistImage').empty();
				$('#success #artistBio').empty();
				$('#success #artistTrack').empty();
				$('#success #artistTrackURL').empty();
				$('#success #artistTrackURL').empty();
				$('#error').html('Error Code: ' + code + ', Error Message: ' + message);
		}});
		
	});
});
