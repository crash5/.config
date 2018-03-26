# Config

## Install

```
git clone git@github.com:crash5/.config.git
```

### Bash

In bash or git bash:
```
echo ". ~/.config/bash/bashrc" > .bash_profile
cd ~/.config && ./bootstrap.sh
```

### VS Code

#### Windows

```
mklink %APPDATA%\Code\User\settings.json %USERPROFILE%\.config\vscode\settings.json
mklink %APPDATA%\Code\User\keybindings.json %USERPROFILE%\.config\vscode\keybindings.json
mklink /D %APPDATA%\Code\User\snippets %USERPROFILE%\.config\vscode\snippets
```

### Notepad++

Set the cloud directory: Settings -> Preferences -> Cloud

Menu ids:
* Scintilal command ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/scintilla/include/Scintilla.h
* NP++ menu ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/PowerEditor/src/menuCmdID.h


---
Sources:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
 * https://github.com/woegjiub/
