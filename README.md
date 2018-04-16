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

複数ユーザで使う場合はパーミッションを変更する

```
$ sudo chmod -R g+w /usr/local/var
$ sudo chmod -R g+w /usr/local/Homebrew
```

参考：[複数のユーザーでHomebrewを使う
](https://qiita.com/yshishido/items/ba5cd86afe217b221457)

## Homebrew-bundle

https://github.com/Homebrew/homebrew-bundle

virtualbox で躓くはずなので先にインストールしておく

```
$ brew cask install virualbox
```

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

ruby の path を設定するために `.bash_profile` に書き込む

```
$ echo "eval "$(rbenv init -)"" >> ~/.bash_profile
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

https://github.com/bundler/bundler
https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b

bundler だけ global の gem で管理

```
$ gem install bundler
```

これ以後は各リポジトリ内で設定

## nodebrew

https://github.com/hokaccha/nodebrew
https://qiita.com/twipg/items/c902b32b9e1e9ad7bc97

nodebrew 用のディレクトリがなぜかなかったので作る

```
mkdir -p ~/.nodebrew/src
```

パスを通す

```
$ echo "export PATH=\$HOME/.nodebrew/current/bin:\$PATH" >> ~/.bash_profile
$ source ~/.bash_profile
```

安定版の nodejs をインストール

```
$ nodebrew install stable
$ nodebrew use stable
$ node -v
$ npm -v
```

## office & Adobe

~~cask でやらない方がいいんじゃないか説~~  
Adobe の方はインストーラしか入っていないので起動

```
$ open '/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'
```

あとは適当にライセンス認証
