export DOTFILES="$HOME/dotfiles"

# --- OMZ setup ---
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mh"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git 
  z 
  zsh-syntax-highlighting 
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
# ----------

# --- OMP setup ---
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/oh-my-posh.toml)"
# ----------

# --- brew packages setup ---
source <(fzf --zsh)
# ----------

# Exports 
source $DOTFILES/.exports

# PATH configs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$PATH:$GOROOT/bin"

# Aliases
source $DOTFILES/.aliases

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000




# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
