# DOCK

echo "Configuring dock to autohide"
osascript <<EOD
  tell application "System Events"
    if (get autohide of dock preferences) is false then
      tell dock preferences to set autohide to not autohide
    end if
  end tell
EOD

# SCREENSHOTS

echo "Configuring screenshots to save in Downloads"
defaults write com.apple.screencapture location ~/Downloads
killall SystemUIServer

# CHROME

echo "Configuring incognito mode"
defaults write com.google.chrome IncognitoModeAvailability -integer 1
