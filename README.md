```bash
alias configgit='/usr/bin/git --git-dir=$HOME/.cfg_git/ --work-tree=$HOME'
echo ".cfg_git" >> .gitignore
git clone --bare git@github.com:crash5/config.git $HOME/.cfg_git
configgit config --local status.showUntrackedFiles no
```

Source:
 * https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
