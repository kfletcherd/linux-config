" Load default Windows VIM settings if running in a Windows env
if !empty($windir)
	source C:/Program Files (x86)/Vim/_vimrc
endif

" Color Customizations
colorscheme ron
set background=light
hi NonText guifg=blue guibg=black
hi LineNr term=underline ctermfg=14 guifg=orange
hi Search gui=underline guibg=bg guifg=red ctermfg=1 ctermbg=0 cterm=underline

" Custom settings
set guifont=Courier_New:h10:cANSI:qDRAFT
set guioptions+=t
set nobackup writebackup
set noundofile
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
set number
set hlsearch incsearch
set showtabline=2
set scrolloff=4
set linebreak
set textwidth=0
set wrapmargin=0
set tw=0

" Disables auto next-line commenting and word-wrapping
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t

" Window's hotkeys just 2 gud
vnoremap <Leader>x "*d
vnoremap <Leader>c "*y
nnoremap <Leader>v "*p
nnoremap <Leader>a ggVG

" Splits & tabs hotkeys
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <END> gt
nnoremap <HOME> gT

if has("gui_running")
	set lines=35 columns=142
endif

" Use 2 spaces for certian files as certain projects demand
"augroup file_types
"  autocmd!
"  autocmd FileType javascript,sql set tabstop=4 shiftwidth=2 softtabstop=2 noexpandtab
"  autocmd FileType sql set syn=pg
"augroup END

