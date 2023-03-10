# asdf-raku

[![Build Status](https://github.com/m-dango/asdf-raku/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/m-dango/asdf-raku/actions/workflows/main.yml?query=branch%3Amain++)

[Raku](https://raku.org/) plugin for the [asdf](https://github.com/asdf-vm/asdf) version manager.

## Install

Depends on `bash`, `curl`/`wget`, and `tar`.

```
asdf plugin add raku https://github.com/m-dango/asdf-raku.git
asdf list all raku
asdf install raku latest
```

By default, downloads and installs a precompiled [Rakudo](https://rakudo.org/), including the [Zef](https://github.com/ugexe/zef) module manager.

If you set the `$ASDF_RAKU_BUILD` environment variable, Rakudo will instead be built from source, and will not include Zef. Additional dependencies will also be required (which are listed [here](https://rakudo.org/downloads/rakudo/source)).

You can choose your build backends using the `$ASDF_RAKU_BACKENDS` environment variable.

## Use

Check the [asdf readme](https://asdf-vm.com/guide/getting-started.html#_5-install-a-version) for instructions on how to install and manage versions of Raku.

## Notes

Rakudo versions are sourced from [skaji/rakudo-releases](https://github.com/skaji/rakudo-releases).

Borrows heavily from [rakuenv](https://github.com/skaji/rakuenv).
