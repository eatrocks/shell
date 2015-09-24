#!/usr/bin/env bash

# Shell setup script

# git configuration
git config --global user.name "Bruce Campbell"
git config --global user.email "campbellbd@ldschurch.org"
# primer prerequisite
git config --global url.https://github.com/.insteadOf git://github.com/
# tell git to use https instead of git (if your firewall blocks git protocol)
git config --global url."https://".insteadOf git://

# link custom dot files from home to this folder.
/bin/rm ~/.extra
ln -s ~/shell/config/dot-extra ~/.extra

/bin/rm ~/.path
ln -s ~/shell/config/dot-path ~/.path

# set node permissions so sudo is not required (still use/need sudo for 'n')
sudo chown -R $USER ~/.npm
sudo chown -R $USER /usr/local/lib/node_modules

# perm problems with npm install with -g
sudo chgrp -R admin /usr/local
sudo chmod -R g+w /usr/local

# 802.1X prompt when making network connection (un & )
# un-check "Enable automatic connection" in
# Network | choose offending adapter | Advanced | 802.1X
echo 'You may need to manually disable 802.1X automatic connection'

echo 'Now call the dotfiles setup script... cd dotfiles && source bootstrap.sh'
