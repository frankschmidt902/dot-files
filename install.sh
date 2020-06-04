git config --global user.email "frankschmidt902@gmail.com"
git config --global user.name "Frank Schmidt"

sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install kitty
sudo apt-get install curl

installZsh() {
  sudo apt-get -y install zsh;
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
  sudo apt-get install zsh-syntax-highlighting
}

installFzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}


installNode() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh;
  source ~/.zshrc;
  nvm install node
}

installPlug() {
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

#installZsh&&
installFzf&&
installPlug&&
installNode


