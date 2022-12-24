# asdf-raku

[![Build Status](https://github.com/m-dango/asdf-raku/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/m-dango/asdf-raku/actions/workflows/main.yml?query=branch%3Amain++)

[Raku](https://raku.org/) plugin for [asdf](https://github.com/asdf-vm/asdf).

## Install

```
asdf plugin add raku https://github.com/m-dango/asdf-raku.git
asdf list all raku
asdf install raku latest
```

Depends on `bash`, `curl`/`wget`, and `tar`.

## Use

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of Raku.

## Notes

Downloads and installs a precompiled Rakudo, including the Zef module manager.

Rakudo versions sourced from [skaji/rakudo-releases](https://github.com/skaji/rakudo-releases).

Borrows heavily from [rakuenv](https://github.com/skaji/rakuenv).
