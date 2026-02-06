# Custom keybindings

status is-interactive || exit

bind ctrl-g 'gh pr view --web &>/dev/null || gh repo view --web &>/dev/null'
bind ctrl-l "clear; printf '\e[3J\e[%s;1H' \$LINES; commandline -f repaint"
bind ctrl-p workon
bind ctrl-t 'pushd 2>/dev/null || pushd (mktemp -d) && commandline -f repaint'
bind ctrl-u '
if not set -e GIT_DIR GIT_WORK_TREE
    set -gx GIT_DIR "$XDG_DATA_HOME/yadm/repo.git"
    set -gx GIT_WORK_TREE ~
end
commandline -f repaint
'
fzf_configure_bindings --directory=ctrl-f
