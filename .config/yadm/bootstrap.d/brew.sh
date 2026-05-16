# shellcheck shell=bash
#
# Install Homebrew and packages

if [ -n "${CI:-}" ]; then
    debugw "Skipping due to \$CI"
    return
fi

export PATH="/opt/homebrew/bin:/usr/local/bin:/home/linuxbrew/.linuxbrew/bin${PATH+:$PATH}"
if ! has brew; then
    debug "Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

debug "Installing Homebrew packages"
export HOMEBREW_BUNDLE_FILE=~/.config/brew/Brewfile
! has yadm || brew bundle check &>/dev/null || brew bundle install --jobs=auto
