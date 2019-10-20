export PATH="$PATH:$HOME/.akarsh/bin"

# GO PATHS
export GOPATH=$HOME/digiWorld/playground/
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# AWS Paths
export PATH="/Users/akarsh/Library/Python/3.6/bin:$PATH"

# android Development version compatibility issue fix:
export ANDROID_SDK_ROOT=~/Library/Android/sdk/
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$PATH

export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

# Autojump | j
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
