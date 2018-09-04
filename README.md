# Environment
My environment for MacBookPro

## Xcode

AppStore から Xcode をインストールして一度起動する

## Git & SSH

```
$ install -m 700 -d ~/.ssh
```

.ssh/config ファイルを設定

```
$ vi ~/.ssh/config
```

```
Host *
  ServerAliveInterval 1200
  ServerAliveCountMax 12
  TCPKeepAlive yes
  Compression yes
  AddKeysToAgent yes
  UseKeychain yes
  GSSAPIAuthentication no
  UseRoaming no
```

鍵ファイルを作成して GitHub に登録  
参考：https://qiita.com/suthio/items/2760e4cff0e185fe2db9

```
$ ssh-keygen -t rsa -b 4096 -C "email@example.com"
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

virtualbox で躓くことがあるので必要なら先にインストールしておく

```bash
$ brew cask install virualbox
```

注：minikube インストールよりも先に docker for mac の Kubernetes を有効にしてしまうと kubectl が競合してしまう

Brewfile がある場所でパッケージをインストール

```
$ brew bundle
```

Brewfile のバックアップを取る場合は

```
$ brew bundle dump --force
```

## bash

```
$ touch .bash_profile
```

gist から copy

## rbenv

https://github.com/rbenv/rbenv

<!-- 
ruby の path を設定するために `.bash_profile` に書き込む

```
$ echo "eval "$(rbenv init -)"" >> ~/.bash_profile
```
-->

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

nodebrew 用のディレクトリがなぜかなかったので作る

```
mkdir -p ~/.nodebrew/src
```

<!--
パスを通す

```
$ echo "export PATH=\$HOME/.nodebrew/current/bin:\$PATH" >> ~/.bash_profile
$ source ~/.bash_profile
```
-->

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

## 所有権の変更

複数ユーザーで Homebrew を管理していると色々困る  
所有者を統一しておく

```bash
$ sudo chown -R hoge /usr/local/var
$ sudo chown -R hoge /usr/local/Homebrew
$ sudo chown -R hoge /usr/local/Cellar
$ sudo chown -R hoge /usr/local/Caskroom
# 他にもあるかも
```
