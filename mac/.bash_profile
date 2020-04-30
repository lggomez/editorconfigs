#>#####			BASE
export LANG=en_US.UTF-8
export PATH="$PATH:$HOME/apps"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Users/lgomez/Library/Python/3.7/bin:$PATH"

alias my="PATH=/usr/local/bin:$PATH"
alias modbsh='sudo nano $HOME/.bash_profile'
alias modbshc='sudo code $HOME/.bash_profile'
alias rebsh='source $HOME/.bash_profile'
alias vskill='sudo killall -v -9 VShieldScanner'
alias killgps='sudo killall GlobalProtect && sudo killall PanGPS'
alias ttyclock="tty-clock -s -f '%Y/%d/%m %Z' -d 0"

#>#####                PYTHON
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

#>#####			JAVA
# export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:/usr/local/sbin"

#>#####			GO
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export GOFLAGS=""
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
alias goplsupd='GO111MODULE=on go get golang.org/x/tools/gopls@latest'
alias goplsupdm='GO111MODULE=on go get golang.org/x/tools/gopls@master golang.org/x/tools@master'
alias cleanvendor="(find . -type d -name vendor -exec rm -rf {} \;)"

#>#####			GIT
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1
alias resetorigin='git fetch origin && git reset --hard origin/master && git clean -f -d'
alias resetupstream='git fetch upstream && git reset --hard upstream/master && git clean -f -d'
alias resetdevelop='git fetch origin && git reset --hard origin/develop && git clean -f -d'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gitaca='git add . && git commit --amend --no-edit'

# DEV
alias ls="ls -CF"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias topml='top -f -e -a -stats pid,command,cpu,mem,vsize,th,pstate,time,user -o -mem'
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# ls
alias ls='ls -GFh'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

function retval() {
    if [[ -z $1 ]];then
        echo '.'
    else
        echo $1
    fi
}

alias ping='ping -c 5'
alias clr='clear;echo "Currently logged in on $(tty), as $USER in directory $PWD."'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -pv'

# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1,1n'
alias psmem10='ps -e -orss=,args= | sort -b -k1,1n| head -10'
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# Sort connection state
sortcons() {
    netstat -nat |awk '{print $6}'|sort|uniq -c|sort -rn
}

# View all 80 Port Connections
con80() {
    netstat -nat|grep -i ":80"|wc -l
}

# On the connected IP sorted by the number of connections
sortconip() {
    netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
}

# gather external ip address
geteip() {
    curl -s -S https://icanhazip.com
}

# GO version manager
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
gvm use go1.13.8 --default
