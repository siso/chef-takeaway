alias TS="date '+%Y%m%d-%H%M%S'"
alias l='ls'
alias ll='ls -laF'
alias lh='ls -laFh'

# GIT
gitdiff() {
        git diff $@ | colordiff
}
alias gitloggraph='git log --pretty=format:"%h %s" --graph'

function mkdirtmp {
        BASETMP=~/tmp
        if [ ! -d $BASETMP ]; then
                mkdir -p $BASETMP
                if [ $?=0 ]; then
                        echo $BASETMP" created"
                else
                        echo $BASETMP" cannot be created. Exiting..."
                        return 1
                fi
        fi

        NEWTMPDIR=${BASETMP}"/"$(date +%Y%m%d-%H%M%S)
        if [ ! -d $NEWTMPDIR ]; then
                mkdir -p $NEWTMPDIR
                if [ $?=0 ]; then
                        echo $NEWTMPDIR" created"
                else
                        echo $NEWTMPDIR" cannot be created. Exiting..."
                        return 1
                fi
        fi
        cd $NEWTMPDIR
}
