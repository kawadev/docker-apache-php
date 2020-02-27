#!/bin/bash

cd /workspace

echo "----- Git clone start: ${GIT_CLONE_DIR} -----"
pwd
if [ -e "${GIT_CLONE_DIR}" ]; then
  echo "${GIT_CLONE_DIR} is exists, Skip git clone."
else
  if ([ -z "$GIT_ID" ] || [ -z "$GIT_PWD" ]) && [ -z "$GIT_SSH_IDENTITY_FILE_NAME" ] ; then
    echo "GIT_ID or GIT_PWD or GIT_SSH_IDENTITY_FILE_NAME is Not Found. skip git clone..."
  else
    echo "Git clone a ${GIT_CLONE_DIR} repository."
    if [ -z "GIT_SSH_IDENTITY_FILE_NAME" ]; then
      echo "Use id/pwd for git clone."
      git clone -b release https://${GIT_ID}:${GIT_PWD}@{GITのURL}:${GIT_CLONE_PATH} ${GIT_CLONE_DIR}
    else
      echo "Use ssh for git clone."
      SSH_CMD="ssh -i ~/.ssh/${GIT_SSH_IDENTITY_FILE_NAME} -F /dev/null -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
      if [ -n "$GIT_SSH_PASSPHRASE" ]; then
        SSH_CMD="sshpass -p $GIT_SSH_PASSPHRASE -P \"Enter passphrase for key\" "$SSH_CMD
      fi

      # echo $SSH_CMD
      git -c core.sshCommand="${SSH_CMD}" clone -b release git@{GITのURL}:${GIT_CLONE_PATH} ${GIT_CLONE_DIR}
    fi
    #echo "Run Composer Install."
    #cd ${GIT_CLONE_DIR}/application && composer install
  fi
fi

echo "----- Git clone end: ${GIT_CLONE_DIR} -----"

exit 0
