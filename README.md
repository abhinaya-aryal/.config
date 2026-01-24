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

```sh
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

# Setting up GPG

`nvim $GNUPGHOME/gpg-agent.conf`

In the `gpg-agent.conf` add the following

```bash
pinentry-program /usr/bin/pinentry-curses
```

Now, run following command

```bash
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

```bash
gpg --full-generate-key
```

Choose:

- Key type: 1 (RSA and RSA)

- Key size: 4096

- Expiry: Your choice (e.g., 1y)

- Name & email: match your GitHub email

- Passphrase: choose something strong

`gpg --list-secret-keys --keyid-format=long`

Note the Key ID, e.g., **ABC123DEF4567890** from sec after rsa4096/.

```bash
git config --global user.signingkey ABC123DEF4567890
git config --global commit.gpgsign true
```

For editing we can either use:

```bash
gpg --expert --edit-key ABC123DEF4567890
gpg --edit-key ABC123DEF4567890
```

# greetd setup for river

In file `/etc/greetd/config.toml` customize the following,

```toml
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `/bin/sh`
# with whatever you want started, such as `sway`.
command = "agreety --cmd river"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
user = "abhinaya"

# enable autologin
[initial_session]
command = "river"
user = "abhinaya"
```

Then, **enable** `greetd.service`.

# Package Restore

```sh
yay -Qqe > ~/.config/backup/pkglist.txt
```

The above command captures all official repository packages and aur packages which are installed explicitly and ignore the dependencies.

For restoring later, after a fresh Arch install:

```sh
yay -S --needed - < ~/.config/backup/pkglist.txt
```

Now yay will pull official packages and aur packages automatically skipping already installed ones.

https://linux-hardware.org/?probe=f5a9cb553a

## Ghostty setup

Start **ghostty** in the **background** on login, so that future requests to create new windows are extremely fast.

```
systemctl enable --user app-com.mitchellh.ghostty.service
```
