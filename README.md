# Dotfiles

What I use in my daily work, updated every so often. Use at your own risk.

## NEOVIM

`cd && ln -s ~/dotfiles/nvim ~/.config/nvim`

## ZSH

`cd && ln -s ./dotfiles/.zshrc .zshrc`

`cd && ln -s ./dotfiles/.zsh .zsh`

## TMUX

`cd && ln -s ./dotfiles/.tmux.conf.local .tmux.conf.local`

## ctags

`cd && ln -s ./dotfiles/.ctags .ctags

## iTerm

Some ideas:

- Apperance > Dimming: I like to have dimming enabled if window is not active
- Profiles > Colors > Smart Box Cursor Color: Easier to find the cursor (alternatively: use a signal color)

# Lanugages

## Scala

To use coc with Scala, execute `:CocInstall coc-metals`
This should add metals to the coc server and the rest is configured in the dotfiles.
