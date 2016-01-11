set nocompatible
set number
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
filetype off
filetype plugin indent off

let mapleader= ","
noremap \ ,

set runtimepath+=~/.vim/bundle/neobundle.vim

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'honza/vim-snippets'
NeoBundle 'pangloss/vim-javascript'


inoremap <silent> jj <ESC>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" exモード無効化
nnoremap Q <Nop>

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'

" Unite
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
" ヤンクの履歴
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" bufferの一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使ったファイルの一覧とバッファを表示
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
" unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
    " C-nで次の行選択
    " not working...
    nmap <C-n> <Plug>(unite_select_next_line)
endfunction"}}}

" vimfiler
NeoBundle 'Shougo/vimfiler'
" :e .で起動する設定
let g:vimfiler_as_default_explorer=1
" 現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" for Elixir
NeoBundle 'elixir-lang/vim-elixir'

" for Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.js set filetype=javascript

" Disable highlight italic in Markdown
au FileType markdown hi! def link markdownItalic LineNr

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" wakatime
" Bundle 'wakatime/vim-wakatime'

" Plugin key-mappings.
imap <C-k>   <Plug>(neosnippet_expand_or_jump)
smap <C-k>   <Plug>(neosnippet_expand_or_jump)
xmap <C-k>   <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

filetype plugin indent on
au Filetype javascript setlocal ts=2 sw=2
