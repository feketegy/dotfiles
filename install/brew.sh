# Install Homebrew

if ! command -v brew &> /dev/null
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
