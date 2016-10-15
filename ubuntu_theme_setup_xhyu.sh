#/bin/bash

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # get the path of MiracleLinuxScript
DIR=$MYDIR/Tools 
PICDIR=~/Pictures
BACKGROUNDPIC=cbg.jpg
WALLPAPER=Night_lights_by_Alberto_Salvia_Novella.jpg

# install terminator
terminator(){
  sudo apt-get update
  sudo apt-get install terminator -y

  mkdir -p $DIR
  cd $DIR
  # install terminator-solarized
  git clone https://github.com/ghuntley/terminator-solarized.git
  cd terminator-solarized
  mkdir -p ~/.config/terminator/
  touch ~/.config/terminator/config
  

  # if you want to replace current config:
  cp config ~/.config/terminator
  ## if you want to append current config:
  # cat config >> ~/.config/terminator/config
  # set terminator background picture and copy the config file into the right place

  cd $DIR
  git clone https://github.com/seebi/dircolors-solarized.git
  cd dircolors-solarized
  cp dircolors.256dark ~/.dircolors
  echo "eval \`dircolors $DIR/dircolors-solarized/dircolors.256dark\`" >> ~/.profile
}

# called only after terminator
terminator_picture(){
  # terminator background picture
  cp $MYDIR/$BACKGROUNDPIC $PICDIR/

  rm -f ~/.config/terminator/config
  cd $MYDIR
  sed "24c\    background_image = $PICDIR/$BACKGROUNDPIC" terminator_config >> ~/.config/terminator/config
}

vim_solarized(){
  # vim solarized
  cd $DIR
  git clone git://github.com/altercation/vim-colors-solarized.git 
  cd vim-colors-solarized/colors
  mkdir -p ~/.vim/colors
  mv solarized.vim ~/.vim/colors/
  # modify vimrc
  sudo echo "syntax enable" >> /etc/vim/vimrc
  sudo echo "set background=dark" >> /etc/vim/vimrc
  sudo echo "colorscheme solarized" >> /etc/vim/vimrc
}

# install ubuntu theme
ubuntu_theme(){
  cd $DIR
  wget https://github.com/anmoljagetia/Flatabulous/archive/master.zip
  unzip master.zip
  sudo cp -r Flatabulous-master/ /usr/share/themes/

  sudo add-apt-repository ppa:noobslab/icons -y
  sudo apt-get update
  sudo apt-get install ultra-flat-icons

  sudo apt-get install unity-tweak-tool
  sudo unity-tweak-tool
}

change_wallpaper(){
  if ! [ -f /usr/share/backgrounds/$WALLPAPER ]
  then
    cp $MYDIR/$WALLPAPER /usr/share/backgrounds/
  fi
  gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/$WALLPAPER
}

# need 1 arg
launcher(){
  if [ $1 == "bottom" ]
  then
    ## move ubuntu start bar to Bottom
    gsettings set com.canonical.Unity.Launcher launcher-position Bottom
  elif [ $1 == "left" ]
  then
    ## move ubuntu start bar to Left
    gsettings set com.canonical.Unity.Launcher launcher-position Left
  fi
}

main()
{
  if [ $# == 0 ] # default
  then
    terminator
    terminator_picture
    ubuntu_theme
    change_wallpaper
  else
    for arg in $@
    do
      if [ $arg == "terminator" ]
      then
        terminator
      elif [ $arg == "picture" ]
      then
        terminator_picture
      elif [ $arg == "vim" ]
      then
        vim_solarized
      elif [ $arg == "ubuntu" ]
      then
        ubuntu_theme
      elif [ $arg == "bottom" ]
      then
        launcher $arg
      elif [ $arg == "left" ]
      then
        launcher $arg
      elif [ $arg == "wallpaper" ]
      then
        change_wallpaper
      fi
    done
  fi
}
main $@
