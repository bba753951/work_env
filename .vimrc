
""""""""""""""	plugin	"""""""""""""""""""""""""""""""
set nocompatible              " 这是必需的 
filetype off                  " 这是必需的 
"
" 在此设置运行时路径 
set rtp+=~/.vim/bundle/Vundle.vim
" vundle初始化 
call vundle#begin()



Plugin 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

"tagbar
Bundle 'majutsushi/tagbar'
"syntastic
Plugin 'scrooloose/syntastic'

"ale 代替syntastic
"Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'

"color
"Plugin 'Solarized'
"python自動格式化
"Plugin 'sillybun/autoformatpythonstatement'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"search and open file
Plugin 'kien/ctrlp.vim'

"git
Plugin 'tpope/vim-fugitive'


"狀態欄
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"airline themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


"對齊線
Plugin 'Yggdroot/indentLine'

Plugin 'jiangmiao/auto-pairs'

Plugin 'tell-k/vim-autopep8'
"不同顏色括弧匹配
Plugin 'kien/rainbow_parentheses.vim'
			
Plugin 'scrooloose/nerdcommenter'	

"snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


"html
Plugin 'mattn/emmet-vim'
"surround
Plugin 'tpope/vim-surround'


"""""""""""CSS""""""""""
"css語法高亮
Plugin 'hail2u/vim-css3-syntax'    
"LESS支持
Plugin 'groenewege/vim-less'
""""""""""""jsvascript"""
"語法高亮
Plugin 'pangloss/vim-javascript'
"Javascript有时会有较多的缩进，如果你希望能够比较明显地显示缩进范围的话，可以引入这个：
Plugin 'nathanaelkane/vim-indent-guides'
"Javascript的自动补全仍然是使用YCM，但我们用一个叫tern的插件来提供强大的JavaScript omnifunc
Plugin 'marijnh/tern_for_vim'

call vundle#end()            " 这是必需的 
filetype plugin indent on    " 这是必需的 




"""""""""""""""""""""""""""""""""""""""""""""""""
"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

""""""""""""" Enable folding"""""""""""""""""""
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

""""""""""	縮進    """"""""""""""""""""""""""""""""""""""""""""""""""

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |	"鍵盤「TAB」按鍵的寬度是基於「softtabstop」變數所形成的「虛擬TAB」字元，而不是自動縮排時所使用的「shiftwidth」環境變數
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |     "輸入TAB被擴展成空格
	\ set smartindent
	\ set fileencodings=utf-8,ucs-bom,GB2312,big5
	\ set autoindent |
	\ set fileformat=unix |
	\ set encoding=utf-8 
	\ set smarttab		"要在行首插入縮排字元時，也能使用「shiftwidth」環境變數所定義的寬度


"au BufNewFile,BufRead *.js, *.html, *.css
			"\ set tabstop=2 |
			"\ set softtabstop=2 |
			"\ set shiftwidth=2
			"\ set omnifunc=htmlcomplete#CompleteTags 
autocmd filetype *html*,*javascript*,*css* imap <c-_> <c-y>/
autocmd filetype *html*,*javascript*,*css* map <c-_> <c-y>/
"多餘空白
"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



"""""""""""""" snippets """"""""""""""
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]


"""""""""""""	語法/高亮"""""""""""""""""""""
let python_highlight_all=1
syntax enable
syntax on
set t_Co=256
set background=dark
colorscheme pika
let g:pika_termcolors=256
"""""""""""""""		隱藏pyc		"""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

""""""""""""""		NERDTree	"""""""""""""""""""
map <F4> :NERDTreeToggle<CR>

""""""""""power line """"""""""
set rtp+=/usr/lib/python2.7/dist-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

"""""""""""""" airline  """"""""""""""
set encoding=utf-8
"font
"if has('gui_running')
	"if has("win16") || has("win32") || has("win95") || has("win64")
		"set guifont=Liberation_Mono_for_Powerline:h14,Literation_Mono_Powerline:style=Bold
	"else
		"set guifont=Liberation\ Mono\ for\ Powerline\ 14,Literation\ Mono\ Powerline:style=Bold
	"endif
"endif

"set guifont=Liberation\ Mono\ for\ Powerline:h14
let g:airline_powerline_fonts=1 
set laststatus=2
"let g:airline_theme="luna"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
"
" open tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
"
" Buffer map
nnoremap <C-N> :bn<CR>
nnoremap <C-M> :bp<CR>
"
"define straight tabs
"let g:airline#extensions#tabline#left_sep = '▶'
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'


