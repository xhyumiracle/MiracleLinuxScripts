# MiracleLinuxScripts
### Introduction
- This script will install terminator, terminator-solarized(terminator style), dircolors-solarized(dir command style), Flatabulous-master(system theme), Ultra-flat(system icon style), unity-tweak-tool into your Linux

### Installation:
```sh
$ ./ubuntu_theme_setup_xhyu.sh
```

- When the Settings window show up (Unity Tweak Tool):
1. Click Theme --> Choose Flatabulous-master
2. Click Icons --> Ultra-flat
3. Close the window
4. reboot the Ubuntu

- If you want your unity menu bar stay on the left rather than bottom, just change the last word of the LAST LINE in the script from Bottom into Left. Or simply delete it.

### Other Options
Usage:
```sh
$ ./ubuntu_theme_setup_xhyu.sh [ args ]
```
Example:
```sh
./ubuntu_theme_setup_xhyu.sh picture bottom wallpapper
```
Arguments:
  [ args ] can be one or more of the follows:
- terminator
  - Install terminator and setup dircolors-solarized(terminator's style)
- picture
  - Set the background of terminator to cbg.jpg
- vim
  - Set up the vim-solarized style
- ubuntu
  - Install the Flatabulous-master(system theme), Ultra-flat(system icon style) and set them up
- bottom
  - Move the Launcher to the bottom of the screen
- left
  - Move the Launcher to the left of the screen
- wallpaper
  - Set the wallpaper as a certain picture, (you can change picture in change_wallpaper() function).

### Customize
- To change the background of terminator, open terminator and right click on the empty field --> Prefences --> Profiles --> background
- To change the Font of terminator, right click the terminator --> Profiles and choose one of the three theme. Or right click on the terminator --> Prefences --> Profiels --> Add (at the left bottom)
- To change the wallpaper, right click on the desktop, you will see a 'Change Desktop Background'

### Attention
> The Unity Tweak Tool(UTT) can only support a certain number of display rate.
> So make sure you have common display set, otherwise the UTT maybe crash
> ed whenever you start your Ubuntu.
