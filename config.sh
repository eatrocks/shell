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

# Finder

## Show Library folder
chflags nohidden ~/Library

## Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

## Show path bar
defaults write com.apple.finder ShowPathbar -bool true

## Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# CHROME

echo "Configuring incognito mode"
defaults write com.google.chrome IncognitoModeAvailability -integer 1

# HIDE THE MOVE TO DROPBOX CONTEXT MENU ITEM IN FINDER
# Dropbox must be installed first
# https://www.dropboxforum.com/t5/Dropbox/Please-add-option-to-remove-context-menu-quot-Move-to-Dropbox/idc-p/121174/highlight/true#M44762
/Applications/Dropbox.app/Contents/MacOS/Dropbox --move-to-dropbox=False
