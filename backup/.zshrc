#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export CATKIN_WORKSPACE=$HOME/catkin_ws

source /opt/ros/indigo/setup.zsh
source $HOME/catkin_ws/devel/setup.zsh
# source $CATKIN_WORKSPACE/devel/setup.zsh

export EDITOR=vim

setopt correct
SPROMPT="%r is correct ->"

source $HOME/.alias

export TURTLEBOT_BASE=kobuki
export TURTLEBOT_STACKS=hexagons
export TURTLEBOT_3D_SENSOR=kinect
export TURTLEBOT_BATTERY=/sys/class/power_supply/BAT0
export TURTLEBOT_SIMULATION=false

export ROS_WORKSPACE=$HOME/catkin_ws

export ICE_HOME=/opt/Ice-3.5.1

source ~/gibo/gibo-completion.zsh
