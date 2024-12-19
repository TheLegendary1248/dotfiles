#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias restartaudio='systemctl --user restart wireplumber pipewire pipewire-pulse'
PS1='[\u@\h \W]\$ '
export PATH="/home/tl1248/gits/fromsrc/Ndless/ndless-sdk/toolchain/install/bin:/home/tl1248/gits/fromsrc/Ndless/ndless-sdk/bin:$PATH"
export QT_QPA_PLATFORM=xcb
alias r="reset"
