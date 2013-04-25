export PATH="$HOME/bin:/usr/local/share/npm/bin:/usr/local/bin:$HOME/.rvm/bin:$HOME/node_modules/.bin:/usr/local/oracle:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v '1.7*'`
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"
export LANG=hu_HU.UTF-8
export LC_CTYPE=hu_HU.UTF-8
export LC_ALL=hu_HU.UTF-8
export GROOVY_HOME=/usr/local/Cellar/groovy/2.1.3/libexec
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/oracle
export TNS_ADMIN=/usr/local/oracle/network/admin

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim"

#include custom completions
fpath=(~/.zsh-completions $fpath)

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git brew bundler gem knife rvm osx vagrant heroku svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#Rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export EDITOR=vim
export NODE_PATH=/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
