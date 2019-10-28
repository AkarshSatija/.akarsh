#### ssh alias
alias sshme="ssh -i ~/.ssh/id_rsa -l akarsh.s "

getIP(){
    CACHE_FILE=~/.akarsh/.host-cache
    
    
    IP=`cat $CACHE_FILE | grep $1 | head -1 | awk '{print $2}'`
    if [ -z "$IP" ]
    then
        IP=`/usr/local/bin/knife node show $1 | grep "IP:" | awk '{print $2}'`
        
        if [ -z "$IP" ]
        then
            echo "$1 not found in chef"
            return
        else
            echo "$1 $IP" >> $CACHE_FILE
        fi
    fi
    echo $IP
}

s3h() {
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        IP=$1
    else
        echo "Trying to resolve dns: $1"
        IP=`getIP $1`
    fi
    echo "sshme $IP"
    sshme $IP
}
