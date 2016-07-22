#!/bin/bash - 
#===============================================================================
#
#          FILE: pkg_install.sh
# 
#         USAGE: ./pkg_install.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 22/07/2016 16:01
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DEPENDENCIES="exuberant-ctags"

UTILITIES="tree curl"

echo "Install dependencies: Begin"
apt-get -y install $DEPENDENCIES
echo "Install dependencies: End"
 
echo "Install utilities: Begin"
apt-get -y install $UTILITIES
echo "Install utilities: End"

echo "Install bash prompt"
curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > $HOME/.bash-powerline.sh
echo "source ~/.bash-powerline.sh" >> $HOME/.bashrc

echo "Install vim"
cp .vimrc $HOME
cp -r .vim $HOME

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
