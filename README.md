1. Clone it
```bash
    git clone --bare git@github.com:crash5/config.git $HOME/.cfg_git
    alias config='/usr/bin/git --git-dir=$HOME/.cfg_git/ --work-tree=$HOME'
    echo ".cfg_git" >> .gitignore
    config config --local status.showUntrackedFiles no
```

2. Your device:
		Bash: sudo echo '[[ ! -z "$PS1" ]] && [[ ! -z "$BASH_VERSION" ]] && . ~/.config/bash/bashrc' >> /etc/profile
	Remote host:
		Bash: ln -s ~/.config/bash/bashrc ~/.bash_profile

Source:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
 * https://github.com/woegjiub/
