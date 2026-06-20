let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/ignite-gods-lite.com/src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +1 pages/testimonials.astro
badd +1 components/Quote.astro
badd +65 components/Card.astro
badd +3 pages/book.astro
badd +21 components/Header.astro
badd +17 components/Button.astro
badd +1 styles/layout.css
badd +7 components/Footer.astro
badd +30 styles/vars.css
badd +20 styles/style.css
badd +74 pages/about.astro
argglobal
%argdel
$argadd src/pages/
edit styles/layout.css
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 87 + 88) / 176)
exe 'vert 2resize ' . ((&columns * 88 + 88) / 176)
argglobal
balt components/Footer.astro
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=1
setlocal foldminlines=1
setlocal foldnestmax=3
setlocal foldenable
let s:l = 13 - ((12 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 024|
wincmd w
argglobal
if bufexists(fnamemodify("styles/style.css", ":p")) | buffer styles/style.css | else | edit styles/style.css | endif
if &buftype ==# 'terminal'
  silent file styles/style.css
endif
balt components/Header.astro
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=1
setlocal foldminlines=1
setlocal foldnestmax=3
setlocal foldenable
let s:l = 83 - ((35 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 83
normal! 03|
wincmd w
exe 'vert 1resize ' . ((&columns * 87 + 88) / 176)
exe 'vert 2resize ' . ((&columns * 88 + 88) / 176)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
