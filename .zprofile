# ============================================================================
# ZSH PROFILE CONFIGURATION
# ============================================================================
# This file is loaded ONCE when you login (first terminal window)
# All environment variables and one-time setup should be here
#
# Performance optimizations:
# - NVM is lazy-loaded (loads only when node/npm/nvm is called)
# - This reduces initial login time from ~1.5s to ~0.1s
# ============================================================================


# ============================================================================
# GO LANGUAGE ENVIRONMENT
# ============================================================================
export GOPATH=/Users/ivanvoid/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:/Users/ivanvoid/go
export GO111MODULE=on


# ============================================================================
# PICO SDK PATH
# ============================================================================
# Raspberry Pi Pico SDK location
export PICO_SDK_PATH=/Users/ivanvoid/pico-sdk


# ============================================================================
# BUN RUNTIME ENVIRONMENT
# ============================================================================
# Fast JavaScript runtime and package manager
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# ============================================================================
# NODE VERSION MANAGER (NVM) - LAZY LOADED
# ============================================================================
# NVM is the slowest part of shell startup (~1-1.5s)
# Instead of loading immediately, we define stub functions that load NVM
# only when you actually use node, npm, npx, or nvm commands
#
# Benefits:
# - Instant shell startup
# - NVM loads automatically when needed
# - No manual intervention required
export NVM_DIR="$HOME/.nvm"

# Lazy-load function: loads NVM and then executes the actual command
_load_nvm() {
    unset -f nvm node npm npx _load_nvm
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Create stub functions that trigger NVM loading on first use
nvm() {
    _load_nvm
    nvm "$@"
}

node() {
    _load_nvm
    node "$@"
}

npm() {
    _load_nvm
    npm "$@"
}

npx() {
    _load_nvm
    npx "$@"
}


# ============================================================================
# ADDITIONAL PATH CONFIGURATIONS
# ============================================================================
# Add local bin directory to PATH
. "$HOME/.local/bin/env"

# Ruby binaries from Homebrew
export PATH="/usr/local/opt/ruby/bin:$PATH"

# SDL 1.2 library paths
export PATH="/opt/homebrew/opt/sdl@1.2/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sdl@1.2/lib/pkgconfig:$PKG_CONFIG_PATH"
