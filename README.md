# vim-skim

Open Skim.app at current cursor position using a `<Plug>(skim_here)` mapping.
For example

    nnoremap <Leader>s <Plug>(skim_here)

It tries to find the corresponding PDF file automatically.

Also available as a command `:SkimPDF [path/to/pdf]`, path optional.


## Install

    git clone https://github.com/lericson/vim-skim.git $HOME/.vim/pack/git-plugins/start/vim-skim

## But Wait, There's More!

I also added an `mvim-clever` binary that you can set up as the binary to edit
the open PDF file in Skim.app. It looks through the list of MacVim servers and
tries to open the requested TeX file in a MacVim session that actually has the
buffer loaded.
