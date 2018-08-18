# Dotfiles

### Clone repository

```
cd ~
git clone git@github.com:davidrobles/dotfiles.git
```

### Create symbolic links

```
ln -s dotfiles/tmux.conf ~/.tmux.conf
ln -s dotfiles/vimrc ~/.vimrc
ln -s dotfiles/zshrc ~/.zshrc
```

### Install vim-plug

https://github.com/junegunn/vim-plug

Open vim and run:

```
:PlugInstall
```

### Download Oh My Zsh

https://github.com/robbyrussell/oh-my-zsh

### Change default shell to zsh

```
chsh -s `which zsh`
```

### Restart
