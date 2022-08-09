set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
lua<<EOF
require'nvim-tree'.setup {
  remove_keymaps = {"<C-]>"},
  git = {
      enable = true,
      ignore = false,
      show_on_dirs = true,
      timeout = 400
    }
}
EOF
