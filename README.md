<!-- prettier-ignore -->
> [!WARNING]
> # Disclaimer
> This Readme mainly focuses on the initial setup of Arch Linux. Don't carry out anything blindly from here. Some of the values needs to be changed according to your hardware. If confused, don't hesitate to ask me. I will be happy to help you.

# Color Output of Package manager

- Open `/etc/pacman.conf`
- Uncomment `Color` option

# Setting Mount Points and Options for Booting

- Determine `UUID` of your device using `sudo blkid` command
- Open `/etc/fstab`
- Remove everything and paste the following updating your `UUID`:-

```
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>

# Root filesystem
UUID=85e342a3-0482-484a-9cb1-f6b17af9dd6b	/         	ext4    rw,relatime,commit=30,discard	0 1

# EFI Partition (for UEFI boot)
UUID=83D7-9CA3                                 /efi             vfat        defaults,noatime            0 2

# Swap file
/swapfile                                      none             swap         defaults,pri=1             0 0
```

# Installing `yay` (Aur Helper)

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
```
