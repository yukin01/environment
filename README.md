# Dotfiles
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

dotfiles リポジトリを clone

```
$ git clone git@~~
```

push 時に必要な情報を設定する

```
$ git config --global user.name "yukin01"
$ git config --global user.email "hogehoge"
```

## Preinstall

homebrew と各パッケージのインストール

| ツール名 | 用途 |
|:-:|:-:|
| [Homebrew](https://brew.sh) | Mac 用パッケージマネージャー |
| [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) | Brewfile で管理するためのツール |

```
$ sh preinstall.sh 2<&1
```

Brewfile のバックアップを取る場合は

```
$ brew bundle dump --force
```

注：minikube インストールよりも先に docker for mac の Kubernetes を有効にしてしまうと kubectl が競合してしまう



## Dotfiles

シンボリックリンクを貼る  
`.bashrc`/`.zshrc`/`.vimrc` などのシェル用 dotfile のみ管理する  
それ以外の dotfile は各ツール再インストール時に作らせる

```
$ sh link.sh 2<&1
```

## 各言語のインストール

homebrew でインストールした以下のバージョン管理ツールを用いる

<!-- - [rbenv](https://github.com/rbenv/rbenv): ruby 本体のバージョンを管理
- [bundler](https://github.com/bundler/bundler): Gem をローカルで管理するために必要
- [nodebrew](https://github.com/hokaccha/nodebrew): node 本体のバージョンを管理
- [goenv](https://github.com/syndbg/goenv): Go 本体のバージョンを管理 -->


| ツール名 | 用途 |
|:---:|:---:|
| [rbenv](https://github.com/rbenv/rbenv) | ruby 本体のバージョンを管理 |
| [bundler](https://github.com/bundler/bundler) | Gem をローカルで管理するために必要 |
| [nodebrew](https://github.com/hokaccha/nodebrew) | node 本体のバージョンを管理 |
| [goenv](https://github.com/syndbg/goenv) | Go 本体のバージョンを管理 |

```
$ sh install.sh 2<&1
```

参考  
[MacにHomeBrew,rbenv,bundlerをインストールする](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)  
[nodebrewでnodejsがインストール出来ないときの対処法](https://qiita.com/twipg/items/c902b32b9e1e9ad7bc97)  

## zsh

ログインシェルは bash のままで iTerm2 を zsh にする

https://github.com/wesbos/Cobalt2-iterm  
https://qiita.com/NaokiIshimura/items/249bb1a101b626a59387

## office & Adobe

~~cask でやらない方がいいんじゃないか説~~  
Adobe の方はインストーラしか入っていないので起動

```
$ open '/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'
```

あとは適当にライセンス認証

## 複数ユーザで使う場合

パーミッションを変更する

```
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
```
