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

## rbenv

https://github.com/rbenv/rbenv

ruby の path を設定するために `.bash_profile` に以下を追加

```
eval "$(rbenv init -)"
```

rbenv で ruby の version を管理  
(LTS ならなんでもいい)

```
$ source ~/.bash_profile
$ rbenv version
$ rbenv versions
$ ruby -v
$ rbenv install 2.5.1
$ rbenv global 2.5.1
$ rbenv rehash
$ rbenv versions
$ ruby -v
```

## bundler

https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b

bundler だけ global の gem で管理

```
$ gem install bundler
```

これ以後は各リポジトリ内で設定