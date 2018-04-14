# Environment
My environment for MacBookPro

## Git & SSH

```
$ install -m 700 -d ~/.ssh
```

鍵ファイルを移動する  
.ssh/config ファイルを設定

```
$ vi ~/.ssh/config
```

```
Host github.com
    HostName github.com
    IdentityFile hogehoge
    User yukin01
```

environment を clone

```
$ git clone git@~~
```

push 時に必要な情報を設定する

```
$ git config --global user.name "yukin01"
$ git config --global user.email "hogehoge"
```

## Xcode
AppStore から Xcode をインストールして一度起動する

## Homebrew
https://brew.sh

## brew bundle
https://github.com/Homebrew/homebrew-bundle

Brewfile がある場所でパッケージをインストール

```
$ brew bundle
```

バックアップを取る場合は

```
$ rm Brewfile
$ brew bundle dump
```

## bash

zsh にするかも

```
$ touch .bash_profile
```