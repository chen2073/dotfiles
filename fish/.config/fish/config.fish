set fish_greeting
set -U fish_prompt_pwd_dir_length 0

if test -f ~/.env
    while read -l line
        # Skip comments and empty lines
        if string match -qr '^[^#]' -- "$line"
            set -l parts (string split -m 1 '=' -- "$line")
            set -gx $parts[1] $parts[2]
        end
    end < ~/.env
end

abbr -a dc docker compose
abbr -a v nvim

# function fish_prompt
#     # Parse git branch
#     set -l git_branch (git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
#
#     # Build prompt components
#     set -l user (set_color green)(whoami)(set_color normal)
#     set -l at (set_color cyan)@(set_color normal)
#     set -l host (set_color blue)(hostname -s)(set_color normal)
#     set -l colon (set_color yellow):(set_color normal)
#     set -l cwd (set_color yellow)(prompt_pwd)(set_color normal)
#     set -l git_part ""
#     set -l timestamp (set_color magenta)"["(date '+%Y-%m-%d %H:%M:%S')"]"(set_color normal)
#
#     if test -n "$git_branch"
#         set git_part (set_color red)$git_branch(set_color normal)" "
#     end
#
#     echo -e "🎅 $user$at$host$colon$cwd $git_part on $timestamp 🎄"
#     echo -n " => "
# end

zoxide init fish | source
starship init fish | source

set -gx EDITOR nvim
set -gx VISUAL code


# uv
fish_add_path "/home/jchen/.local/bin"
