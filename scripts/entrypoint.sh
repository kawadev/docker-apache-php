#!/bin/bash

## Git cloneのディレクトリ・パス設定
declare -A GIT_SETTINGS_PHP71;
declare -A GIT_SETTINGS_PHP73;

GIT_SETTINGS_PHP71=(
  # ["src/以下のディレクトリ名"]='Gitのパス。
  ["xxxxxxxx"]='xxxxxxxx/xxxxxxxx.git'
)

GIT_SETTINGS_PHP73=(
)

echo "Run entrypoint.sh. PHP_VER=${PHP_VER}"

## copy ssh private key
echo "Copy ssh keys."
mkdir ~/.ssh && chmod 755 ~/.ssh
cp -rp /ssh/* ~/.ssh/
chmod -R 600 ~/.ssh/

# Git clone 実行
# PHP7.1
if [ ${PHP_VER} = '7.1' ]; then
  for KEY in ${!GIT_SETTINGS_PHP71[@]};
  do
      export GIT_CLONE_DIR=${KEY}
      export GIT_CLONE_PATH=${GIT_SETTINGS_PHP71[$KEY]}
      bash /scripts/git/clone.sh
      echo "/scripts/git/clone.sh result $?."
  done
fi

# Git clone 実行
# PHP7.3
if [ "${PHP_VER}" = "7.3" ]; then
  for KEY in ${!GIT_SETTINGS_PHP73[@]};
  do
      export GIT_CLONE_DIR=${KEY}
      export GIT_CLONE_PATH=${GIT_SETTINGS_PHP73[$KEY]}
      bash /scripts/git/clone.sh
      echo "/scripts/git/clone.sh result $?."
  done
fi

# execute apache
# exec "apache2-foreground"
# exec "tail -f /dev/null"
# execute php-fpm
exec "php-fpm"
exec "tail -f /dev/null"
