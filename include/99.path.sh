# GO PATHS
export GOPATH=/Volumes/data/
export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# AWS Paths
export PATH="/Users/akarsh/Library/Python/3.6/bin:$PATH"

# Autojump | j
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"


export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# # gitcl - git clone alternative
# export PATH="$HOME/.akarsh:$PATH"

