#!/bin/bash
nick="blb$$"
channel=testchannel
server=irc.freenode.net
config=/tmp/irclog
[ -n "$1" ] && channel=$1
[ -n "$2" ] && server=$2
config="${config}_${channel}"
echo "NICK $nick" > $config
echo "USER $nick +i * :$0" >> $config
echo "JOIN #$channel" >> $config
trap "rm -f $config;exit 0" INT TERM EXIT
tail -f $config | nc $server 6667 | while read MESSAGE
do
    case "$MESSAGE" in
        PING*) echo "PONG${MESSAGE#PING}" >> $config;;
        *QUIT*) ;;
        *PART*) ;;
        *JOIN*) ;;
        *NICK*) ;;
        *PRIVMSG*) echo "${MESSAGE}" | sed -nr "s/^:([^!]+).*PRIVMSG[^:]+:(.*)/[$(date '+%R')] \1> \2/p";;
        *) echo "${MESSAGE}";;
    esac
done
