# Install Oh My Posh

if ! command -v oh-my-posh &> /dev/null
then
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
fi

# setup symlink to configs
ln -sfh $DOTFILES/config/oh-my-posh $HOME/.config/oh-my-posh