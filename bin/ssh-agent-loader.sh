#!/usr/bin/env bash
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
SSH_SETTINGS='/tmp/agent_settings'

# load the settings if they exist
if [ -f $SSH_SETTINGS ]; then
  . $SSH_SETTINGS
fi

if [ ! -x "$SSHAGENT" ]; then
  echo "$SSHAGENT is not executable"
fi

# kill agents if there are more than one running
if [ `pidof $SSHAGENT | wc -w` -gt 1 ]; then
  echo "INFO: we have more than one ssh-agent so I gotta kill 'em all."
  kill `pidof $SSHAGENT`
fi

# kill agents if the authsock file doesn't exist.
if [ ! -e $SSH_AUTH_SOCK ]; then
  echo "INFO: the authsock file at $SSH_AUTH_SOCK doesn't exist."
  if [ `pidof $SSHAGENT | wc -w` -ne 0 ]; then
    kill `pidof $SSHAGENT`
  fi
fi

# unset ssh variables if there are no agents running
if [ -z `pidof $SSHAGENT` ]; then
  echo "INFO: there are no ssh agents runing now so i'm going to unset the ssh variables"
  unset SSH_AGENT_PID
  unset SSH_AUTH_SOCK
fi

# start if no agents are running
if [ -z $SSH_AUTH_SOCK ]; then
  echo "INFO: starting ssh agent"
  eval `$SSHAGENT $SSHAGENTARGS`
  echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > $SSH_SETTINGS
  echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >> $SSH_SETTINGS
  /usr/bin/ssh-add $HOME/.ssh/id_dsa
fi
