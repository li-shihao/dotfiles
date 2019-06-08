#! /bin/bash

# install programs
brew install git
brew install --HEAD neovim 
brew install bat
brew install fzf
brew install wget
brew install rg
brew install aria2
brew install alder
brew install --HEAD ccls
brew install dasht
brew install z
brew install yank
brew install tmux
brew install peco
brew install rebound

# linuxify
git clone https://github.com/fabiomaia/linuxify.git
cd linuxify/
./linuxify install
cd ~ && rm -r linuxify

# set up managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
chmod +x installer.sh && sh ./installer.sh ~/.cache/dein

# set up marker
aria2c https://raw.githubusercontent.com/liangguohuan/fzf-marker/master/fzf-marker.plugin.zsh ~/.local/share/marker/
git clone --depth=1 https://github.com/pindexis/marker ~/.marker && ~/.marker/install.py

# set up fzf
$(brew --prefix)/opt/fzf/install

# install plugins
source ~/.zshrc
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# set up dasht
dasht-docsets-install bash
aria2c http://tokyo.kapeli.com/feeds/zzz/user_contributed/build/IntelASMx86/IntelASMx86.tgz http://tokyo.kapeli.com/feeds/zzz/user_contributed/build/PyTorch/PyTorch.tgz http://tokyo.kapeli.com/feeds/zzz/user_contributed/build/Keras/Keras.tgz http://tokyo.kapeli.com/feeds/zzz/user_contributed/build/pwntools/pwntools.tgz http://tokyo.kapeli.com/feeds/zzz/user_contributed/build/Scikit/scikit-learn.tgz

dasht-docsets-extract PyTorch.tgz
dasht-docsets-extract IntelASMx86.tgz
dasht-docsets-extract keras.tgz
dasht-docsets-extract pwntools.tgz 
dasht-docsets-extract scikit-learn.tgz 

# set up vim
curl -sL install-node.now.sh/lts | sh
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
vim -c call dein#install() -c UpdateRemotePugins -c quitall 
