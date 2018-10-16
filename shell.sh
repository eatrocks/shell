#!/usr/bin/env bash

# Shell setup script

# link custom dot files from home to this folder.
/bin/rm ~/.extra
ln -s ~/repos/shell/config/dot-extra ~/.extra

/bin/rm ~/.path
ln -s ~/repos/shell/config/dot-path ~/.path

# link VS Code settings from home to this config folder
# https://code.visualstudio.com/docs/getstarted/settings
/bin/rm $HOME/Library/Application\ Support/Code/User/settings.json
ln -s ~/repos/shell/config/vscode-settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# set node permissions so sudo is not required (still use/need sudo for 'n')
# Status: disabled these in favor of nvm which shoud not have this problem (10/2018)
# sudo chown -R $USER ~/.npm
# sudo chown -R $USER /usr/local/lib/node_modules
# perm problems with npm install with -g
# sudo chgrp -R admin /usr/local
# sudo chmod -R g+w /usr/local

# git auto-completion per https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
# git completion for all users requires bash 4 or higher... https://superuser.com/questions/31744/how-to-get-git-completion-bash-to-work-on-mac-os-x
# note: I tried this "all users" method and had to upgrade bash to 4 and that broke my z config.  So I reverted.
# So upgrade it... http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/
# echo 'you need to manually upgrade bash to 4+ for bash completion to work (echo $BASH_VESION)'
# echo '  see http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/'

# this directory is where completion scripts go for all users, make sure it exists
# AUTO_DIR=/opt/local/etc/bash_completion.d
# if [ ! -d $AUTO_DIR ]; then
#   sudo mkdir -p $AUTO_DIR
# fi
# if [ ! -f $AUTO_DIR/git-completion.bash ]; then
#   curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ./bin/git-completion.bash && sudo mv ./bin/git-completion.bash $AUTO_DIR/git-completion.bash
# fi
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/repos/shell/bin/git-completion.bash.temp && mv ~/repos/shell/bin/git-completion.bash.temp ~/repos/shell/bin/git-completion.bash
