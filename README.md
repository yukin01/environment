# Dotfiles
My environment for MacOS and Ubuntu

## MacOS

### Xcode

Install *Xcode* from *App Store* and launch once.


### Installation

Clone this repo and make symlinks for dotfiles.

```bash
$ bash -c "$(curl -fsSL dot.yukin01.dev)"
```


### Git & SSH

Configure SSH settings.

```bash
$ ./ssh.sh
```


### Homebrew

Install *Homebrew* and packages.

```bash
$ ./mac/01_homebrew
```

|                              name                              |           usage           |
|:--------------------------------------------------------------:|:-------------------------:|
|                  [Homebrew](https://brew.sh)                   | Package Manager for MacOS |
| [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) |  Bundler with `Brewfile`  |

You can create a Brewfile from all the existing Homebrew packages.

```bash
$ brew bundle dump --force
```

For `kubectl`, don't enable *Docker for Mac*'s k8s option before installing *Minikube*.


### Languages and Prezto

```bash
$ ./mac/02_setup
```

|                           name                           |                usage                |
|:--------------------------------------------------------:|:-----------------------------------:|
|        [anyenv](https://github.com/anyenv/anyenv)        |        All in one for ** env        |
|         [rbenv](https://github.com/rbenv/rbenv)          |        Ruby version manager         |
|      [bundler](https://github.com/bundler/bundler)       |       Bundler for gem locally       |
|        [nodenv](https://github.com/nodenv/nodenv)        |       Node.js version manager       |
|    [prezto](https://github.com/sorin-ionescu/prezto)     | The configuration framework for Zsh |
| [powerlevel9k](https://github.com/bhilburn/powerlevel9k) |   Zsh theme with Powerline Fonts    |

<!-- - [anyenv](https://github.com/anyenv/anyenv) - All in one for **env
- [rbenv](https://github.com/rbenv/rbenv) - Ruby version manager
- [bundler](https://github.com/bundler/bundler) - Bundler for gem locally
- [nodenv](https://github.com/nodenv/nodenv) - Node.js version manager
- [prezto](https://github.com/sorin-ionescu/prezto) - The configuration framework for Zsh
- [powerlevel9k](https://github.com/bhilburn/powerlevel9k) - Zsh theme with Powerline Fonts -->


### iTerm2

- zsh `/usr/local/bin/zsh`
- [color](https://github.com/wesbos/Cobalt2-iterm)
- [font](https://github.com/powerline/fonts)


### Manual

- Login shell
- Japanese Keyboard
- VSCode Settings Sync
- Google Chrome login


## Ubuntu

Clone this repo.

```bash
$ bash -c "$(curl -fsSL dot.yukin01.dev)"
```

Install Powerline Fonts.

```bash
$ ./fonts/install.sh
```

Configure SSH key pair.

```bash
$ ./ssh.sh
```

Install ansible.

```bash
$ ./ansible/install.sh
```

Run ansible playbook.

```bash
$ ansible-playbook -i hosts ubuntu.yml --ask-become-pass
```


## Suggestion

- fish


## References

- [Generating a new SSH key and adding it to the ssh-agent](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [お前らのSSH Keysの作り方は間違っている](https://qiita.com/suthio/items/2760e4cff0e185fe2db9)
- [MacにHomeBrew,rbenv,bundlerをインストールする](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)
- [ログインシェルとインタラクティブシェルと~/.bashrc達の関係](https://qiita.com/incep/items/7e5760de0c2c748296aa)
- [zshの設定ファイルの読み込み順序と使い方Tipsまとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)
- [DockerのVolumeマウントのオーナーとfixuidとeuid](https://bufferings.hatenablog.com/entry/2018/08/26/015035)
- [優れた dotfiles を設計して、最速で環境構築する話](https://qiita.com/b4b4r07/items/24872cdcbec964ce2178)
