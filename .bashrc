#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cdir='cd $(find . -type d | fzf)'
alias restartaudio='systemctl --user restart wireplumber pipewire pipewire-pulse'
function valid_git {
  git rev-parse --is-inside-work-tree &> /dev/null
}
function curbranch {
  echo -en "($(git status -sb | sed '1q' | cut -c4-))"
}
function git_info {
  if valid_git
  then
    echo -en "$(curbranch) $(changes)"
  fi
}
function changes {
  echo -en "$(git diff --shortstat | cut -d ' ' -f '2,5,7')"
}
HALFCHAR="$(echo -e "\ue0bc")"
TXTBG_BLUE="\e[104m\]"
TXTFG_BLACK=""
TXTFG_RED=""
TXTBOLD="\e[1m\]"
TXTINIT="\e[1;104;30m\]"
TXTRESET="\e[0m\]"
SELECT="if [ \$? = 0 ]; then echo \":)\"; else echo \":(\"; fi"
function tellcode {
  echo $?
  if [ $? = 0 ]
  then
    echo -en "\e[42m${?}"
  else
    echo -en "\e[41m${?}"
  fi
}
# get branch command $ git status -sb | sed '1q' | cut -c4-
# get stat git diff --shortstat | cut -d ' ' -f '2,5,7'
# \e[94;100m\$(git_info)${TXTRESET}\]
PS1="\t \w $ "
# PS1='[\u@\h \W]\$ '
alias srcbash='source ~/.bashrc'
alias r="reset"
export EDITOR=nvim
export VISUAL=nvim
discordinfo_path='/opt/discord/resources/build_info.json'
function updatediscord {
  if [ ! -w $discordinfo_path ]; then
    echo "User permissions not sufficient. Enter password to make $discordinfo_path writable" 
    sudo chmod a+w $discordinfo_path
    if [ ! -w $discordinfo_path ]; then
      echo "User permissions still not sufficient. Exiting"
      exit 1
    fi
  fi
  python ./.rc_resources/updatediscord.py $discordinfo_path $(curl -sIk 'https://discord.com/api/download?platform=linux&format=tar.gz' | grep 'location:' | grep -oPe '(?<=\/linux\/)\w*\.\w*\.\w*(?=\/)')
}
function vencord {
  sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
}
# tried to compile bin fo Bixie
export PATH="/home/tl1248/gits/fromsrc/Ndless/ndless-sdk/toolchain/install/bin:/home/tl1248/gits/fromsrc/Ndless/ndless-sdk/bin:$PATH"
export QT_QPA_PLATFORM=xcb
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
export IWD_RTNL_DEBUG=1
export IWD_GENL_DEBUG=1
export IWD_DHCP_DEBUG=1
export IWD_WSC_DEBUG_KEYS=1
