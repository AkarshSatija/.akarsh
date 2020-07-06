alias -g GrepNot='| grep -v' # now you can do: ls foo G something
alias -g reload='clear; source ~/.zshrc'
alias -g bs='brew services'

alias i='idea .'
alias c='code'

alias k=kubectl
alias kx=kubectx
alias t=terraform
alias t-cache="mv ${PWD}/.terraform/plugins/darwin_amd64/terraform-provider-* ~/.terraform.d/plugins/"

alias vpnfix="osascript $HOME/.akarsh/lib/fix_catalina_vpn.applescript"

##### Override zsh alias
alias gst='echo \"********************************************************************* Dude!!! Stop Using gst ***************************************************************\"'
