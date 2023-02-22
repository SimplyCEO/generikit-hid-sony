<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./.media/language/english/generikit_wide_dark.png">
  <source media="(prefers-color-scheme: light)" srcset="./.media/language/english/generikit_wide_light.png">
  <img alt="GeneriKit" src="./.media/language/english/generikit_wide_dark.png" width="55%">
</picture>
</p>

Generic patches. Those that were revoked by the sages.

## Usage

Having to patch a file and build a entire kernel is a medium-level of knowledge to the majority of users.<br>
But choosing which file to compile is a hard task. And that is what this repository is for.

## Dependencies

In the middle of the repository jouney, most of the systems will have a automated install.<br>
But this day is most likely to happen very far from now. So, consider having the following:

|   Package     |   URL                                             |
|---------------|---------------------------------------------------|
|   gcc         |   https://ftp.gnu.org/gnu/gcc/                    |
|   git         |   https://ftp.gnu.org/gnu/git/                    |
|   make        |   https://ftp.gnu.org/gnu/make/                   |

It is necessary the usage of kernel headers. Each distribution have a different package.<br>
They can also be manually compiled. See [this](https://www.kernel.org/doc/html/latest/kbuild/modules.html).

## Building

Building for now is very dirty. But, hey, **if it works, it works!**:

```sh
git clone --recursive https://github.com/KanuX-14/GeneriKit.git
cd GeneriKit
make <modules> modules && sudo make install clean
```
Note: Where `<modules>`, put the drivers you want to compile.

|   Modules             |   Description                       |
|-----------------------|-------------------------------------|
|   generikit-hid-sony  |   Generic PS3 Controller support.   |

## Inspiration

One time this patch got revoked by the zen-kernel programmers.<br>
Just like they said:
> "I'd really prefer we don't add code for fakes."

Even knowing it is generic, the device continue being a device.

## Contribution

You are more than welcome to submit a driver that got revoked by the team.<br>
If your driver bugs some architecture, consider putting a `warning.txt` file within the directory.

All the contribution should be directly sent to the `devel` branch.
```sh
git checkout devel
```

### References

My first [closed pull request](https://github.com/zen-kernel/zen-kernel/pull/279).<br>
PS3 generic controller [forum discussion](https://retropie.org.uk/forum/topic/28263/playstation-3-controller-not-connecting-wired-on-new-pi4-retropie-build/7)... huge thanks to doug and [b3n](https://github.com/btlogy)!
