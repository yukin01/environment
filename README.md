# Dotfiles
My environment for MacBookPro

## Xcode

Install *Xcode* from *App Store* and launch once.

## Git & SSH

```bash
$ install -m 700 -d ~/.ssh
```

Generate `.ssh/config`.

```bash
$ echo "Host *
  ServerAliveInterval 1200
  ServerAliveCountMax 12
  TCPKeepAlive yes
  Compression yes
  AddKeysToAgent yes
  UseKeychain yes
  GSSAPIAuthentication no
  UseRoaming no" > ~/.ssh/config
```

Generate an SSH key and upload it to GitHub.

```bash
$ ssh-keygen -t rsa -b 4096 -C "email@example.com"
```

Clone this repo.

```bash
$ git clone git@~~
```

Set global git configurations.

```bash
$ git config --global user.name "yukin01"
$ git config --global user.email "hogehoge"
```

## Preinstall

Install *Homebrew* and packages.

|                              name                              |           usage           |
|:--------------------------------------------------------------:|:-------------------------:|
|                  [Homebrew](https://brew.sh)                   | Package Manager for MacOS |
| [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) |  Bundler with `Brewfile`  |

```bash
$ sh preinstall.sh 2<&1
```

You can create a Brewfile from all the existing Homebrew packages.

```bash
$ brew bundle dump --force
```

For `kubectl`, don't enable *Docker for Mac*'s k8s option before installing *Minikube*.

## Dotfiles

Create symbolic links for shell settings.
e.g. `.bashrc`/`.zshrc`/`.vimrc`

```bash
$ sh link.sh 2<&1
```

## Languages and ZSH

|                     name                      |          usage          |
|:---------------------------------------------:|:-----------------------:|
|    [rbenv](https://github.com/rbenv/rbenv)    |  Ruby version manager   |
| [bundler](https://github.com/bundler/bundler) | Bundler for gem locally |
|  [nodenv](https://github.com/nodenv/nodenv)   | Node.js version manager |

```bash
$ sh install.sh 2<&1
```

### iTerm2

- zsh `/usr/local/bin/zsh`
- [color](https://github.com/wesbos/Cobalt2-iterm)
- [font](https://github.com/powerline/fonts)

## TODO

- oh-my-zsh to [prezto](https://github.com/sorin-ionescu/prezto)
- cobalt2 to [powerlevel9k](https://github.com/bhilburn/powerlevel9k)
- [suggestion] fish

## References

- [お前らのSSH Keysの作り方は間違っている](https://qiita.com/suthio/items/2760e4cff0e185fe2db9)
- [MacにHomeBrew,rbenv,bundlerをインストールする](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)
- [nodebrewでnodejsがインストール出来ないときの対処法](https://qiita.com/twipg/items/c902b32b9e1e9ad7bc97)
- [oh my zsh 導入手順メモ (Mac)](https://qiita.com/NaokiIshimura/items/249bb1a101b626a59387)
- [ログインシェルとインタラクティブシェルと~/.bashrc達の関係](https://qiita.com/incep/items/7e5760de0c2c748296aa)
- [zshの設定ファイルの読み込み順序と使い方Tipsまとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)

<!-- ## 複数ユーザで使う場合

パーミッションを変更する

```bash
$ sudo chmod -R g+w /usr/local/var
$ sudo chmod -R g+w /usr/local/Homebrew
```

参考：[複数のユーザーでHomebrewを使う](https://qiita.com/yshishido/items/ba5cd86afe217b221457)

所有者を統一しておく

```bash
$ sudo chown -R hoge /usr/local/var
$ sudo chown -R hoge /usr/local/Homebrew
$ sudo chown -R hoge /usr/local/Cellar
$ sudo chown -R hoge /usr/local/Caskroom
# 他にもあるかも
``` -->
