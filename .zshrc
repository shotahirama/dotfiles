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

compinit -C

export CATKIN_WORKSPACE=$HOME/catkin_ws

source $HOME/catkin_ws/devel/setup.zsh

export EDITOR=vim

setopt correct
SPROMPT="%r is correct ->"

source $HOME/.alias

export TURTLEBOT_BASE=kobuki
export TURTLEBOT_STACKS=hexagons
export TURTLEBOT_3D_SENSOR=kinect
export TURTLEBOT_BATTERY=/sys/class/power_supply/BAT0

export ROS_WORKSPACE=$HOME/catkin_ws

export ICE_HOME=/opt/Ice-3.5.1

source ~/gibo/gibo-completion.zsh

export MY_WLAN0IP=`ifconfig wlan0 | grep -o -e "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" | head -n 1`

setopt nonomatch

export MY_ETH0IP=`ifconfig eth0 | grep -o -e "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" | head -n 1`

if [ -n "$MY_ETH0IP" ]; then
  hoge=`echo $MY_ETH0IP | cut -d '.' -f 3`
else
  hoge=`echo $MY_WLAN0IP | cut -d '.' -f 3`
fi

if [ $hoge -eq '22' ]; then
  export ROS_MASTER_URI=http://192.168.22.200:11311
else
  export ROS_MASTER_URI=http://localhost:11311
fi

# export ROS_MASTER_URI=http://192.168.22.200:11311

if [ -n "$MY_ETH0IP" ]; then
  export ROS_IP=$MY_ETH0IP
else
  export ROS_IP=$MY_WLAN0IP
fi


export GCC4MBED_DIR=$HOME/Documents/git/gcc4mbed
export ROS_LIB_DIR=$HOME/Documents/mbed