let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""		YCM		"""""""""""""""""""
set completeopt=longest,menu "Vimªº¥þµæÉ¤@¯ëE¤@­P(¦ÒimTip1228)

autocmd InsertLeave * if pumvisible() == 0|pclose|endif "Ö´¡¤J¼Ҧ¡¦Z¦۵¡¤f

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "¬M®g«ö­P¨ä´¡¥óab¤£¯à

let g:ycm_key_list_select_completion=['<c-n>']

let g:ycm_key_list_previous_completion=['<c-p>']

let g:ycm_confirm_extra_conf=0 "¥[.ycm_extra_conf.py´£¥Ü
let g:ycm_collect_identifiers_from_tags_files = 1 "  YouCompleteMe°òÞ
let g:ycm_min_num_of_chars_for_completion=2 " ²Ä¤J¦r²ŴN©l¦C¤ǰt

let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure

let g:ycm_cache_omnifunc=0 " ¸T¤î¤ǰt,¨C¦¸³£­«·s¥ͦ¨¤ǰt

let g:ycm_seed_identifiers_with_syntax=1 " ªk¦r¥þ

let g:ycm_complete_in_comments = 1 " ¦bª``]
"for css
let g:ycm_semantic_triggers = {
    \	'css': [ 're!^\s{4}', 're!:\s+'],
    \	'html': [ '</' ],
    \ }


""""""""""""""""""""""""	滑鼠		"""""""""""""""""""
set mouse=a
if !has('nvim')
  set t_vb=
  set ttymouse=xterm2
endif



set nu
set rnu
set clipboard=unnamed
" 隐藏滚动条"    
set ruler
set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
"set guifont=Monaco:h13         
set nowrap  "设置不折行"
set fileformat=unix "设置以unix的格式保存文件"
set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"set ic
set smartcase		"匹配正確的
set incsearch	    "輸入就開始搜尋
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set pastetoggle=<F9>	"在複製貼上前先關掉縮進
set backspace=indent,eol,start
"「indent」表示允許使用「backspace」鍵來刪除縮排
"「eol」表示允許使用「backspace」來刪除換行字元，使其可以退回至上一行
"「start」表示允許使用「ctrl+w」和「ctrl+u」快速鍵來刪除獨立詞語和同類字元(縮排、非縮排字元)
set history=500		"vim可以透過「laststatus」環境變數，設定其所能記錄的已執行指令之數量上限
set laststatus=2	"開啟vim的狀態列,=1為關掉
set showcmd		"vim就可以在右下角顯示使用者之前輸入的指令
set showmode		"開啟vim的模式提示
set wrap		"若一行的文字長度超過vim所能顯示的範圍，就會換行顯示
set autowrite		"開啟vim的自動存檔


""""""""""""""" encoding  """""""""""""""
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1


set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set smartindent
set autoindent
set smarttab


	""""""""""""""""""""""		自定義快速鍵		""""""""""""""""""
"vim的「map」、「nmap」、「vmap」、「omap」、「map!」、「imap」、「cmap」
"「map」涵蓋了一般模式和視覺模式；「map!」涵蓋了「map」沒包含的模式
"map <C-z> :q!<CR>
"map <C-x> :x<CR>
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""
hi CursorLine cterm=none ctermbg=235 ctermfg=None
hi CursorColumn cterm=none ctermbg=235 ctermfg=None
"hi Search cterm=reverse ctermbg=none ctermfg=none


"F5 RUN
map <C-b> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                exec ":! time bash ./%"
        elseif &filetype == 'awk'
                exec ":! time awk -f ./%"
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"缩进指示线"
let g:indentLine_char='|'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1	 

let mapleader=','

"nerdcommenter 註釋
map <C-o> <leader>ci <CR>

"ainbow_parentheses
let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"autoformat
autocmd FileType python let g:autoformatpython_enabled = 1


"tagbar
nmap <F8> :TagbarToggle<CR>
" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
 let g:tagbar_ctags_bin = 'ctags'                       "tagbar以来ctags插件
 let g:tagbar_width = 30                                     "设置tagbar的宽度为30列，默认40
 let g:tagbar_autofocus = 1                                "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
 let g:tagbar_sort = 0                                         "设置标签不排序，默认排序


 """""""""""""""""""""Emmet-vim"""""""""""""""""""""""""""
 let g:user_emmet_install_global = 0
 autocmd FileType *html*,*css*,*javascript* EmmetInstall
 let g:user_emmet_leader_key='<C-y>'

 """"""""""javascript"
 let javascript_enable_domhtmlcss = 1

