## Overview
This is my OS X bash shell setup which is primarily the [dotfiles from Mathias Bynens](https://github.com/mathiasbynens/dotfiles) and the ["z" (jump around) command from rupa](https://github.com/rupa/z).

## Setup

Clone repositories
- Clone this repository into ~/ as shell... `cd ~ && git clone https://github.com/eatrocks/shell.git`
- Clone z... `cd ~/shell && git clone https://github.com/rupa/z.git`
- Clone dotfiles... `cd ~/shell && git clone https://github.com/mathiasbynens/dotfiles.git`

Run the following setups
- ./setup.sh
- cd dotfiles && source bootstrap.sh

Restart your terminal

## Notes

After a clean install of El Capitan the only dot file was .bash_history, and that probably only existed after I used the shell, so the dotfiles install did not overwrite anything. That isn't to say that some other application install didn't add or modify a dot file which could be overwritten.

The `bootstrap.sh` copies it's dotfiles into your home directory with a special rsync command that resets permissions.

Do not touch `~/bin`, `~/init`, or any of the `~/.xyz` files that also exist in dotfiles directly. Instead modify these files which are linked from ~/ by the setup script...
- ~/shell/config/dot-path for ~/.path
- ~/shell/config/dot-extra for ~/.extra

I did not run .osx, but lots of the the things in there look compelling. Do not run .osx, there are locale specific informations, and I DO NOT want all of his changes.  So run the ones you want manually and add those to your setup.sh.

When I was done, Terminal was still white. So I copied the `Basic` profile and changed the
- background to Lead
- font to Magnesium
- bold to Mercury
- size to 14
- selection to Licorice
- set this new profile to `Default`
- check use bright colors for bold text

In the general tab I
- set Terminal to start up to a new window with the profile I just configured
- set new windows to open with the `Default Profile` in the `Default Working Directory`
- new tabs to open with the `Default Profile` in the `Same Working Directory`

## LDS Mobile Device Management

Self Service, Sophos, Jamf

Sources: Dan Smith and Michael Jasper

- modify `/etc/hosts` to include `0.0.0.0 macmdm.ldschurch.org`
- remove jamf big brother software https://jamfnation.jamfsoftware.com/article.html?id=153
- remove Sophos antivirus (need more info here to bypass the tamper protection/password) https://community.sophos.com/kb/en-us/14179
