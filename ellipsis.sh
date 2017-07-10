#!/usr/bin/env bash
#
# shinzui/work ellipsis package

# The following hooks can be defined to customize behavior of your package:
pkg.install() {
  mkdir -p ~/Gyehoeg/work

  brew install terraform
  install_app docker
  install_app postico
  yarn global add @topagentnetwork/tf-output @topagentnetwork/cloudwatch-logs-souji
  yarn global add pino pino-colada plop
}

install_app() {
  if test ! $(brew cask list |grep "$app"); then
    echo "installing $app"
    brew cask install --appdir="/Applications" $app
  else
    echo "$app is already installed. Skipping..."
  fi
}


# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
