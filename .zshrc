# ============================================================================
# ZSH CONFIGURATION
# ============================================================================
# This file is loaded for each new interactive shell session (new tab/window)
# Environment variables and one-time setup are in ~/.zprofile
# ============================================================================

# ----------------------------------------------------------------------------
# Oh-My-Zsh Configuration (Disabled)
# ----------------------------------------------------------------------------
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/ivanvoid/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="oxide"
# ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git iterm2)

# source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------------------------
# User Configuration
# ----------------------------------------------------------------------------
# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ============================================================================
# COLORS AND LS CONFIGURATION
# ============================================================================
# Generate color scheme with vivid (cached for performance)
# Cache is regenerated only when .zshrc is modified
if [[ ! -f ~/.cache/vivid_snazzy.cache ]] || [[ ~/.zshrc -nt ~/.cache/vivid_snazzy.cache ]]; then
    mkdir -p ~/.cache
    vivid generate snazzy > ~/.cache/vivid_snazzy.cache
fi
export LS_COLORS="$(cat ~/.cache/vivid_snazzy.cache)"

# Use GNU ls with color support (requires: brew install coreutils)
alias ls="gls --color"
alias l="gls --color"
alias ll='ls -la'


# ============================================================================
# TERMINAL INTEGRATION
# ============================================================================
# Load iTerm2 shell integration if available
# Provides features like shell marks, badges, and improved terminal interaction
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# ============================================================================
# GIT COMPLETION SETUP
# ============================================================================
# Setup instructions (already done):
# mkdir -p ~/.zsh
# cd ~/.zsh
# curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Configure git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# Initialize completion system with cache (-C flag skips security check for speed)
# Run 'rm ~/.zcompdump && compinit' manually if you install new completions
autoload -Uz compinit
compinit -C


# ============================================================================
# PROMPT CONFIGURATION
# ============================================================================
# Load VCS (Version Control System) info for git branch display
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# Custom prompt format
# Color codes: 168=pink, 69=blue, 174=salmon
# Format: ~/path/to/dir ⌥ branch-name ❯
PROMPT='%F{168}%~%f ⌥ %F{69}${vcs_info_msg_0_}%f %F{174}❯%f%b '


# ============================================================================
# BUN COMPLETIONS
# ============================================================================
# Load Bun shell completions if available
[ -s "/Users/ivanvoid/.bun/_bun" ] && source "/Users/ivanvoid/.bun/_bun"


# ============================================================================
# CUSTOM ALIASES
# ============================================================================
# Media conversion aliases using yt-dlp and ffmpeg
alias ytmp3='yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias ytwav='yt-dlp -x --audio-format wav -o "%(title)s.%(ext)s"'
alias ogg2wav='ffmpeg -i "$1" "${1%.ogg}.wav"'
