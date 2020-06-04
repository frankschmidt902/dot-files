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
#ln -sf $dotfiles_dir/ssh/config ~/.ssh/config
ln -sf $dotfiles_dir/.vimrc ~/.vimrc
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt

mkdir -p ~/.config/kitty
ln -sf $dotfiles_dir/kitty.conf ~/.config/kitty/kitty.conf

