# Dotfiles

What I use in my daily work, updated every so often. Use at your own risk.

## VIM

`cd && ln -s ./dotfiles/.vimrc .vimrc`

## ZSH

`cd && ln -s ./dotfiles/.zshrc .zshrc`

`cd && ln -s ./dotfiles/.zsh .zsh`

## TMUX

`cd && ln -s ./dotfiles/.tmux.conf.local .tmux.conf.local`

## SNIPPETS

`cd && ln -s ./dotfiles/snippets ./.vim/snippets`

## PLUGINS

We have some scripts that we want to add, and to automate this we simply link it to the ~/.vim/plugin folder.
If you have other plugins in that folder, you might want to apply a different strategy.

`cd && ln -s ./dotfiles/plugin ./.vim/plugin`
