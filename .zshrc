export ZSH=$HOME/.oh-my-zsh

export TERM='xterm-256color'

ZSH_THEME="myagnoster"

plugins=(git)

# export PATH="/home/bhjkkk/anaconda2/bin:$PATH"
source $ZSH/oh-my-zsh.sh

export CATKIN_WORKSPACE=$HOME/catkin_ws

source /opt/ros/indigo/setup.zsh
source $HOME/catkin_ws/devel/setup.zsh

export EDITOR=vim

#export PYTHONPATH=~/caffe/python/:$PYTHONPATH

setopt correct
SPROMPT="%r is correct ->"

source $HOME/.alias

export ROS_WORKSPACE=$HOME/catkin_ws

export TURTLEBOT_3D_SENSOR=kinect
