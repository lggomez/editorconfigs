#>#####			BASE
export LANG=en_US.UTF-8
alias modbsh='sudo nano $HOME/.bash_profile'
alias rebsh='source $HOME/.bash_profile'
alias my="PATH=/usr/local/bin:$PATH"
alias killgps='sudo killall GlobalProtect && sudo killall PanGPS'
alias vskill='sudo killall -v -9 VShieldScanner'

alias ttyclock="tty-clock -s -f '%Y/%d/%m %Z' -d 0 -a 5000"

#>#####			JAVA
export JAVA_6_HOME=$(/usr/libexec/java_home -v 1.6)
export JAVA_7_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)
alias java6='export JAVA_HOME=$JAVA_6_HOME'
alias java7='export JAVA_HOME=$JAVA_7_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:/usr/local/sbin"
#default is Java 6
export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
#MAVEN
M2_HOME=/usr/local/apache-maven/apache-maven-3.5.0
export M2_HOME
export PATH=$PATH:$M2_HOME/bin
#shipping-jobs mem
export GRAILS_OPTS="-XX:MaxPermSize=6G -XX:PermSize=6G -Xmx6G -Xms6G -server -XX:+UseParallelGC -Djava.net.preferIPv4Stack=true -Dsun.reflect.inflationThreshold=100000"

#>#####			GO
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
alias gobu="(cd src/api; go build)"
alias gobu2="(cd src/api; GOCACHE=off go build)"
alias gote="(cd src/api; go test ./...)"
alias gote2="(cd src/api; GOCACHE=off go test ./...)"
alias cleanvendor="(find . -type d -name vendor -exec rm -rf {} \;)"

#>#####			GIT
eval "$(ssh-agent -s)"
alias resetorigin='git fetch origin && git reset --hard origin/master && git clean -f -d'
alias resetupstream='git fetch upstream && git reset --hard upstream/master && git clean -f -d'
alias resetdevelop='git fetch origin && git reset --hard origin/develop && git clean -f -d'


#>#####			DEV
ipaddr() { (awk '{print $2}' <(ifconfig eth0 | grep 'inet ')); }
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

#>#####                  RUST
export PATH=$PATH:$HOME/.cargo/bin

#>#####			MISC
alias sdkinit='source "$HOME/.sdkman/bin/sdkman-init.sh"'
export SDKMAN_DIR="/Users/lgomez/.sdkman"
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

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

# MacPorts Installer addition on 2018-10-28_at_22:25:01: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# GO version manager
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
