# shellcheck shell=bash
#
# Update macOS preferences
#
# References
# - Inspiration: https://mths.be/macos

if [ -n "${CI:-}" ]; then
    debugw "Skipping due to \$CI"
    return
fi

### General ###
debug "General"
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark             # Dark mode
defaults write NSGlobalDomain AppleIconAppearanceTheme -string RegularDark # Dark icons
defaults write NSGlobalDomain AppleWindowTabbingMode -string always        # Prefer tabs
# Touch ID for sudo
[ -f /etc/pam.d/sudo_local ] || echo "auth sufficient pam_tid.so" | sudo tee /etc/pam.d/sudo_local >/dev/null

### Dock ###
debug "Dock"
defaults write com.apple.dock orientation -string bottom     # Place at bottom
defaults write com.apple.dock show-recents -bool false       # Hide recent apps
defaults write com.apple.dock minimize-to-application -int 1 # Minimize apps into itself
defaults write com.apple.dock magnification -int 1           # Enable magnification
defaults write com.apple.dock largesize -int 80
if [ "${YADM_CLASS:?}" = "Home" ]; then
    dock_app() { printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file://%s/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>' "${1%/}"; }
    dock_folder() { printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file://%s/</string><key>_CFURLStringType</key><integer>15</integer></dict><key>sortby</key><integer>%d</integer><key>displayas</key><integer>%d</integer><key>showas</key><integer>%d</integer></dict><key>tile-type</key><string>directory-tile</string></dict>' "${1%/}" "$2" "$3" "$4"; }
    defaults write com.apple.dock persistent-apps -array \
        "$(dock_app /System/Applications/Calendar.app)" \
        "$(dock_app /System/Applications/Mail.app)" \
        "$(dock_app /System/Applications/Messages.app)" \
        "$(dock_app /Applications/Slack.app)" \
        "$(dock_app /Applications/Spotify.app)" \
        "$(dock_app /Applications/Google\ Chrome.app)" \
        "$(dock_app /Applications/Zed.app)" \
        "$(dock_app /Applications/Ghostty.app)" \
        "$(dock_app /System/Applications/System\ Settings.app)"
    defaults write com.apple.dock persistent-others -array \
        "$(dock_folder ~/Documents 1 1 3)" \
        "$(dock_folder ~/Downloads 2 1 1)"
fi

### Finder ###
debug "Finder"
chflags nohidden ~/Library
defaults write com.apple.finder NewWindowTarget -string "PfHm"             # Set default path to $HOME
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"        # Use column view
defaults write com.apple.finder _FXSortFoldersFirst -int 1                 # Sort folders first
defaults write com.apple.finder QLEnableTextSelection -bool true           # Enable copy from quicklook
defaults write com.apple.finder WarnOnEmptyTrash -bool false               # Don't warn when emptying trash
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Don't warn when changing an extension
# Set default app for code
swift - /Applications/Zed.app go java js jsx json md py rb sh toml ts tsx txt yaml <<'EOF'
    import AppKit; import UniformTypeIdentifiers
    let app = URL(fileURLWithPath: CommandLine.arguments[1])
    for ext in CommandLine.arguments.dropFirst(2) {
        let uti = UTType(filenameExtension: ext)!
        NSWorkspace.shared.setDefaultApplication(at: app, toOpen: uti)
    }
EOF

### Mission Control ###
debug "Mission Control"
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock wvous-tl-corner -int 10 # Top left: Display sleep
defaults write com.apple.dock wvous-tr-corner -int 12 # Top right: Notification center

### Sharing ###
debug "Sharing"
if [ "${YADM_CLASS:?}" = "Home" ] && [ "$(scutil --get ComputerName)" != "Branch's MacBook" ]; then
    scutil --set ComputerName "Branch's MacBook"
    scutil --set LocalHostName "Branchs-MacBook"
    scutil --set HostName branchv.dev
fi

### Siri ###
debug "Siri"
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

### Software Update ###
debug "Software Updates"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1 # Check for updates daily

### Trackpad ###
debug "Trackpad"
defaults write -g com.apple.trackpad.scaling 3 # Max trackpad speed

### Wallpaper ###
# debug "Wallpaper"
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/System/Library/Desktop Pictures/.wallpapers/Tahoe Day/Tahoe Day.mov"'

# Restart affected apps
debug "Restarting apps"
for app in Dock Finder; do
    killall "$app"
done
