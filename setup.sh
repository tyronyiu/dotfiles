#!/bin/bash
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo -e "\nTy's Command Line Setup\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo ""
if [[ "$SHELL" != *"zsh"* ]];then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo -e "ZSH is already your shell\n"
fi
for i in $(awk '{ print $1 }' commands.txt); do
if ! [ -x "$(command -v $i)" ];then
    echo "command $i not installed"
    if "$i" == "brew";then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install $i
else
    echo "command $i already installed"
fi
done
echo "Installing vim-plug plug-in manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && echo "vim-plug has been installed"
echo "Installing Pathogen plug-in manager"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && echo "Pathogen has been installed"
if [ ! -d ~/dotfiles ]; then
    echo "Dotfiles not installed, installing now..."
    git clone https://github.com/tyronyiu/dotfiles.git ~/dotfiles 
else
    echo "Dotfiles already installed, updating..."
    cd ~/dotfiles && git pull origin master && cd ..
fi
cp -r ~/dotfiles/ ~/ && echo "dotfiles have been placed where they need to be"
vim -S ~/dotfiles/VimSetup.key ~/test.md
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo -e "\nSETUP COMPLETED\n"

