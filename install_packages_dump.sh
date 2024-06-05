#!/usr/bin/env bash

clear
echo "INSTALLING PACKAGES FOR EPITECH'S DUMP"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt update
apt upgrade -y

packages_list=(build-essential
               libboost-dev
               libboost-all-dev
               ca-certificates
               clang
               cmake
               libcunit1-dev
               curl
               libflac-dev
               libfreetype6-dev
               gcc
               g++
               gdb
               git
               libc6
               libc6-dev
               libgmp-dev
               ksh
               libelf-dev
	       libjpeg62
               libjpeg62-dev
               libvorbis-dev
               libsdl2-dev
               libx11-dev
               libxext-dev
               ltrace
               make
               nasm
               ncurses-base
	       ncurses-bin
	       ncurses-doc
	       ncurses-examples
	       ncurses-hexedit
	       ncurses-term 
	       libncurses5-dev
               net-tools
               libopenal-dev
               python3-numpy
               python3
               rlwrap
               ruby
               strace
               tar
               tcsh
               tmux
               sudo
               tree
               unzip
               valgrind
               vim
               emacs-nox
               procps
               libxcb-util1
               libxcb-util-dev
               zip
               zsh
               gcc-avr
               qtbase5-dev
               docker.io
               docker-compose
               openjdk-17-jdk
               libboost-program-options-dev
               libboost-math-dev
               libboost-graph-dev
               autoconf
               automake
               tcpdump
               wireshark
               nodejs
               tuareg-mode
               libvirt-clients
               libvirt-daemon-system
               virtinst
               haskell-platform
               golang
               libsystemd-dev
               libgudev-1.0-dev
               libsfml-dev
               libcsfml-dev
               libirrlicht-dev
               rustc
               cargo
               mariadb-server
               libx264-dev
)

apt install -y ${packages_list[@]}

# Gradle
wget https://services.gradle.org/distributions/gradle-8.5-bin.zip
mkdir /opt/gradle && unzip -d /opt/gradle/gradle-8.5-bin.zip && rm -f gradle-8.5-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-8.5/bin' >> /etc/profile

# Stack
curl -sSL https://get.haskellstack.org/ | sh

# Criterion
./install_criterion.sh

# CONFIG EMACS
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 278bb6a630e6474f99028a8ee1a5c763e943d9a3
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

# CONFIG VIM
git clone https://github.com/Epitech/vim-epitech.git
cd vim-epitech
git checkout ec936f2a49ca673901d56598e141932fd309ddac
./install.sh
cd .. && rm -rf vim-epitech
