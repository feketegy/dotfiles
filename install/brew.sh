# Install Homebrew

if ! command -v brew &>/dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install common packages
brew install git
brew install fzf
brew install bat
brew install eza
brew install ripgrep
brew install fd