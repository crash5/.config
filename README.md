Install:
```bash
1. Clone it
    git clone git@github.com:crash5/.config.git
2. Your device:
		Bash: sudo echo '[[ ! -z "$PS1" ]] && [[ ! -z "$BASH_VERSION" ]] && . ~/.config/bash/bashrc' >> /etc/profile
	Remote host:
		Bash: ln -s ~/.config/bash/bashrc ~/.bash_profile
3. cd ~/.config && ./bootstrap.sh
```

Sources:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
 * https://github.com/woegjiub/
