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

brew cask appcleaner
brew cask install quicklook-json

echo "Configuring the system to use the new bash"
# http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash
