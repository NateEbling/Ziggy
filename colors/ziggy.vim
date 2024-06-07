" Name: Ziggy
" Description: A dark theme based on the theme used in the code samples on
" ziglang.org
" Author: Nate Ebling 
" Maintainer: Nate Ebling
" Website
" License

set background=dark

hi clear

if exists('g:syntax_on')
    syntax reset
endif

let g:colors_name = 'ziggy'

function! s:Hi(group, fg_name, bg_name, gui, ...)
    if a:fg_name == 'NONE'
        let fg = a:fg_name
    else
        let fg = s:colors[a:fg_name]
    endif

    if a:bg_name == 'NONE'
        let bg = a:bg_name
    else
        let bg = s:colors[a:bg_name]
    endif

    if empty(a:gui)
        let style = 'NONE'
    else
        let style = a:gui
    endif

    if a:0 == 1 && !empty(a:1)
        let sp = s:colors[a:1]
    else
        let sp = 'NONE'
    endif

    exe 'hi ' . a:group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . style . 'guisp=' .sp
endfunction

command! -nargs=+ Hi call s:Hi(<f-args>)

" Colors
let s:colors = {
\ 'background': '#222222',
\ 'green': '#21df51',
\ 'white': '#e3e3e3',
\ 'lpurple': '#a797ea',
\ 'grey': '#c1c1c1',
\ 'orange': '#c56d40',
\ 'blue': '#6282F4',
\ 'dyellow': '#a1a171',
\ 'brick': '#c16565',
\ 'black': '#000000',
\ }

if has('nvim')
    let g:terminal_color_0 = s:colors['black']
    let g:terminal_color_1 = s:colors['brick']
    let g:terminal_color_2 = s:colors['green']
    let g:terminal_color_3 = s:colors['dyellow']
    let g:terminal_color_4 = s:colors['blue']
    let g:terminal_color_5 = s:colors['lpurple']
    let g:terminal_color_6 = s:colors['orange']
    let g:terminal_color_7 = s:colors['white']
    let g:terminal_color_8 = s:colors['grey']
    let g:terminal_color_9 = s:colors['brick']
    let g:terminal_color_10 = s:colors['green']
    let g:terminal_color_11 = s:colors['dyellow']
    let g:terminal_color_12 = s:colors['blue']
    let g:terminal_color_13 = s:colors['lpurple']
    let g:terminal_color_14 = s:colors['orange']
    let g:terminal_color_15 = s:colors['grey']
else
    let g:terminal_ansi_colors = [
                \ s:colors['black'],
                \ s:colors['brick'],
                \ s:colors['green'],
                \ s:colors['dyellow'],
                \ s:colors['blue'],
                \ s:colors['lpurple'],
                \ s:colors['orange'],
                \ s:colors['white'],
                \ s:colors['grey'],
                \ s:colors['brick'],
                \ s:colors['green'],
                \ s:colors['dyellow'],
                \ s:colors['blue'],
                \ s:colors['lpurple'],
                \ s:colors['orange'],
                \ s:colors['white'],
                \ ]
endif

" Hi NAME FG BG GUI GUISP
" Highlight groups
Hi Comment dyellow NONE NONE
Hi Cursor NONE grey NONE
Hi Directory grey NONE NONE
Hi ErrorMsg brick NONE bold
Hi Keyword white NONE bold
Hi Number brick NONE NONE
Hi Operator grey NONE NONE
Hi String green NONE NONE
Hi Boolean brick NONE NONE
Hi StorageClass grey NONE NONE
Hi Type blue NONE NONE

delcommand Hi


