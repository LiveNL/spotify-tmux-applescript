#!/usr/bin/osascript

tell application "Spotify"
if it is running then
	if player state is playing then
		set track_name to name of current track
		set artist_name to artist of current track

		if artist_name > 0
			set artist_and_track to "▸ " & artist_name & " - " & track_name

			if length of artist_and_track > 35
				text 1 thru 35 of artist_and_track & ".."
			else
				artist_and_track
			end if
		else
			"▸ " & track_name
		end if
	end if
end if
end tell
