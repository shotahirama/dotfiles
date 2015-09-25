export ZSH=$HOME/.oh-my-zsh

export TERM='xterm-256color'

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $HOME/catkin_ws/devel/setup.zsh
export ROS_WORKSPACE=$HOME/catkin_ws

export EDITOR=vim

export PYTHONPATH=~/caffe/python/:$PYTHONPATH

setopt correct
SPROMPT="%r is correct ->"

source $HOME/.alias
