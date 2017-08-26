#!/bin/bash

# remote-gpg   
# original author: Dustin J. Mitchell <dustin@cs.uchicago.edu>

set -e

host=$1
if [ -z "$host" ]; then
  echo "Supply a hostname"
  exit 1
fi

# our local and remote homedirs might be different
# TODO remote homedirs can vary in paths, too
REMOTE_HOME=/home/jglasbr2
#LOCAL_HOME=/home/james

# remove any existing agent socket (in theory `StreamLocalBindUnlink yes`
# does this, but in practice, not so much)
ssh $host rm -f $REMOTE_HOME/.gnupg/S.gpg-agent
ssh \
  -t -R $REMOTE_HOME/.gnupg/S.gpg-agent:$HOME/.gnupg/S.gpg-agent.extra \
  $host \
  sh -c "echo; echo \"Perform remote GPG operations and hit enter\"; \
    read; \
    sleep 2; \
    rm -f $REMOTE_HOME/.gnupg/S.gpg-agent";
