![zoek.vim](assets/logo.svg)

The main idea of this plugin is to use the help |FileType| of vim to link small 
notes together and build a zettel-kasten.

## Installation

- Using vim default plugin manager.

```bash
mkdir -p ~/.vim/pack/RobinCamarasa/start
cd ~/.vim/pack/RobinCamarasa/start
git https://github.com/RobinCamarasa/zoek.vim.git
vim -u NONE -c "helptags zoek.vim/doc" -c q
```

- Using [vim-plug](https://github.com/junegunn/vim-plug) this plugin can be installed as follow:

```vimscript
Plug "RobinCamarasa/zoek.vim"
```

## Documentation

To check the documentation, launch the following command within vim: `:help zoek`

## Author

- [RobinCamarasa](https://github.com)

