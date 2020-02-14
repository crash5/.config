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
```

### Firefox

Install search providers: https://crash5.github.io/.config/firefox/searchengines/

#### Windows
```
mklink "%APPDATA%\Mozilla\Firefox\Profiles\<PROFILE DIR>\user.js" %USERPROFILE%\.config\firefox\user.js
```

### Vim

Plugins:
  - [vim-sandwich](https://github.com/machakann/vim-sandwich)
  - [Tabular](https://github.com/godlygeek/tabular)
  - [Editorconfig](https://github.com/editorconfig/editorconfig-vim)
  - [vim-commentary](https://github.com/tpope/vim-commentary)
  - [Replace with register](https://github.com/vim-scripts/ReplaceWithRegister)

---
Sources:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
 * https://github.com/woegjiub/
