# My Config for Arch Linux

This repository contains the configuration for my **arch linux** setup with **river** i.e. wayland compositor. Available key bindings and basic usage idea is provided in this readme file for future reference related to the configs...



##  River

**River** is a window manager or compositor for linux with wayland support.

For river to run, we will also need either ***logind***, ***elogind*** or ***seatd***. If you are using ***systemd***, then it already takes care of this for you. If not, you also need something to set the `$XDG_RUNTIME_DIR` like rundird.

When you have installed river, **riverctl** and **rivertile** are also installed automatically.

If you prefer to have a fancy graphical login prompt you will need to use a display manager. A fine alternative to the classical display managers is greetd, which allows to have graphical login prompt as well as auto-login.

The one and only thing river wants to do on its own during startup is executing a file at `~/.config/river/init`. This file usually is a executable shell script and will be your starting point for getting river to behave like you want. **riverctl** is a little companion program which can be used to send commands to river. 

- **Super + E** = shows power menu which is a custom shell script ---> `~/.config/scripts/power_menu`




### 1.1 Waybar

**Waybar** is a highly customizable Wayland bar for Sway and Wlroots based compostiors.



### 1.2 Dunst

**Dunst** is a lightweight replacement for the notification-daemons provided by most desktop environments. An example configuration file is included at `/etc/dunst/dunstrc`. Place your configuration on `/.config/dunst/dunstrc` file. Launch `dusnt` and make sure your window manager or desktop environments starts it on startup/login.






### 1.2 Fuzzel

**Fuzzel** is a Wayland-native application launcher that is similar to rofi's drun mode. It is a versatile app and utility launcher. Besides launching applications, as a dmenu alternative Fuzzel can be used for many utility tasks. These include:

- Emoji picker with **bemoji**
- Password picker, with **dmenu-lpass**
- TOTP MFA code picker, with **yubikey-oath-dmenu**
- Clipboard picker, with **clipman**
- Download picker, with **dmenufm**
- Picking a window, output, or workspace to switch to with **swayr**

Configuration should be placed at `~/.config/fuzzel/fuzzel.ini`.






## Alacritty

Alacritty is the terminal emulator for my arch linux setup.
