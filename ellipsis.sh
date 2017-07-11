#!/usr/bin/env bash
#
# shinzui/work ellipsis package

pkg.link() {
  keybase decrypt -i microtan.toml.encrypted -o microtan.toml
  keybase decrypt -i tanwww.toml.encrypted -o tanwww.toml
  fs.link_file microtan.toml ~/.config/mina/microtan.toml
  fs.link_file tanwww.toml ~/.config/mina/tanwww.toml
  fs.link_file dnsmasq.conf /usr/local/etc/dnsmasq.conf
}

pkg.install() {
  mkdir -p ~/Gyehoeg/work
  mkdir -p ~/.config/mina

  brew install terraform dnsmasq awscli
  install_app docker
  install_app postico
  yarn global add @topagentnetwork/tf-output @topagentnetwork/cloudwatch-logs-souji
  yarn global add pino pino-colada plop
  sudo easy_install pip
  pip install --user tmuxp
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
