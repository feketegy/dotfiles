# Install Homebrew

if ! command -v brew &> /dev/null
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages
brew install alacritty
brew install tmux
brew install fzf
brew install bat
brew install eza
