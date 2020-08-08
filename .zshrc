# Additional user paths
user_paths=(
  "${HOME}/.local/usr/bin"
  "${HOME}/.local/bin"
  "${HOME}/.cargo/bin"
  "${HOME}/.yarn/bin"
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Node Version Manager base directory.
export NVM_DIR="$HOME/.nvm"

# Additional sourced file
sourced_file=(
  "${ZSH}/oh-my-zsh.sh"
  "${HOME}/.zsh_keybind"
  "${HOME}/.aliases"
  "${HOME}/.functions" 
  "${NVM_DIR}/nvm.sh"
)

if [[ -z $USERPATH_ADDED ]]
then
  # Adding user paths to PATH variable
  for ex_path in ${user_paths}
  do
    PATH="$ex_path:$PATH"
  done
  export PATH
  export USERPATH_ADDED=1
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ "$TERM" == "linux" ]]
then
  ZSH_THEME="bureau"
else
  ZSH_THEME="agnoster"
fi

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  cargo
  emoji
  yarn
)

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR='vim'

# ssh default identity
export SSH_KEY_PATH="~/.ssh/rsa_id"

# non interactive skip aliases and function
[[ "$-" != *i* ]] && return

# Sourcing  additional files
for to_source in ${sourced_file}
do
  if [[ -f "${to_source}" ]]
  then
    source "${to_source}"
  fi
done

# Display INSERT or NORMAL mode
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# do not use default ruby path
export PATH="$PATH:$HOME/.rvm/bin"

# virtual env activation
alias venva='source ./bin/activate'
