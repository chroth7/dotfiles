# Dotfiles

What I use in my daily work, updated every so often. Use at your own risk.

## VIM

`cd && ln -s ./dotfiles/.vimrc .vimrc`

## ZSH

`cd && ln -s ./dotfiles/.zshrc .zshrc`

`cd && ln -s ./dotfiles/.zsh .zsh`

## TMUX

`cd && ln -s ./dotfiles/.tmux.conf.local .tmux.conf.local`

## ctags

`cd && ln -s ./dotfiles/.ctags .ctags

## SNIPPETS

Deprecated - we are moving to SirVer/ultisnips and honza/vim-snippets.

`cd && ln -s ./dotfiles/snippets ./.vim/snippets`

## PLUGINS

We have some scripts that we want to add, and to automate this we simply link it to the ~/.vim/plugin folder.
If you have other plugins in that folder, you might want to apply a different strategy.

`cd && ln -s ./dotfiles/plugin ./.vim/plugin`

## iTerm

Some ideas:

- Apperance > Dimming: I like to have dimming enabled if window is not active
- Profiles > Colors > Smart Box Cursor Color: Easier to find the cursor (alternatively: use a signal color)

# Lanugages

## Scala

To use coc with Scala, execute `:CocInstall coc-metals`
This should add metals to the coc server and the rest is configured in the dotfiles.
