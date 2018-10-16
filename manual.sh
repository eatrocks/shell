cat <<EOF

- Text Message Forwarding (on, from iPhone)
- Remove all dock icons other than Todoist
- Delete unused factory Applications
- Remove notification center widgets
- Keyboard
  - For each keyboard that does not have an escape key
    - Modifier keys caps lock (escape)
  - Add Lock Screen to Touch bar instead of Siri
  - Text
    - Correct spelling automatically: off
    - Use smart quotes and dashes: off (currently trying system without making this change (10/2018))
- Display
  - Night Shift
    - Scheduled (from sunset to sunrise)
- General
  - Appearance (Dark)
- Sound
  - output: make sure sound is not send to a monitor
- Finder Toolbar (right-click on the toolbar)
  - Add delete and new folder icons 
- Finder (Command-comma)
  - Sidebar
    - Favorites: check everything
  - Advanced
    - Keep folders on top "In windows when sorting by name"
    - Show warning before changing an extension (off)
- Setup Apple Pay?
- iCloud
  - Enable everything (except mail until I have an apple address)
  - Photos
    - iCloud Photos: on
- Family Sharing
  - Enable everything

EOF


# 802.1X prompt when making network connection (un & )
# un-check "Enable automatic connection" in
# Network | choose offending adapter | Advanced | 802.1X
echo 'You may need to manually disable 802.1X automatic connection'

echo 'Now call the dotfiles setup script... cd ../dotfiles && source bootstrap.sh'

# Not sure why dotfiles put ~/brew.sh into the home directory.
# In ~/.bashrc, the `[ -n "$PS1" ] && ...` short circuits the call to .bash_profile for gui apps like IDEA
# On a Mac, when .bashrc is present the .bash_profile is not called, but is called otherwise I think
echo 'Then delete ~/brew.sh (to be clean) and ~/.bashrc (so IntelliJ works)'
