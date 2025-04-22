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

# --- brew and packages ---

# auto-update every 3 days
export HOMEBREW_AUTO_UPDATE_SECS=259200 

source <(fzf --zsh)
# ----------

# Exports 
source $DOTFILES/.exports

# PATH configs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$PATH:$GOROOT/bin:$HOME/go/bin"

# Aliases
source $DOTFILES/.aliases

# History
HISTFILE=~/.zsh_history
HISTSIZE=999
SAVEHIST=1000


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
