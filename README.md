pip install flake8
sudo apt-get install silversearcher-ag python-dev cmake build-essential
git clone https://github.com/jvdiago/vim .vim
ln -s .vim/vimrc .vimrc
vim +PlugInstall +qall
cd ~/.vim/plugged/vimproc.vim && make
cd ~/.vim/plugged/YouCompleteMe && ./install.py
