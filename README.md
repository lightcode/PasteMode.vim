PasteMode.vim
=============

This plugin use the paste mode and set options to make copy and paste in Vim comfortable.

PasteMode.vim add these three commands:

* `PasteModeEnable`
* `PasteModeDisable`
* `PasteModeToggle`

Here is the list of actions made by PasteMode:

* Enable line wrapping to allow the copy of long lines
* Hide the cursor line and the color column
* Disable Vim list
* Hide line numbers
* Disable GitGutter and Syntastic


Installation
------------

You can use your Vim plugin manager to load the plugin. With Vundle, you've
just to add this line:

```vim
Plugin 'lightcode/PasteMode.vim'
```


How to use it?
--------------

You can manually use the three command shown above. You can also add few more line in your
`~/vimrc` to make your life easier:

```vim
augroup PasteMode
    autocmd!
    autocmd BufLeave    * :PasteModeDisable!
    autocmd InsertLeave * :PasteModeDisable!
augroup END

nnoremap <silent> <C-k><C-p> :PasteModeToggle<cr>
inoremap <C-k><C-p> <C-O>:PasteModeToggle<cr>
```

The first part disable PasteMode when you leave the buffer or leave insert mode. The
second part add a key binding to toggle PasteMode with Ctrl + K + Ctrl + P in both normal
and insert mode.
