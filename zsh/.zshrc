# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion. 
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
#'s making and what it's unborking on my end, but I'm incredibly happy to have that basic behavior back for whatever reason it may've been gone. Thank you!'s making and what it's unborking on my end, but I'm incredibly happy to have that basic behavior back for whatever reason it may've been gone. Thank you! 's making and what it's unborking on my end, but I'm incredibly happy to have that basic behavior back for whatever reason it may've been gone. Thank you! Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting) 
TERM=xterm-256color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ----- NVIM -----
export PATH="$PATH:/opt/nvim-linux64/bin"

alias v='file=$(fd --type f --hidden --exclude .git | fzf-tmux -p -h 65% -w 70% --reverse --preview "bat --color=always --style=numbers {}") && [ -n "$file" ] && nvim "$file"'
# alias v='fd --type f --hidden --exclude .git | fzf-tmux -p -h 70% -w 60% --reverse --preview "batcat --color=always --style=numbers --line-range=:200 {}" | xargs nvim'
# "fd --type f --hidden --exclude .git | fzf-tmux -p -h 70% -w 60% --color=bg+:#1376F9,gutter:-1 --preview 'batcat --theme=tokyonight_night --color=always --style=full --line-range=:200 {1}' | xargs nvim"

# ----- FZF ----
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS=--color=bg+:#1376F9,gutter:-1

_fzf_compgen_path() {
fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir(){
fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

_fzf_comprun() {
local command=$1
shift

case "$command" in
cd)           fzf-tmux -p -h 50% -w 40% --preview 'eza --tree --color=always --icons=always {} | head -199' "$@" ;;
export|unset) fzf-tmux -p -h 40% -w 40% --preview 'env | grep -w {}' ;;
ssh)          fzf-tmux -p -h 50% -w 40% --preview 'dig +short {}; ping -c 1 {}; ssh-keyscan -t rsa,ecdsa,ed25519 {} 2>/dev/null | sort' "$@" ;;
*)            fzf-tmux -p -h 50% -w 40% --preview "$show_file_or_dir_preview" "$@" ;;
esac
}



# ----- BATCAT -----
export BAT_THEME=tokyonight_night

# ----- NVIM -----

# ----- EZA -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions -a"


# ----- ZOXIDE ----- 
eval "$(zoxide init --cmd cd zsh)"

# ----- Starship -----
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# ----- GO ------
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

