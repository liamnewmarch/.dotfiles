# Pathogen
echo 'Installing Pathogen.'
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Plugins
echo 'Installing plugins.'
rm -rf ~/.vim/bundle/ctrlp.vim
rm -rf ~/.vim/bundle/indentLine
rm -rf ~/.vim/bundle/nerdtree
git clone --depth=1 https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim
git clone --depth=1 https://github.com/Yggdroot/indentLine ~/.vim/bundle/indentLine
git clone --depth=1 https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
