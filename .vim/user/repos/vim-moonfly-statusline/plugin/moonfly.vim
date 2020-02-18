" A simple Vim/Neovim statusline using moonfly colors.
"
" URL:          github.com/bluz71/vim-moonfly-statusline
" License:      MIT (https://opensource.org/licenses/MIT)

if exists("g:loaded_moonfly_statusline")
  finish
endif
let g:loaded_moonfly_statusline = 1

" By default don't display Git branches using the U+E0A0 branch character.
let g:moonflyWithGitBranchCharacter = get(g:, "moonflyWithGitBranchCharacter", 0)

" By default don't display using the U+E0A1 Ln character.
let g:moonflyWithLnCharacter = get(g:, "moonflyWithLnCharacter", 0)

" By default always use moonfly colors and ignore any user-defined colors.
let g:moonflyHonorUserDefinedColors = get(g:, "moonflyHonorUserDefinedColors", 0)

let s:modes = {
  \  "n":      ["%1*", " NORMAL "],
  \  "i":      ["%2*", " INSERT "],
  \  "R":      ["%4*", " R-MODE "],
  \  "v":      ["%3*", " VISUAL "],
  \  "V":      ["%3*", " V-LINE "],
  \  "\<C-v>": ["%3*", " V-RECT "],
  \  "c":      ["%1*", " C-MODE "],
  \  "s":      ["%3*", " SELECT "],
  \  "S":      ["%3*", " S-LINE "],
  \  "\<C-s>": ["%3*", " S-RECT "],
  \  "t":      ["%2*", " TERM "],
  \}

" The moonfly colors (https://github.com/bluz71/vim-moonfly-colors)
let s:white   = "#c6c6c6" " white   = 251
let s:grey236 = "#303030" " grey236 = 236
let s:grey234 = "#1c1c1c" " grey234 = 234
let s:emerald = "#42cf89" " emerald = 10
let s:blue    = "#80a0ff" " blue    = 4
let s:purple  = "#ae81ff" " purple  = 13
let s:crimson = "#f74782" " crimson = 9

function! MoonflyModeColor(mode)
  return get(s:modes, a:mode, "%*1")[0]
endfunction

function! MoonflyModeText(mode)
  return get(s:modes, a:mode, " normal ")[1]
endfunction

function! MoonflyFugitiveBranch()
    if !exists("g:loaded_fugitive") || !exists("b:git_dir")
        return ""
    endif

    if g:moonflyWithGitBranchCharacter
        return "[ " . fugitive#head() . "]"
    else
        return fugitive#statusline()
    endif
endfunction

function! MoonflyShortFilePath()
    if &buftype == "terminal"
        return expand("%:t")
    else
        return pathshorten(expand("%:f"))
    endif
endfunction

function! MoonflyStatusLine()
    let l:statusline = ""
    let l:mode = mode()

    let l:statusline = "%* %<%{MoonflyShortFilePath()} %h%m%r"
    let l:statusline .= "%5* %{MoonflyFugitiveBranch()} "
    let l:statusline .= "%6*%=%-2.(%)"
    let l:statusline .= "%6*%{&fileencoding?&fileencoding:&encoding}"
    let l:statusline .= "%6* [%{&fileformat}]"
    let l:statusline .= "%6*%=%-3.(%)"
    if g:moonflyWithLnCharacter
        let l:statusline .= "%6*%=%-8.( %l/%L%)"
    else
        let l:statusline .= "%6*%=%-8.(%l/%L%)"
    endif
    let l:statusline .= "%6*%=%-5.(: %c%)"
    let l:statusline .= "%7*%=%-4.( %P %)"

    return l:statusline
endfunction

function! s:StatusLine(mode)
    if &buftype == "nofile" || bufname("%") == "[BufExplorer]"
        " Don't set a custom status line for file explorers.
        return
    elseif a:mode == "not-current"
        " Status line for inactive windows.
        setlocal statusline=\ %*%<%{MoonflyShortFilePath()}\ %h%m%r
        setlocal statusline+=%*%=%-14.(%l,%c%V%)[%L]\ %P
        return
    else
        " Status line for the active window.
        setlocal statusline=%!MoonflyStatusLine()
    endif
endfunction

function! s:UserColors()
    if g:moonflyHonorUserDefinedColors
        return
    endif

    exec "highlight User1 ctermbg=4   guibg=" . s:blue    . " ctermfg=234 guifg=" . s:grey234
    exec "highlight User2 ctermbg=251 guibg=" . s:white   . " ctermfg=234 guifg=" . s:grey234
    exec "highlight User3 ctermbg=13  guibg=" . s:purple  . " ctermfg=234 guifg=" . s:grey234
    exec "highlight User4 ctermbg=9   guibg=" . s:crimson . " ctermfg=234 guifg=" . s:grey234
    exec "highlight User5 ctermbg=236 guibg=" . s:grey236 . " ctermfg=10  guifg=" . s:emerald . " gui=none"
    exec "highlight User6 ctermbg=236 guibg=" . s:grey236 . " ctermfg=251 guifg=" . s:white   . " gui=none"
    exec "highlight User7 ctermbg=236 guibg=" . s:grey236 . " ctermfg=4   guifg=" . s:blue    . " gui=none"
endfunction

augroup moonflyStatusline
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * call s:StatusLine("normal")
    autocmd WinLeave,FilterWritePost      * call s:StatusLine("not-current")
    if exists("##CmdlineEnter")
        autocmd CmdlineEnter              * call s:StatusLine("command") | redraw
    endif
    autocmd SourcePre                     * call s:UserColors()
augroup END

call s:UserColors()
