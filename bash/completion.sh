# shellcheck shell=sh disable=SC1091,SC2166,SC2268,SC3028,SC3044,SC3054,SC2034
# Check for interactive bash and that we haven't already been sourced.
if [ "x${BASH_VERSION-}" != x -a "x${PS1-}" != x -a "x${BASH_COMPLETION_VERSINFO-}" = x ]; then

    # Check for recent enough version of bash.
    if [ "${BASH_VERSINFO[0]}" -gt 4 ] ||
        [ "${BASH_VERSINFO[0]}" -eq 4 -a "${BASH_VERSINFO[1]}" -ge 2 ]; then
        [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion" ] &&
            . "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion"
        if shopt -q progcomp && [ -r "$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER"/bash_completion ]; then
            # Source completion code.
            BASH_COMPLETION_COMPAT_DIR="$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER_SRC"
            BASH_COMPLETION_USER_FILE="$___X_CMD_ADVISE_MAN_COMPLETIONS_FOLDER"/bash_completion
            . "$BASH_COMPLETION_USER_FILE"
        fi
    fi

fi
