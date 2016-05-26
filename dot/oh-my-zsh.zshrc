# Path to your oh-my-zsh installation.
export ZSH=/Users/mtavano/.oh-my-zsh
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# Set name of the theme to load.  Look in ~/.oh-my-zsh/themes/ Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="mtavano2"
# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails osx zsh_reload zsh-completions zsh-syntax-highlighting)

# User configuration

export PATH="/Users/mtavano/.rbenv/shims:/usr/local/bin:/Users/mtavano/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/mongo:/usr/bin/python"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"
alias nvimcofig="nvim ~/.nvimrc"
alias gitconfig="nvim ~/.gitconfig"
alias apollo="cd ~/Documents/Codes/Finciero/apollo"
alias finciero="cd ~/Documents/Codes/Finciero"
alias v="nvim"
alias run="npm run-script"
alias pg="ping 8.8.8.8"
alias gogo="cd ~/Documents/Codes/go/src/github.com/mtavano"
alias gtree="git log --oneline --graph --color --all --decorate"
alias gt="git stash"
alias gif='!f() { [ \"$GIT_PREFIX\" != \"\" ] && cd "$GIT_PREFIX"; git diff --color $@ | diff-so-fancy | less --tabs=4 -RFX; }; '
alias vp=" nvim ~/.config/nvim/init.vim"
alias v.="nvim ."
alias compile="clang++ -std=c++11 -o out"
alias codes="cd ~/Documents/Codes"
alias horus="cd ~/Documents/Codes/web-dev/backend"
# alias gop="cd ~/go/src/github.com/mtavano/"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# # fix terminals to
[[ -f "~/.$TERM.ti" ]] && tic ~/$TERM.ti

function ip() {
  ifconfig | grep inet | grep broadcast | awk '{print $2}'
}
function rip() {
  dig +short myip.opendns.com @resolver1.opendns.com
}
function ips() {
  local private_ip=`ip`;
  echo "Private ip: $private_ip";
  local public_ip=`rip`;
  echo "Public ip: $public_ip";
}
export GOPATH=/Users/mtavano/Documents/Codes/go
export PATH="/usr/local/sbin:$PATH"
source /Users/mtavano/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export HOMEBREW_GITHUB_API_TOKEN=f7f1ecece39a41f05a7909beece0535a973ea4d4

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

