# Config

## Install

Clone repository

### Bash

In bash or git bash:
```
echo ". ~/.config/bash/bashrc" > .bash_profile
cd ~/.config && ./bootstrap.sh
```

### Git

Add computer specific modifications to `~/.local/gitconfig`

### VS Code

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
* Scintilal command ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/scintilla/include/Scintilla.h
* NP++ menu ids: https://github.com/notepad-plus-plus/notepad-plus-plus/blob/master/PowerEditor/src/menuCmdID.h

### Beyond Compare

#### Windows
It's look like BC can't write linked files...
```
mklink "%APPDATA%\Scooter Software\Beyond Compare 4\BCPreferences.xml" %USERPROFILE%\.config\bcompare\BCPreferences.xml
mklink "%APPDATA%\Scooter Software\Beyond Compare 4\BCSessions.xml" %USERPROFILE%\.config\bcompare\BCSessions.xml
```

### WinRAR

#### Windows
```
mklink "%APPDATA%\WinRAR\WinRAR.ini" %USERPROFILE%\.config\winrar\WinRAR.ini
```

---
Sources:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
 * https://github.com/woegjiub/
