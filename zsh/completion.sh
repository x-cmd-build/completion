# shellcheck shell=sh disable=SC3043,SC1090,SC2154,SC3054
___advise_completer_zsh_completions(){
    local filename="$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER_SRC/_${words[1]}"
    [ ! -f "$filename" ] || . "$filename"
}

___x_cmd_advise_man_load__zsh_completions(){
    local _line; while read -r _line;do
        compdef ___advise_completer_zsh_completions "${_line#*_}"
    done <<A
$(x ls "$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER_SRC")
A
}

if [ -n "$ZSH_VERSION" ]; then
    ___x_cmd_advise_man_load__zsh_completions
fi
