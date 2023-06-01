<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./.media/language/english/generikit_wide_dark.png">
  <source media="(prefers-color-scheme: light)" srcset="./.media/language/english/generikit_wide_light.png">
  <img alt="GeneriKit" src="./.media/language/english/generikit_wide_dark.png" width="55%">
</picture>
</p>

Generic PlayStation patches. Those that were revoked by the sages.

Usage
-----

Having to patch a file and build a entire kernel is a medium-level of knowledge to the majority of users.<br>
But choosing which file to compile is a hard task. And that is what this repository is for.

Dependencies
------------

In the middle of the repository journey, most of the systems will have a automated install.<br>
But this day is most likely to happen very far from now. So, consider having the following:

|   Package     |   URL                                             |
|---------------|---------------------------------------------------|
|   git         |   https://ftp.gnu.org/gnu/git/                    |
|   gcc         |   https://ftp.gnu.org/gnu/gcc/                    |
|   make        |   https://ftp.gnu.org/gnu/make/                   |

It is necessary the usage of kernel headers. Each distribution have a different package.<br>
They can also be manually compiled. See [this](https://www.kernel.org/doc/html/latest/kbuild/modules.html).

Compiling
---------

<b>Tip</b>: "su -c" can be your root manager, sudo, doas, or another...<br>
Just remember that you need to remove the quote marks (") from every given "su -c" command.

<b>Clone the repository</b>:
```sh
git clone https://github.com/KanuX-14/generikit-hid-sony.git
cd generikit-hid-sony/
```

<b>Using DKMS</b>:
```sh
su -c "sh dkms-install.sh"
```

<b>Manually compiling</b>:
```sh
make && su -c "make install clean"
```

Remove the older driver in order to load the generikit one:
```sh
printf "blacklist hid-sony\n" | su -c "tee /etc/modprobe.d/generikit.conf"
```

To load the original driver, unload `generikit-hid-sony` and load `hid-sony`:
```sh
su -c "modprobe -r generikit-hid-sony"
su -c "modprobe hid-sony"
```
To return the generikit driver, do the other way around.

Removing
--------

<b>Using DKMS</b>:
```sh
su -c "sh dkms-remove.sh"
```

Inspiration
-----------

One time this patch got revoked by the zen-kernel programmers.<br>
Just like they said:
> "I'd really prefer we don't add code for fakes."

Even knowing it is generic, the device continue being a device.

Contribution
------------

You are more than welcome to submit a fix that got revoked by the team.<br>
If your fix has bugs in some architecture, consider putting a description in the `warning.txt` file.

All the contribution should be directly sent to the `devel` branch.
```sh
git checkout devel
```

References
----------

My first [closed pull request](https://github.com/zen-kernel/zen-kernel/pull/279).<br>
PS3 generic controller [forum discussion](https://retropie.org.uk/forum/topic/28263/playstation-3-controller-not-connecting-wired-on-new-pi4-retropie-build/7)... huge thanks to doug and [b3n](https://github.com/btlogy)!
