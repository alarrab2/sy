#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR


  cd libs
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
  sudo apt-get install g++-4.7 -y c++-4.7 -y
  sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
  sudo apt-get install screen -y
  sudo apt-get install software-properties-common -y
  sudo apt-get install tmux -y
  sudo apt-get install libstdc++6 -y
  sudo apt-get install lua-lgi -y
  sudo apt-get install libnotify-dev -y
  sudo apt-get update -y
  sudo apt-get upgrade -y
  wget https://valtman.name/files/telegram-cli-1222
  mv telegram-cli-1222 tg
  chmod +x tg
  cd ..
  chmod +x libs
  lua ./bot/bot.lua
  chmod +x sy.sh
  screen -X -S boss quit
  screen -S boss ./sy.sh