# KUBE Prompt
if [[ $KUBE_PROMPT == true ]] ; then
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    PROMPT='$(kube_ps1)'$PROMPT
fi