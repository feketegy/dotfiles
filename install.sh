DOTFILES=$(realpath ./)

# Copy font
rsync -r -u $DOTFILES/fonts/mononoki-v1.6-nerdfont/*.ttf $HOME/Library/Fonts

# --- Configure macOS ---
source $DOTFILES/.macos
# ----------

# --- Install packages ---
source $DOTFILES/install/brew.sh
source $DOTFILES/install/omz.sh
source $DOTFILES/install/omp.sh

source $DOTFILES/install/tmux.sh
source $DOTFILES/install/wezterm.sh
# ----------

# --- Setup the symlinks ---
if [ -e $HOME/.zshrc ]
then
  mv $HOME/.zshrc $HOME/.zshrc.pre-dotfiles
fi

ln -sf $DOTFILES/.zshrc $HOME/.zshrc
ln -sfh $DOTFILES/config/oh-my-posh $HOME/.config/oh-my-posh
# ----------