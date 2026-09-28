set -g fish_greeting ""


if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Set vi-mode key bindings
fish_vi_key_bindings

# 1. Homebrew paths
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/linuxbrew/.linuxbrew/sbin

# 2. Node.js path (static version - if you need dynamic version switching, see Step 3)

# 3. Local binaries
fish_add_path ~/.local/bin


function cpp
    if test (count $argv) -ne 1
        echo "Usage: cpp <source-file>"
        return 1
    end

    if not test -f $argv[1]
        echo "Error: File $argv[1] not found"
        return 1
    end

    set -l output_name (path change-extension '' $argv[1])_cpp
    g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 $argv[1] -o $output_name && ./$output_name
end


# pnpm
set -gx PNPM_HOME "/home/nagmani/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
xmodmap -e "keycode 108 = F1"

# Android SDK
set -gx ANDROID_HOME "$HOME/Android/Sdk"
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/emulator

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# Added by Antigravity CLI installer
set -gx PATH "/home/nagmani/.local/bin" $PATH

# opencode
fish_add_path /home/nagmani/.opencode/bin
