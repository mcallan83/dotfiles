if ! command -v yt-dlp >/dev/null 2>&1; then
	return 0
fi

# download video from chrome's active video to the desktop
scrape-chrome-video() {
  local url
	url=$(
		osascript <<-'APPLESCRIPT'
	if application "Google Chrome" is not running then
	  error "Google Chrome is not running."
	end if
	tell application "Google Chrome"
	  if (count of windows) is 0 then
	    error "Google Chrome has no open windows."
	  end if
	  return URL of active tab of front window
	end tell
	APPLESCRIPT
  ) || return
  yt-dlp --no-playlist -P "$HOME/Desktop" "$url"
}
