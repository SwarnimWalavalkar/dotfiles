### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit light starship/starship

# ZSH Plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit load azu/ni.zsh

PROMPT="${PROMPT}"$'\n\n'

setopt autocd

# alias ls="ls --color=auto"
alias lsa='ls -lah --color=auto'
alias l='ls -lah --color=auto'
alias ll='ls -lh --color=auto'
alias ls="ls -lh --color=auto"
alias la='ls -lAh --color=auto'

alias md='mkdir -p'
alias rd=rmdir

alias cat=bat
alias tunnel_start="sudo launchctl start com.cloudflare.cloudflared"
alias tunnel_stop="sudo launchctl stop com.cloudflare.cloudflared"

alias code="cursor"
alias c="cursor"
alias vcode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias ws="windsurf"
alias ai="aichat"

# PATH -------------------------------------------------------------------------------------------------------

export PATH="$PATH:/Users/swarnim/.deta/bin"
export PATH="$PATH:/Users/swarnim/go/bin"

# -------------------------------------------------------------------------------------------------------------

# Environment Variables -----------------------------------------------------------------------------------------------

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# -------------------------------------------------------------------------------------------------------------

# Scripts -----------------------------------------------------------------------------------------------------

function jsfmt() {
  echo $1 | jq '.'
}

function tsconf() {
  curl https://gist.githubusercontent.com/SwarnimWalavalkar/31cb29686964e071d340b36493a34be0/raw/633cfde705b4fe011011772820f00891183685b7/tsconfig.json -o tsconfig.json
}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# bun completions
[ -s "/Users/swarnim/.bun/_bun" ] && source "/Users/swarnim/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/swarnim/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(zoxide init zsh)"

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use --silent
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    nvm use default --silent
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# opencode
export PATH=/Users/swarnim/.opencode/bin:$PATH

. "$HOME/.local/bin/env"
