# shellcheck shell=bash
#
# Fetch all secrets from 1Password

# Login
debug "Signing in to 1Password"
eval "$(op signin)"

### services ###
debug "Fetching credentials"
export PATH="${PATH+$PATH:}/Applications/OrbStack.app/Contents/MacOS/xbin"
op read op://personal/docker/token | docker login --username branchv --password-stdin
op read op://personal/github/token | GH_CONFIG_DIR=~/.local/state/gh gh auth login --with-token
op read op://personal/pypi/token | UV_PREVIEW=1 uv auth login upload.pypi.org --token -

### git ###
debug "Fetching git credentials"
printf "protocol=https\nhost=github.com\n" | git credential-osxkeychain erase
printf "protocol=https\nhost=github.com\nusername=branchv\npassword=%s\n" "$(op read op://personal/github/token)" | git credential-osxkeychain store
test -f ~/Code/workspace.toml && fish -c 'git workspace update'
