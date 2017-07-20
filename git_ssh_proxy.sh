#!/bin/sh

# Use an intermediate ssh "proxy" if the git server is behind a firewall. 
#
# If the environment variable GIT_SSH_PROXY is set and
# the host matches one that should be proxied, do it...
# otherwise execute ssh as normal
#
# e.g. to use the DLR ssh server as proxy:
# export GIT_SSH_PROXY=user_name@ssh.robotic.dlr.de
#

host_patterns='*rmc-github.robotic.dlr.de'

# the requested user@host
host=$1

use_proxy=false

if [ -n "$GIT_SSH_PROXY" ]; then
        for pattern in $host_patterns
        do
                case "$host" in
                        $pattern) use_proxy=true ;;
                        *) ;;
                esac
        done
fi

if $use_proxy ; then
        shift
        exec ssh $GIT_SSH_PROXY "ssh -ao BatchMode=yes $host \"$@\""
else
        exec ssh "$@"
fi
