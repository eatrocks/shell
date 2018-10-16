echo "Make sure ~/.bash_profile exists"
# Note: the commands the next installer adds to the profile have 
# been manually added to profile by adding them to ./config/dot-extra
touch ~/.bash_profile

echo "Installing Node version manager"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo "Installing Node"
. ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts

echo "Upgrading npm"
npm install -g npm

echo "Configuring npm (.npmrc)"
npm set email "eatrocks@gmail.com"
npm set init.author.name "Bruce Campbell"
npm set init.author.email "eatrocks@gmail.com"
