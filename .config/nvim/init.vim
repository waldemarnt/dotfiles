set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
lua << EOF
require("nvim-tree").setup()
EOF
