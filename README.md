# tss

![tss](https://mtklr.github.com/images/tss.png)

https://github.com/gammy/tss  
Copyright (C) 2006 Kristian Gunstone

*Please note that `tss` is discontinued and deemed unsafe.*

* The password lock feature is disabled, it doesn't mess with privileges or passwords, but there are probably other reasons why this is still "deemed unsafe."
* I'm using macOS 10.11, ymmv.

See the original [README](https://github.com/mtklr/tss/blob/master/README) for more info.

## build

Default install location is `/usr/local` (may need `sudo`):

``` console
make install
```

or define `PREFIX` to install there:

``` console
PREFIX=/path/to/install make install
```

## uninstall

``` console
make uninstall
```

or:

``` console
PREFIX=/path/to/install make uninstall
```
