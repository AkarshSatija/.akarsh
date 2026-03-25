alias -g GrepNot='| grep -v' # now you can do: ls foo G something
alias reload='clear; source ~/.zshrc'
# alias -g bs='brew services'

alias k=kubectl
alias kx=kubectx
alias t=terraform
alias t-cache="mv ${PWD}/.terraform/plugins/darwin_amd64/terraform-provider-* ~/.terraform.d/plugins/"

alias v="lazy-connect"
alias vpnfix="osascript $HOME/.akarsh/lib/fix_catalina_vpn.applescript"

alias totp='oathtool --totp --base32 "$(security find-generic-password -a lazy-connect -w 2>/dev/null | tr -d '\n')"'

##### Override zsh alias
alias gst='echo \"********************************************************************* Dude!!! Stop Using gst ***************************************************************\"'
alias gt='echo \"********************************************************************* Dude!!! Stop Using gt ***************************************************************\"'
