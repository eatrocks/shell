## Overview

This is my MacOS setup project. It started out as shell setup, but grew
to include other setup tasks. The shell setup is based primarily on the
[dotfiles from Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
and the ["z" (jump around) command from rupa](https://github.com/rupa/z).

## Setup

Clone repositories

- Clone this repository into ~/repos as shell... `mkdir ~/repos && cd ~/repos && git clone https://github.com/eatrocks/shell.git`
- Clone z... `cd ~/repos/ && git clone https://github.com/rupa/z.git`
- Clone dotfiles... `cd ~/repos/ && git clone https://github.com/mathiasbynens/dotfiles.git`

Run the following setups

- cd ~/repos/shell && ./setup.sh
- cd ~/repos/dotfiles && source bootstrap.sh

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

- ~/shell/config/dot-path for ~/.path
- ~/shell/config/dot-extra for ~/.extra

VS Code settings are also linked by the setup script
per https://code.visualstudio.com/docs/getstarted/settings

- ~/repos/shell/config/vscode-settings.json for \$HOME/Library/Application Support/Code/User/settings.json

I did not run .macos, but lots of the the things in there look compelling.
There are locale specific informations, and I DO NOT want all of his changes.
So run the ones you want manually and add those to your setup.sh.

## Manual Terminal Tweaks

This assumes dark mode in MacOS Mojave+
I copied the `Basic` profile and changed...

In the text tab...

- size to 16 (click the change button)
- font to Magnesium (click the box to the left of "Text")
- bold to Mercury (click the box to the left of "Bold Text")
- selection to Tungsten (click the box to the left of "Selection")
- set this new profile to `Default` (click the `default` button in the list on the left)

In the general tab...

- set Terminal to start up to a new window with the profile I just configured
- set new windows to open with the `Default Profile` in the `Default Working Directory`

## Disable Device Enrollment Notification

Self Service, Sophos, Jamf

If your serial number was registered for device management and the management apps
including Self Service, Sophos, and Jamf were installed, you should wipe it clean
(format the disk) and install the OS from scrath without connecting to a network.

Once the OS installation is completed you can connect to a network. You will eventually
be prompted with a Device Enrollment Notification. Choosing skip will only delay the
prompt.

### Disable System Integrity Protection

#### Restart the Mac in Recovery Mode by holding `Command-R` during restart

#### Open Terminal from the utilities menu in the recovery screen and run

```
csrutil disable
```

You should see a success message. Restart the computer.

### Move Launch Files

Move or remove the ManagedClient Launch files so they are not executed on startup.
As of Mojave the files are...

```
/System/Library/LaunchAgents/com.apple.ManagedClientAgent.enrollagent.plist
/System/Library/LaunchAgents/com.apple.ManagedClientAgent.agent.plist

/System/Library/LaunchDaemons/com.apple.ManagedClient.enroll.plist
/System/Library/LaunchDaemons/com.apple.ManagedClient.cloudconfigurationd.plist
/System/Library/LaunchDaemons/com.apple.ManagedClient.plist
/System/Library/LaunchDaemons/com.apple.ManagedClient.startup.plist
```

These commands executed from Terminal should do the trick...

```
sudo mkdir /Library/LaunchDaemonsDisabled /Library/LaunchAgentsDisabled
sudo mv /System/Library/LaunchDaemons/com.apple.ManagedClient* /Library/LaunchDaemonsDisabled
sudo mv /System/Library/LaunchAgents/com.apple.ManagedClient* /Library/LaunchAgentsDisabled
```

Note: The source of information was [here](https://apple.stackexchange.com/questions/216890/disable-device-enollment-notification-window),
however the file list was not complete for Mojave.

Note: Previously I followed [these instructions](https://gist.github.com/sghiassy/a3927405cf4ffe81242f4ecb01c382ac), however this did not work. The above instructions worked, and I don't think these instructions contributed but they may have so leaving this note as a reference until the above instructions are proven to work alone.

### Re-enable System Integrity Protection

#### Restart the Mac in Recovery Mode by holding `Command-R` during restart

#### Open Terminal from the utilities menu in the recovery screen and run

```
csrutil enable
```

You should see a success message. Restart computer so that the changes take effect. After these
changes you should not be prompted to enroll your device.

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

## Make z.sh executable

The dot-extra file sources it. Not 100% sure this is necessary.

```
chmod +x ~/repos/z/z.sh
```

## TODO: Items to automate if possible (document if not)

- show the date in the menu bar (is there a cfprefs command)
- Turn on tab navigation to all controls:
  System Preferences -> Keyboard -> Shortcuts (radio buttons at the bottom)
- Paste the date with a keyboard shortcut
  https://discussions.apple.com/thread/8651300
