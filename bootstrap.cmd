setx XDG_CONFIG_HOME "C:/Users/%USERNAME%/.config/"
setx XDG_DATA_HOME   "C:/Users/%USERNAME%/.local/share/"
setx XDG_STATE_HOME  "C:/Users/%USERNAME%/.local/state/"
setx XDG_BIN_HOME    "C:/Users/%USERNAME%/.local/bin"
setx XDG_LIB_HOME    "C:/Users/%USERNAME%/.local/lib"
setx XDG_CACHE_HOME  "C:/Users/%USERNAME%/.cache"

mklink %APPDATA%\Code\User\settings.json %USERPROFILE%\.config\vscode\settings.json
mklink %APPDATA%\Code\User\keybindings.json %USERPROFILE%\.config\vscode\keybindings.json
mklink /D %APPDATA%\Code\User\snippets %USERPROFILE%\.config\vscode\snippets

mklink "%APPDATA%\WinRAR\WinRAR.ini" %USERPROFILE%\.config\winrar\WinRAR.ini

mklink "%APPDATA%\GHISLER\wincmd.ini" %USERPROFILE%\.config\totalcommander\wincmd.ini
mklink "%APPDATA%\GHISLER\usercmd.ini" %USERPROFILE%\.config\totalcommander\usercmd.ini

mklink "%APPDATA%\pypoetry" %USERPROFILE%\.config\poetry\config.toml

