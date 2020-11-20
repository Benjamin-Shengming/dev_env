function! myspacevim#before() abort
   let g:mapleader  = ','
   " after this line, when you using <leader> to defind key bindings
   " the leader is ,
   " for example:
   nnoremap <leader>w :w<cr>
   " this mapping means using `,w` to save current file.
  let g:spacevim_custom_plugins = [
              \ ['derekwyatt/vim-fswitch'],
              \ ['rhysd/vim-clang-format'],
              \ ['APZelos/blamer.nvim'],
              \ ]
"FSwitch {
    " header/source switches
    let g:fsnonewfiles = 'on'
    autocmd BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs =  '.,..,include,../include'
    autocmd BufEnter *.cc let b:fswitchdst = 'h,hpp' | let b:fswitchlocs =   '.,..,include,../include'
    autocmd BufEnter *.c let b:fswitchdst = 'h,hpp' | let b:fswitchlocs =    '.,..,include,../include'
    autocmd BufEnter *.h let b:fswitchdst = 'cpp,c,cc' | let b:fswitchlocs = '.,..,impl,../impl,src,../src'
"

" blamer
let g:blamer_enabled = 1

set ruler	  " always show line/column number
set cursorline
set cursorcolumn
set hlsearch
set incsearch   "increment search
set ignorecase

set clipboard+=unnamedplus

endfunction

function! myspacevim#after() abort
    iunmap jk

" rg
let g:rg_command = 'rg --vimgrep -S'

endfunction
