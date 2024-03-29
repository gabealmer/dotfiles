# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=~/.dotfiles/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gabealmer"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Aliases
[[ -s ~/.dotfiles/aliases/.aliases ]] && source ~/.dotfiles/aliases/.aliases
[[ -s ~/.dotfiles/aliases/.private ]] && source ~/.dotfiles/aliases/.private

fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
bindkey \^U backward-kill-line

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler gem github rake postgres jsontools docker kubectl)

source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh/site-functions/_aws

# Customize to your needs...
PATH=$PATH:$HOME/bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin

export EDITOR=vim
export BUNDLER_EDITOR=vim

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. `brew --prefix`/etc/profile.d/z.sh

eval "$(rbenv init -)"

export GPGKEY=4FB8C14B

# export SSL_CERT_FILE=/usr/local/etc/openssl/WhitepagesCARoot.pem
# export CURL_CA_BUNDLE=~/.ssh/cacert.pem
# export CURL_CA_BUNDLE=/usr/local/etc/openssl/cert.pem

# export CC=gcc
# export CXX=g++
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(jira --completion-script-zsh)"

export N_PREFIX=~
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export LIBRARY_PATH=$LIBRARY_PATH:$(xcrun --show-sdk-path)/usr/include
# export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export CPPFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
