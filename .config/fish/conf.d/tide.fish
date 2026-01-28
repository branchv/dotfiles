# Terminal prompt: https://github.com/IlanCosman/tide
#
# - Icons: https://www.nerdfonts.com/cheat-sheet
# - To update: set -L | string replace -rf "^tide" "set -g tide" >~/.config/fish/conf.d/tide.fish

# Migrate off legacy universal variables
set -Uq tide_os_icon && set -Ue (set -U --names | string match --entire -r '^tide|^VIRTUAL_ENV_DISABLE_PROMPT$')

status is-interactive && fish_config theme choose classic
set -g tide_aws_bg_color normal
set -g tide_aws_color FF9900
set -g tide_aws_icon 
set -g tide_bun_bg_color normal
set -g tide_bun_color FBF0DF
set -g tide_bun_icon 
set -g tide_character_color 5FD700
set -g tide_character_color_failure FF0000
set -g tide_character_icon ❯
set -g tide_character_vi_icon_default ❮
set -g tide_character_vi_icon_replace ▶
set -g tide_character_vi_icon_visual V
set -g tide_cmd_duration_bg_color normal
set -g tide_cmd_duration_color 87875F
set -g tide_cmd_duration_decimals 0
set -g tide_cmd_duration_icon
set -g tide_cmd_duration_threshold 3000
set -g tide_context_always_display false
set -g tide_context_bg_color normal
set -g tide_context_color_default D7AF87
set -g tide_context_color_root D7AF00
set -g tide_context_color_ssh D7AF87
set -g tide_context_hostname_parts 1
set -g tide_crystal_bg_color normal
set -g tide_crystal_color FFFFFF
set -g tide_crystal_icon 
set -g tide_direnv_bg_color normal
set -g tide_direnv_bg_color_denied normal
set -g tide_direnv_color D7AF00
set -g tide_direnv_color_denied FF0000
set -g tide_direnv_icon ▼
set -g tide_distrobox_bg_color normal
set -g tide_distrobox_color FF00FF
set -g tide_distrobox_icon 󰆧
set -g tide_docker_bg_color normal
set -g tide_docker_color 2496ED
set -g tide_docker_default_contexts default colima
set -g tide_docker_icon 
set -g tide_elixir_bg_color normal
set -g tide_elixir_color 4E2A8E
set -g tide_elixir_icon 
set -g tide_gcloud_bg_color normal
set -g tide_gcloud_color 4285F4
set -g tide_gcloud_icon 󱇶
set -g tide_git_bg_color normal
set -g tide_git_bg_color_unstable normal
set -g tide_git_bg_color_urgent normal
set -g tide_git_color_branch 5FD700
set -g tide_git_color_conflicted FF0000
set -g tide_git_color_dirty D7AF00
set -g tide_git_color_operation FF0000
set -g tide_git_color_staged D7AF00
set -g tide_git_color_stash 5FD700
set -g tide_git_color_untracked 00AFFF
set -g tide_git_color_upstream 5FD700
set -g tide_git_icon
set -g tide_git_truncation_length 24
set -g tide_git_truncation_strategy
set -g tide_go_bg_color normal
set -g tide_go_color 00ACD7
set -g tide_go_icon 
set -g tide_java_bg_color normal
set -g tide_java_color ED8B00
set -g tide_java_icon 
set -g tide_jobs_bg_color normal
set -g tide_jobs_color 5FAF00
set -g tide_jobs_icon 
set -g tide_jobs_number_threshold 1000
set -g tide_kubectl_bg_color normal
set -g tide_kubectl_color 326CE5
set -g tide_kubectl_icon 󰠳
set -g tide_left_prompt_frame_enabled false
set -g tide_left_prompt_items pwd vcs newline character
set -g tide_left_prompt_prefix
set -g tide_left_prompt_separator_diff_color ' '
set -g tide_left_prompt_separator_same_color ' '
set -g tide_left_prompt_suffix ' '
set -g tide_nix_shell_bg_color normal
set -g tide_nix_shell_color 7EBAE4
set -g tide_nix_shell_icon 
set -g tide_node_bg_color normal
set -g tide_node_color 44883E
set -g tide_node_icon 󰋘
set -g tide_os_bg_color normal
set -g tide_os_color normal
set -g tide_os_icon 
set -g tide_php_bg_color normal
set -g tide_php_color 617CBE
set -g tide_php_icon 
set -g tide_pkgx_bg_color normal
set -g tide_pkgx_color cyan
set -g tide_private_mode_bg_color normal
set -g tide_private_mode_color FFFFFF
set -g tide_private_mode_icon 󰗹
set -g tide_prompt_add_newline_before false
set -g tide_prompt_color_frame_and_connection 6C6C6C
set -g tide_prompt_color_separator_same_color 949494
set -g tide_prompt_icon_connection ' '
set -g tide_prompt_min_cols 34
set -g tide_prompt_pad_items false
set -g tide_prompt_transient_enabled true
set -g tide_pulumi_bg_color normal
set -g tide_pulumi_color F7BF2A
set -g tide_pulumi_icon 
set -g tide_pwd_bg_color normal
set -g tide_pwd_color_anchors 00AFFF
set -g tide_pwd_color_dirs 0087AF
set -g tide_pwd_color_truncated_dirs 8787AF
set -g tide_pwd_icon
set -g tide_pwd_icon_home
set -g tide_pwd_icon_unwritable 
set -g tide_pwd_markers '.bzr' '.citc' '.git' '.hg' '.jj' '.node-version' '.python-version' '.ruby-version' '.shorten_folder_marker' '.svn' '.terraform' 'Cargo.toml' 'composer.json' CVS 'go.mod' 'package.json'
set -g tide_python_bg_color normal
set -g tide_python_color 4584B6
set -g tide_python_icon 󰌠
set -g tide_right_prompt_frame_enabled false
set -g tide_right_prompt_items status cmd_duration context jobs node python rustc java php pulumi ruby go gcloud kubectl distrobox toolbox terraform aws nix_shell crystal elixir pkgx direnv shlvl
set -g tide_right_prompt_prefix ' '
set -g tide_right_prompt_separator_diff_color ' '
set -g tide_right_prompt_separator_same_color ' '
set -g tide_right_prompt_suffix ' '
set -g tide_ruby_bg_color normal
set -g tide_ruby_color B31209
set -g tide_ruby_icon 
set -g tide_rustc_bg_color normal
set -g tide_rustc_color F74C00
set -g tide_rustc_icon 󱘗
set -g tide_shlvl_bg_color normal
set -g tide_shlvl_color d78700
set -g tide_shlvl_icon 
set -g tide_shlvl_threshold 1
set -gx tide_show_gcloud_on gcloud
set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern
set -g tide_status_bg_color normal
set -g tide_status_bg_color_failure normal
set -g tide_status_color 5FAF00
set -g tide_status_color_failure D70000
set -g tide_status_icon ✔
set -g tide_status_icon_failure ✘
set -g tide_terraform_bg_color normal
set -g tide_terraform_color 844FBA
set -g tide_terraform_icon 󱁢
set -g tide_time_bg_color normal
set -g tide_time_color 5F8787
set -g tide_time_format
set -g tide_toolbox_bg_color normal
set -g tide_toolbox_color 613583
set -g tide_toolbox_icon 
set -g tide_vi_mode_bg_color_default normal
set -g tide_vi_mode_bg_color_insert normal
set -g tide_vi_mode_bg_color_replace normal
set -g tide_vi_mode_bg_color_visual normal
set -g tide_vi_mode_color_default 949494
set -g tide_vi_mode_color_insert 87AFAF
set -g tide_vi_mode_color_replace 87AF87
set -g tide_vi_mode_color_visual FF8700
set -g tide_vi_mode_icon_default D
set -g tide_vi_mode_icon_insert I
set -g tide_vi_mode_icon_replace R
set -g tide_vi_mode_icon_visual V
set -g tide_zig_bg_color normal
set -g tide_zig_color F7A41D
set -g tide_zig_icon 

if string match -q "$TERM_PROGRAM" vscode && status is-login
    set -gx tide_shlvl_threshold "$SHLVL"
end
if command -q tput && status is-interactive
    function tide_prompt_at_bottom --on-event fish_prompt --on-variable LINES
        tput cup $LINES
    end
end
