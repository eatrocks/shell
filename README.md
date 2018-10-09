## Overview

This is my MacOS setup project. It started out as shell setup, but grew
to include other setup tasks. The shell setup is based primarily on the
[dotfiles from Mathias Bynens](https://github.com/mathiasbynens/dotfiles) 
and the ["z" (jump around) command from rupa](https://github.com/rupa/z).

## Setup

Clone repositories

* Clone this repository into ~/repos as shell... `mkdir ~/repos && cd ~/repos && git clone https://github.com/eatrocks/shell.git`
* Clone z... `cd ~/repos/ && git clone https://github.com/rupa/z.git`
* Clone dotfiles... `cd ~/repos/ && git clone https://github.com/mathiasbynens/dotfiles.git`

Run the following setups

* cd ~/repos/shell && ./setup.sh
* cd ~/repos/dotfiles && source bootstrap.sh

Restart your terminal

## Notes

After a clean install of El Capitan the only dot file was `.bash_history`, 
and that probably only existed after I used the shell, so the dotfiles 
install did not overwrite anything. That isn't to say that some other 
application install didn't add or modify a dot file which could be overwritten.

The `bootstrap.sh` copies it's dotfiles into your home directory with 
a special rsync command that resets permissions.

Do not touch `~/bin`, `~/init`, or any of the dot files in the home 
directory that also exist in dotfiles directly. Instead modify these 
files which are linked from ~/ by the setup script...

* ~/shell/config/dot-path for ~/.path
* ~/shell/config/dot-extra for ~/.extra

VS Code settings are also linked by the setup script
per https://code.visualstudio.com/docs/getstarted/settings

* ~/repos/shell/config/vscode-settings.json for $HOME/Library/Application Support/Code/User/settings.json

I did not run .osx, but lots of the the things in there look compelling. 
I also did not run .osx; there are locale specific informations, and I 
DO NOT want all of his changes. So run the ones you want manually and 
add those to your setup.sh.

When I was done, Terminal was still white. So...
For a black terminal... I copied the `Basic` profile and changed the. (This was for High Sierra. Changes pending for Maveriks wich introduced the dark mode)

* background to Lead
* font to Magnesium
* bold to Mercury
* size to 14
* selection to Licorice
* set this new profile to `Default` (click the `default` button in the list on the left)
* check use bright colors for bold text

For a silver and highly translucent window copy the `Silver Aero` profile and changed the

* size to 14
* selection to Lemon
* set this new profile to `Default` (click the `default` button in the list on the left)
* check use bright colors for bold text

In the general tab I

* set Terminal to start up to a new window with the profile I just configured
* set new windows to open with the `Default Profile` in the `Default Working Directory`
* new tabs to open with the `Default Profile` in the `Same Working Directory`

## Disable Device Enrollment Notification

Self Service, Sophos, Jamf

If your serial number was registered for device management and the management apps 
including Self Service, Sophos, and Jamf were installed, you should wipe it clean 
(format the disk) and install the OS from scrath without connecting to a network.

Once the OS installation is completed you can connect to a network. You will eventually
be prompted with a Device Enrollment Notification. Use the instructions found [here](https://gist.github.com/sghiassy/a3927405cf4ffe81242f4ecb01c382ac). In summary...

### Restart the Mac in Recovery Mode by holding `Comment-R` during restart

#### Open Terminal in the recovery screen and type

```
csrutil disable
```

Restart computer

### Edit `com.apple.ManagedClient.enroll.plist`

In the terminal, type

```
sudo vi /System/Library/CoreServices/ManagedClient.app/Contents/Resources/com.apple.ManagedClient.enroll.plist
```

change

```
<key>com.apple.ManagedClient.enroll</key>
```

from true to false

### Restart the Mac in Recovery Mode by holding `Comment-R` during restart

#### Open Terminal in the recovery screen and type

```
csrutil enable
```

Restart computer so that the changes take effect

## Antivirus & Drive Encryption

We agreed to encrypt the drive and install Antivirus in exchange for permission
to bypass device management. Do that now. Consider Malware Bytes, or get Sophos
from the antivirus team or TSR's. Use Apple's drive encryption.

## Adobe Trojan Horse Analytics

This is on most LDS sites, and I'm sure many others. This `hosts` file change and
the one for mobile device management are not automated.

Modify `/etc/hosts`, add

```
0.0.0.0 assets.adobedtm.com
```
