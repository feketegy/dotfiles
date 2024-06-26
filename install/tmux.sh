
# Install tmux
brew install tmux

# Clone the tpm plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Symlink the tmux config
ln -sf $DOTFILES/config/tmux/.tmux.conf $HOME/.tmux.conf