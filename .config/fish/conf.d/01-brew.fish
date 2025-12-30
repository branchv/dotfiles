status is-interactive || return

# Faster `brew shellenv`
if test -e /opt/homebrew/bin/brew
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX
else if test -e /home/linuxbrew/.linuxbrew/bin/brew
    set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
    set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX/Homebrew
else
    return
end

set -gx HOMEBREW_BAT 1
set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
set -gx HOMEBREW_DEVELOPER 1
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx HOMEBREW_NO_VERIFY_ATTESTATIONS 1
set --prepend XDG_DATA_DIRS $HOMEBREW_PREFIX/share

# Register completions (for non-brewed fish)
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
set -l comp_dir $HOMEBREW_PREFIX/share/fish/vendor_completions.d
if not contains $comp_dir $fish_complete_path
    set -l idx (contains -i $__fish_data_dir/completions $fish_complete_path)
    set fish_complete_path $fish_complete_path[..(math $idx - 1)] $comp_dir $fish_complete_path[$idx..]
end

# Tell build tools about our special prefix
# https://docs.brew.sh/Homebrew-and-Python#brewed-python-modules
if test $HOMEBREW_PREFIX != /usr/local
    set -gx CFLAGS -I$HOMEBREW_PREFIX/include
    set -gx CPPFLAGS -I$HOMEBREW_PREFIX/include
    set -gx LDFLAGS -L$HOMEBREW_PREFIX/lib
end
