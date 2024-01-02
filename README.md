# Config

## Install

Clone repository


### Bash

In bash or git bash:
```
~/.config/bootstrap.sh

sed -i "1s/^/\. ~\/.config\/bash\/profile\n/" ~/.profile
echo ". ~/.config/bash/bashrc" >> ~/.bashrc

ln -s $XDG_CONFIG_HOME/vim/vimrc ~/.vimrc

# Git for windows
echo ". ~/.profile" >> ~/.bash_profile
echo ". ~/.bashrc" >> ~/.bash_profile
```


### Windows

- For XDG dir setup: `bootstrap.cmd`
- To create link for config files: `bootstrap-links.cmd`


## Other

### Local changes

- Git: `~/.local/share/git/gitconfig`
- Vim: `~/.local/share/vim/vimrc`
- Bash: `~/.local/share/bash/bashrc`

### VS Code

Plugins:
  - [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
  - [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
  - [neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
  - [Copy With Line Numbers](https://marketplace.visualstudio.com/items?itemName=yassh.copy-with-line-numbers)
  - [autoDocstring - Python](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
  - [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
  - [Better Align](https://marketplace.visualstudio.com/items?itemName=wwm.better-align)


### Notepad++

Set the cloud directory: Settings -> Preferences -> Cloud

Menu ids:
  - Scintilal command ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/scintilla/include/Scintilla.h
  - NP++ menu ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/PowerEditor/src/menuCmdID.h

### Beyond Compare

It's look like BC can't write linked files so have to use the registry.

In command line:
```
reg add "HKCU\Software\Scooter Software" /f /v SettingsPath /d "c:\Users\<USER NAME>\.config\bcompare"
```

### Firefox

Install search providers: https://crash5.github.io/.config/firefox/searchengines/


### Apps

- https://github.com/junegunn/fzf
- https://github.com/BurntSushi/ripgrep
- https://github.com/ogham/exa
- https://github.com/vim/vim-appimage
- https://github.com/neovim/neovim
- https://github.com/flameshot-org/flameshot
- https://github.com/vifm/vifm
- https://github.com/sharkdp/bat

---
Sources:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
