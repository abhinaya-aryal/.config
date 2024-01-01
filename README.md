# My Config for Arch Linux

This repository contains the configuration for my **arch linux** setup with **Hyprland** i.e. wayland compositor. Available key bindings and basic usage idea is provided in this readme file for future reference related to the configs...


## Packages to install after installing arch linux

- alacritty

- hyprland 

- grim

- slurp

- greetd (need to set up)

- waybar

- fuzzel

- dunst 

- brightnessctl

- playerctl

- pamixer

- mpv

- yt-dlp

- brave 

- ranger (need to go through github repo)

- snapshot

- libva-intel-driver

- libva-mesa-driver

- nvim

- zathura

- libreoffice-fresh

- neofetch


##  Hyprland

***hyprland*** is a wlroots-based Wayland dynamic tiling compositor. Hyprland is installed with the `hyprland` package or AUR git package `hyprland-git`.

When you have installed river, **hyprctl** is also installed automatically.

Configuration is done throught a single configuration file, `~/.config/hypr/hyprland.conf`, though it supports splitting the configuration into multiple files.

**hyprctl** is a little companion program which can be used to send commands to Hyprland. 


- **Super + E** = shows power menu which is a custom shell script ---> `~/.config/scripts/power_menu`

- **Super + D** = opens searchable application launcher i.e. **fuzzel**

- **Control + Alt + B** = Runs web browser 

- **Control + Alt + C** = Opens Camera i.e. **Snapshot** in my case

- **Control + Alt + T** = Opens terminal i.e. **Alacritty** in my case

- **Control + Alt + H** = Opens file explorer i.e. **Ranger** in my case

- **Super + Q** = Closes the currently focused window

- **Super + J** = Focuses the next window

- **Super + K** = Focuses the previous window

- **Super + Shift + J** = Swap the focused window with the next visible window

- **Super + Shift + K** =  Swap the focused window with the previous visible window

- **Super + .** = Focuses the next output

- **Super + ,** = Focuses the previous output

- **Super + Shift + .** = Send the focused view to the next output

- **Super + Shift + ,** = Send the focused view to the previous output

- **Super + Return** = Bumps the focused window to the top of layout stack

- **Super + H** = Decrease the main ratio of rivertile by 0.05

- **Super + L** = Increase the main ration of rivertile by 0.05

- **Super + Shift + H** = Decrease the main count of rivertile by 1

- **Super + Shift + L** = Increase the main count of rivertile by 1

- **Super + Alt + H** = Move focused window left by 100px

- **Super + Alt + J** = Move focused window down by 100px

- **Super + Alt + K** = Move focused window up by 100px

- **Super + Alt + L** = Move focused window right by 100px

- **Super + Alt + Control + H** = snap focused windows to left

- **Super + Alt + Control + J** = snap focused windows to down

- **Super + Alt + Control + K** = snap focused windows to up

- **Super + Alt + Control + L** = snap focused windows to right

- **Super + Alt + Shift + H** = decrease the horizontal size of focused window by 100px

- **Super + Alt + Shift + J** = increase the vertical size of focused window by 100px

- **Super + Alt + Shift + K** = decrease the vertical size of focused window by 100px

- **Super + Alt + Shft + L** = increase the horizontal size of focused window by 100px

- **Super + (1-9)** = Focuses the provided tag

- **Super + Shift + (1-9)** = Changes the tag of focused window to provided tag

- **Super + Control + (1-9)** = Focuses the provided tag too. Can focus multiple tag at once

- **Super + Shift + Control + (1-9)** = Toggle the provided tag for focused window. Can assign multiple tag to single window

- **Super + 0** = Focuses all tags i.e. (1-32)

- **Super + Shift + 0** = Assign all (1-32) tag for the focused window. Focused window will be active on evey tags

- **Super + Space** = Toggle float mode for focused window.

- **Super + F** = Toggle fullscreen mode for focused window.

- **Super + Up** = change layout orientation to main-location top

- **Super + Right** = change layout orientation to main-location right

- **Super + Down** = change layout orientation to main-location bottom

- **Super + left** = change layout orientation to main-location left


## mpv 

***mpv*** is a free i.e. open source media player for the command line. It supports a wide variety of media file formats, audio and video codecs, and subtitle types.

- **Menu** = toggles the browser

- **Ctrl + O** = opens the browser

- **Alt + O** = opens a dialogue box to type in a directory

- **Esc** = closes the browser or clears the selection

- **Enter** = plays the currently selected file or folder

- **Shift + Enter** = appends the current file or folder to the playlist

- **Alt + Enter** = loads the playlist entries before and after the selected file (like autoload.lua)

- **L** = enter the currently selected directory

- **Backspace** = move to the parent directory

- **Home** = move to the directory of the currently palying file

- **Ctrl + Y** = open youtube search input

- **Y** = opens youtube search input or shows searched list 

- **Ctrl + u** = Toggle the youtube recommended video list 

- **Space** = Append the current video to playlist
