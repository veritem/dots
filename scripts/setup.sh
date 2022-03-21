# setup zsh

sudo apt-get install zsh


# install git

sudo apt-get install git

git config --global user.email "mugaboverite@gmail.com"

git config --global user.name "veritem"



# install oh-myzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install home-brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# setup ohm-zsh auto-complete

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "add plugins=(zsh-autosuggestions)" to ~/.zshrc


# setup volta node, npm, and yarn


curl https://get.volta.sh | bash


volta install node

volta install yarn


echo "download and configure firacode nerd font"

# setup startship

curl -fsSL https://starship.rs/install.sh | bash


echo "add your github ssh token here"
