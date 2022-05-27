# GeneriKit
Generic patches. Those that were revoked by the sages.

## How to build

Neither I know how. At the moment it is needed to enter at the patch folder and do this command:
```bash
make && sudo make install
```

## Why?

One time this patch got revoked by the zen-kernel programmers...<br>
Just like they said: "I'd really prefer we don't add code for fakes."

Even knowing it is generic, the device continue being a device.

## Is it useful?

If you want to build 6GB of kernel by yourself, go ahead.<br>
But if you want the dirtiest drivers ever, compile this repository.

## Contribution

You are more than welcome to submit a driver that got revoked by the team.<br>
If your driver bugs some architecture, consider putting a `warning.txt` within the directory.

## References

My first [closed pull request](https://github.com/zen-kernel/zen-kernel/pull/279).
