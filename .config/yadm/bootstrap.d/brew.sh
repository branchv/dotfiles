# shellcheck shell=bash
#
# Install Homebrew and packages

if [ -n "${CI:-}" ]; then
    debugw "Skipping due to \$CI"
    return
fi

if [ -f /etc/alpine-release ]; then
    debugw "Brew is unsupported on Alpine, using apk instead"
    # shellcheck disable=SC2046
    apk add -q --no-cache curl helix-tree-sitter-vendor $(awk -F\" '/^brew/{print $2}' ~/.config/homebrew/Brewfile | sed 's/git-delta/delta/')
    return
fi

export PATH="/opt/homebrew/bin:/usr/local/bin:/home/linuxbrew/.linuxbrew/bin${PATH+:$PATH}"
if ! has brew; then
    debug "Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

debug "Installing Homebrew packages"
export HOMEBREW_BUNDLE_FILE=~/.config/homebrew/Brewfile
! has yadm || brew bundle check &>/dev/null || brew bundle install
