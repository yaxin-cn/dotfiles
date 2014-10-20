# # add this to /etc/profile
# HISTORY
# HISTORY ENv
USER_IP=`who -u am i 2>/dev/null | awk '{print $NF}' | sed -e 's/[()]//g'`
LOGNAME=`who -u am i | awk '{print $1}'`
HISTDIR=/var/log/.history
if [ -z $USER_IP ];then
    USER_IP=`hostname`
fi
if [ ! -d $HISTDIR ];then
    mkdir -p $HISTDIR
    chmod 777 $HISTDIR
fi
if [ ! -d $HISTDIR/${LOGNAME} ];then
    mkdir -p $HISTDIR/${LOGNAME}
    chmod 300 $HISTDIR/${LOGNAME}
fi
DT=`date +"%Y%m%d_%H%M%S"`
HISTFILE="$HISTDIR/${LOGNAME}/${USER_IP}.history.$DT"
HISTFILESIZE=400000000
HISTSIZE=10000
HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
chmod 600 $HISTDIR/${LOGNAME}/*.history* 2>/dev/null
readonly PROMPT_COMMAND="${PROMPT_COMMAND:-:} ; history -a"
export HISTFILE HISTSIZE PROMPT_COMMAND HISTTIMEFORMAT 
shopt -s histappend
