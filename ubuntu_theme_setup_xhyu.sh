#/bin/bash
sudo apt-get updata
sudo apt-get install terminator -y

mkdir ~/Tools
cd ~/Tools
# install terminator-solarized
git clone https://github.com/ghuntley/terminator-solarized.git
cd terminator-solarized
mkdir -p ~/.config/terminator/
touch ~/.config/terminator/config
# if you want to replace current config:
cp config ~/.config/terminator
# if you want to append current config:
# cat config >> ~/.config/terminator/config

cd ~/Tools
git clone https://github.com/ghuntley/terminator-solarized.git
cd dircolors-solarized
cp dircolors.256dark ~/.dircolors
echo "eval `dircolors ~/terminator-solarized/dircolors-solarized/dircolors.256dark`" >> ~/.profile

# vim solarized
cd ~/Tools
git clone git://github.com/altercation/vim-colors-solarized.git 
cd vim-colors-solarized/colors
mkdir -p ~/.vim/colors
mv solarized.vim ~/.vim/colors/
# modify vimrc
sudo echo "syntax enable" >> /etc/vim/vimrc
sudo echo "set background=dark" >> /etc/vim/vimrc
sudo echo "colorscheme solarized" >> /etc/vim/vimrc

# install ubuntu theme
cd ~/Tools
wget https://github.com/anmoljagetia/Flatabulous/archive/master.zip
unzip master.zip
sudo cp -r Flatabulous-master/ /usr/share/themes/

sudo add-apt-repository ppa:noobslab/icons -y
sudo apt-get update
sudo apt-get install ultra-flat-icons

sudo apt-get install unity-tweak-tool
sudo unity-tweak-tool

# move ubuntu start bar to Bottom
gsettings set com.canonical.Unity.Launcher launcher-position Bottom
