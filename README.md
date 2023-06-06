# Config

## Install

Clone repository

### Bash

In bash or git bash:
```
echo ". ~/.config/bash/bashrc" >> .bashrc
echo ". ~/.config/bash/profile" >> .profile
cd ~/.config && ./bootstrap.sh
```

Additional for windows (slash direction matters):
```
setx XDG_CACHE_HOME  "C:/Users/%USERNAME%/.cache/"
setx XDG_CONFIG_HOME "C:/Users/%USERNAME%/.config/"
setx XDG_DATA_HOME   "C:/Users/%USERNAME%/.local/share/"
```


### Git

Add computer specific modifications to `~/.local/gitconfig`

### VS Code

Plugins:
  - [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
  - [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
  - [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
  - [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
  - [Better Align](https://marketplace.visualstudio.com/items?itemName=wwm.better-align)


#### Windows

```
mklink %APPDATA%\Code\User\settings.json %USERPROFILE%\.config\vscode\settings.json
mklink %APPDATA%\Code\User\keybindings.json %USERPROFILE%\.config\vscode\keybindings.json
mklink /D %APPDATA%\Code\User\snippets %USERPROFILE%\.config\vscode\snippets
```

### Qt Creator

#### Windows
```
mklink %APPDATA%\QtProject\qtcreator\styles\twilight.xml %USERPROFILE%\.config\qtcreator\styles\twilight.xml
mklink %APPDATA%\QtProject\qtcreator\snippets\snippets.xml %USERPROFILE%\.config\qtcreator\snippets\snippets.xml

mklink %APPDATA%\QtProject\qtcreator\externaltools\SublimeText.xml %USERPROFILE%\.config\qtcreator\externaltools\SublimeText.xml
mklink %APPDATA%\QtProject\qtcreator\externaltools\Sort_selection_unique.xml %USERPROFILE%\.config\qtcreator\externaltools\Sort_selection_unique.xml
mklink %APPDATA%\QtProject\qtcreator\externaltools\Notepad__.xml %USERPROFILE%\.config\qtcreator\externaltools\Notepad__.xml
mklink %APPDATA%\QtProject\qtcreator\externaltools\VSCode.xml %USERPROFILE%\.config\qtcreator\externaltools\VSCode.xml
```

### Notepad++

Set the cloud directory: Settings -> Preferences -> Cloud

Menu ids:
  - Scintilal command ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/scintilla/include/Scintilla.h
  - NP++ menu ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/PowerEditor/src/menuCmdID.h

### Beyond Compare

#### Windows
It's look like BC can't write linked files so have to use the registry.

In command line:
```
reg add "HKCU\Software\Scooter Software" /f /v SettingsPath /d "c:\Users\<USER NAME>\.config\bcompare"
```

### WinRAR

#### Windows
```
mklink "%APPDATA%\WinRAR\WinRAR.ini" %USERPROFILE%\.config\winrar\WinRAR.ini
```

### Total Commander

#### Windows
```
mklink "%APPDATA%\GHISLER\wincmd.ini" %USERPROFILE%\.config\totalcommander\wincmd.ini
mklink "%APPDATA%\GHISLER\usercmd.ini" %USERPROFILE%\.config\totalcommander\usercmd.ini
```

### Firefox

Install search providers: https://crash5.github.io/.config/firefox/searchengines/

#### Windows
```
mklink "%APPDATA%\Mozilla\Firefox\Profiles\<PROFILE DIR>\user.js" %USERPROFILE%\.config\firefox\user.js
```

### Vim

Add local changes to: `~/.local/vimrc`
```
ln -s $XDG_CONFIG_HOME/vim/vimrc ~/.vimrc
```

Plugins:
```
packages=(
    "https://github.com/bkad/CamelCaseMotion"
    "https://github.com/editorconfig/editorconfig-vim"
    "https://github.com/vim-scripts/ReplaceWithRegister"
    "https://github.com/godlygeek/tabular"
    "https://github.com/tpope/vim-commentary"
    "https://github.com/machakann/vim-highlightedyank"
    "https://github.com/machakann/vim-sandwich"
    "https://github.com/tpope/vim-unimpaired"
    "https://github.com/bronson/vim-visual-star-search"
    "https://github.com/michaeljsmith/vim-indent-object"
    "https://github.com/unblevable/quick-scope"
)

for url in ${packages[@]}; do
    path=vim/pack/bundle/start/${url##*/}/
    if [ ! -d "$path" ]; then
        path=vim/pack/bundle/opt/${url##*/}/
    fi
    if [ ! -d "$path" ]; then
        echo "Plugin not found, skipping... ${path}"
        continue
    fi
    git fetch --depth 1 --no-tags "${url}" &&
    git rm -r --ignore-unmatch "${path}" && git read-tree --prefix="${path}" FETCH_HEAD && git checkout -- "${path}" &&
    git commit -m "vim: update plugin: ${url##*/}" -- "${path}"
    # read  -n 1 -p "Check next?" mainmenuinput
done
```

### Python/Poetry

#### Windows

```
mklink "%APPDATA%\pypoetry" %USERPROFILE%\.config\poetry\config.toml
```

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
