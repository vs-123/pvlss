#!/bin/sh
# PVLSS -- VS-123 @ https://github.com/vs-123

PACKAGES="
   xorg \
   mesa \
   mesa-demos \
   glxinfo \
   feh \
   rofi \
   neovim \
   git \
   openbox \
   firefox \
   zsh \
   kitty \
   btop
"

echo "#######################"
echo "##  PVLSS -- VS-123  ##"
echo "#######################"
echo ""
echo "PVLSS ==> PERSONAL VOID LINUX SETUP SCRIPT"
echo ""
echo "* CONVENIENCE SCRIPT"
echo "* SETS UP VOID LINUX ENV"
echo "* AUTHOR -- VS-123 @ https://github.com/vs-123"
echo ""

user_input=nil

read -p "START SETUP? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "LET'S BEGIN"
      ;;
   *)
      echo "OK. EXITING..."
      exit
      ;;
esac
echo ""

read -p "INSTALL PACKAGES? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "INSTALLING..." &&\
         sudo xbps-install -Su $PACKAGES
      ;;
   *)
      echo "NOT INSTALLING"
      ;;
esac
echo ""

read -p "SET SHELL TO ZSH? (y/N) " user_input
case "$user_input" in
   [yY]) 
      echo "SETTING SHELL..." && \
      chsh -s /bin/zsh
      ;;
   *)
      echo "NOT SETTING SHELL TO ZSH"
      ;;
esac
echo ""

read -p "SETUP ~/.ZSHRC? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "SETTING UP ~/.ZSHRC..." && \
cat <<EOF > ~/.zshrc
alias ls='ls -Fa --color=auto'
alias l='ls'
alias ll='ls -l'
alias sx='startx'
alias c='cd'
alias ..='cd ..'

alias cl='clear'
alias mkd='mkdir -p'

EDITOR='nvim'
alias em='nvim'
alias nvi='nvim'
alias vim='nvim'

alias ez='em ~/.zshrc'
alias ex='em ~/.xinitrc'
alias ee='em ~/.config/nvim/init.lua'
alias eo='em ~/.config/openbox/'
alias ek='em ~/.config/kitty/kitty.conf'
alias ff='fastfetch'
alias rl='source ~/.zshrc'

alias xi='sudo xbps-install -S'
alias xu='sudo xbps-install -Su'
alias xiy='sudo xbps-install -Sy'
alias xq='sudo xbps-query -Rs'

PROMPT=$'%n %m %~\n%% '
EOF
      ;;
   *)
      echo "NOT CONFIGING ~/.ZSHRC"
      ;;
esac
echo ""

read -p "SETUP NEOVIM CFG? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "SETTING UP NEOVIM..." && \
      mkdir -p ~/.config/nvim && \
      cd ~/.config/nvim && \
      git clone https://github.com/vs-123/nvim-cfg . && \
      cd -
      ;;
   *)
      echo "NOT SETTING UP NEOVIM"
      ;;
esac
echo ""

read -p "SETUP OPENBOX CFG? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "SETTING UP OPENBOX..." && \
      mkdir -p ~/.config/openbox && \
      cp -r /etc/xdg/openbox/* ~/.config/openbox
      ;;

   *)
      echo "NOT CONFIGING OPENBOX"
      ;;
esac
echo ""

read -p "SETUP KITTY CFG? (y/N) " user_input
case "$user_input" in
   [yY])
      echo  "SETTING UP KITTY..." && \
      cat <<EOF > ~/.config/kitty/kitty.conf
background_opacity 0.75
font_size 18
cursor_trail 3
cursor_trail_decay 0.1 0.25
EOF
      ;;
*)
   echo "NOT CONFIGING KITTY"
   ;;
esac
echo ""

echo "DONE! PVLSS ENDS HERE."

