#!/usr/bin/env bash

# Shell setup script

# TODO
# turn off "Use smart quotes and dashes" in system preferences | keyboard | text
# status: currently trying system without making this change (10/2018)

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing global Homebrew packages"
homebrew_packages=(
	"bash"
	"bash-completion"
	"git"
)
for homebrew_package in "${homebrew_packages[@]}"; do
	brew install "$homebrew_package"
done

echo "Configuring the system to use the new bash"
# http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash 

echo "Configuring npm (.npmrc)"
npm set email "eatrocks@gmail.com"
npm set init.author.name "Bruce Campbell"
npm set init.author.email "eatrocks@gmail.com"

echo "Configuring git"
git config --global user.name "Bruce Campbell"
git config --global user.email "campbellbd@ldschurch.org"
# tell git to use https instead of git (if your firewall blocks git protocol)
# git config --global url."https://".insteadOf git://
# for primer (fatal: unable to connect to github.com Operation timed out)
# bower ECMDERR       Failed to execute "git ls-remote --tags --heads git://github.com/jquery/jquery.git", exit code of #128 fatal: unable to connect to github.com: github.com[0: 192.30.252.131]: errno=Operation timed out
#git config --global url.https://github.com/.insteadOf git://github.com/

# Custom git commit message template... http://chris.beams.io/posts/git-commit/
git config --global commit.template ~/repos/shell/config/gitmessage.txt

# link custom dot files from home to this folder.
/bin/rm ~/.extra
ln -s ~/repos/shell/config/dot-extra ~/.extra

/bin/rm ~/.path
ln -s ~/repos/shell/config/dot-path ~/.path

# link VS Code settings from home to this config folder
# https://code.visualstudio.com/docs/getstarted/settings
/bin/rm $HOME/Library/Application Support/Code/User/settings.json
ln -s ~/repos/shell/config/vscode-settings.json $HOME/Library/Application Support/Code/User/settings.json

# the dot-cubs file has passwords, see 1password for the contents
if [ -f ~/repos/shell/config/dot-cubs ]; then
  /bin/rm ~/.cubs
  ln -s ~/repos/shell/config/dot-cubs ~/.cubs
fi

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


# 802.1X prompt when making network connection (un & )
# un-check "Enable automatic connection" in
# Network | choose offending adapter | Advanced | 802.1X
echo 'You may need to manually disable 802.1X automatic connection'

echo 'Now call the dotfiles setup script... cd ../dotfiles && source bootstrap.sh'

# Not sure why dotfiles put ~/brew.sh into the home directory.
# In ~/.bashrc, the `[ -n "$PS1" ] && ...` short circuits the call to .bash_profile for gui apps like IDEA
# On a Mac, when .bashrc is present the .bash_profile is not called, but is called otherwise I think
echo 'Then delete ~/brew.sh (to be clean) and ~/.bashrc (so IntelliJ works)'
