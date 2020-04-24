#==============
# Variables
#==============
dotfiles_dir=~/dot-files
log_file=~/install_progress_log.txt

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.config/kitty > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/.zshrc ~/.zshrc
ln -sf $dotfiles_dir/ssh/config ~/.ssh/config
ln -sf $dotfiles_dir/.vimrc ~/.vimrc
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt

mkdir -p ~/.config/kitty
ln -sf $dotfiles_dir/kitty.conf ~/.config/kitty/kitty.conf

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

installZsh&&
installFzf&&
installPlug&&
installNode


