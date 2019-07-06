# Dotfiles
My environment for MacBookPro

## Xcode

AppStore から Xcode をインストールして一度起動する

## Git & SSH

```bash
$ install -m 700 -d ~/.ssh
```

.ssh/config ファイルを設定

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

鍵ファイルを作成して GitHub に登録  
参考：https://qiita.com/suthio/items/2760e4cff0e185fe2db9

```bash
$ ssh-keygen -t rsa -b 4096 -C "email@example.com"
```

dotfiles リポジトリを clone

```bash
$ git clone git@~~
```

push 時に必要な情報を設定する

```bash
$ git config --global user.name "yukin01"
$ git config --global user.email "hogehoge"
```

## Preinstall

homebrew と各パッケージのインストール

| ツール名 | 用途 |
|:-:|:-:|
| [Homebrew](https://brew.sh) | Mac 用パッケージマネージャー |
| [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) | Brewfile で管理するためのツール |

```bash
$ sh preinstall.sh 2<&1
```

Brewfile のバックアップを取る場合は

```bash
$ brew bundle dump --force
```

注：minikube インストールよりも先に docker for mac の Kubernetes を有効にしてしまうと kubectl が競合してしまう

## Dotfiles

シンボリックリンクを貼る  
`.bashrc`/`.zshrc`/`.vimrc` などのシェル用 dotfile のみ管理する  
それ以外の dotfile は各ツール再インストール時に作らせる

```bash
$ sh link.sh 2<&1
```

### shell ごとの設定ファイルについて

- [ログインシェルとインタラクティブシェルと~/.bashrc達の関係](https://qiita.com/incep/items/7e5760de0c2c748296aa)
- [zshの設定ファイルの読み込み順序と使い方Tipsまとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)

## 各言語のインストール

homebrew でインストールした以下のバージョン管理ツールを用いる

| ツール名 | 用途 |
|:---:|:---:|
| [rbenv](https://github.com/rbenv/rbenv) | ruby 本体のバージョンを管理 |
| [bundler](https://github.com/bundler/bundler) | Gem をローカルで管理するために必要 |
| [nodebrew](https://github.com/hokaccha/nodebrew) | node 本体のバージョンを管理 |
| [goenv](https://github.com/syndbg/goenv) | Go 本体のバージョンを管理 |

```bash
$ sh install.sh 2<&1
```

参考  
[MacにHomeBrew,rbenv,bundlerをインストールする](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)  
[nodebrewでnodejsがインストール出来ないときの対処法](https://qiita.com/twipg/items/c902b32b9e1e9ad7bc97)  

## iTerm2

ログインシェルは bash のままで iTerm2 を zsh にする

参考  
https://github.com/wesbos/Cobalt2-iterm  
https://qiita.com/NaokiIshimura/items/249bb1a101b626a59387

## 複数ユーザで使う場合

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
```
