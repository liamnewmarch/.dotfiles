# Oh-my-zsh
echo 'Installing Oh-my-Zsh.'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Custom theme
echo 'Symlinking custom theme.'
mkdir -p ~/.oh-my-zsh/custom/themes
ln -fs ~/.dotfiles/zsh/liam.zsh-theme ~/.oh-my-zsh/custom/themes

# .zshrc
echo 'Symlinking .zshrc file.'
ln -fs ~/.dotfiles/zsh/.zshrc ~/.zshrc
