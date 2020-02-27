
echo "Configuring git"
git config --global user.name "Bruce Campbell"
git config --global user.email "bruce@churchofjesuschrist.org"
# tell git to use https instead of git (if your firewall blocks git protocol)
# git config --global url."https://".insteadOf git://
# for primer (fatal: unable to connect to github.com Operation timed out)
# bower ECMDERR       Failed to execute "git ls-remote --tags --heads git://github.com/jquery/jquery.git", exit code of #128 fatal: unable to connect to github.com: github.com[0: 192.30.252.131]: errno=Operation timed out
#git config --global url.https://github.com/.insteadOf git://github.com/

# Custom git commit message template... http://chris.beams.io/posts/git-commit/
git config --global commit.template ~/repos/shell/config/gitmessage.txt

# MacOS keychain helper
git config --global credential.helper osxkeychain
