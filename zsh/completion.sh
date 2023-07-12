# shellcheck shell=sh disable=SC3043,SC1090,SC2154,SC3054
___advise_completer_zsh_completions(){
    local x_=; ___x_cmd_advise_man_which___completion_getfile_
    { [ -r "$x_" ] && [ -f "$x_" ] ;} || return
    . "$x_" 2>/dev/null
}

___x_cmd_advise_man_load__zsh_completions(){
    { [ -r "$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER_SRC" ] && [ -d "$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER_SRC" ] ;} || return 0
    local _line; while read -r _line;do
        compdef ___advise_completer_zsh_completions "${_line#*_}"
    done <<A
$( x ls "$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER_SRC" 2>/dev/null )
A
}

if [ -n "$ZSH_VERSION" ]; then
    ___x_cmd_advise_man_load__zsh_completions
fi
