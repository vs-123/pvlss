#!/bin/sh
# PVLSS -- VS-123 @ https://github.com/vs-123

PACKAGES="
   bc \
   btop \
   chezmoi \
   feh \
   firefox \
   flameshot \
   git \
   glxinfo \
   kitty \
   mesa \
   mesa-demos \
   neovim \
   openbox \
   rofi \
   xclip \
   xorg \
   zsh 
"
WANTED_SHELL="/bin/zsh"

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
      echo "OK. I EXIT."
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

USER_SHELL = $(grep "^$USER" /etc/passwd | cut -d: -f7)
if [[ $user_shell != $WANTED_SHELL ]]; then
   echo "YOUR DEFAULT SHELL IS $USER_SHELL."
   read -p "SET SHELL TO '$WANTED_SHELL'? (y/N) " user_input
   case "$user_input" in
      [yY]) 
         echo "SETTING SHELL..." && \
         chsh -s /bin/zsh
         ;;
      *)
         echo "NOT SETTING SHELL TO '$WANTED_SHELL'"
         ;;
   esac
fi
echo ""

read -p "SETUP CHEZMOI? (y/N) " user_input
case "$user_input" in
   [yY])
      echo  "SETTING UP CHEZMOI..." && \
      cd ~ &&\
      chezmoi init --apply git@github.com:vs-123/dotfiles
      ;;
*)
   echo "NOT SETTING UP CHEZMOI"
   ;;
esac
echo ""

echo "DONE! PVLSS ENDS HERE."

