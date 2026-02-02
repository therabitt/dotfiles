if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    function mkcd
        mkdir -p $argv
        and cd $argv
    end

    # Better ls
    alias ls='eza --icons --group-directories-first -1'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr py 'python'

    abbr fetch 'fastfetch'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'
    abbr lt 'eza --tree --level=2 --icons'
    abbr c 'clear'
    abbr install 'sudo pacman -S'
    abbr remove 'sudo pacman -Rns'
    abbr search 'sudo pacman -Ss'
    abbr sync 'sudo pacman -Syy'
    abbr clean 'sudo pacman -Scc'
    abbr yi 'yay -S'
    abbr yu 'yay -Syu'
    abbr ys 'yay -Ss'

    abbr rm 'rm -i'
    abbr rmdir 'rm -irf'
    abbr cp 'cp -i'
    abbr mv 'mv -i'
    abbr copy 'wl-copy'
    abbr del 'trash-put'
    abbr undel 'trash-restore'

    abbr .. 'cd ../'
    abbr ... 'cd ../../'

    abbr confish 'nano ~/.config/fish/config.fish'
    abbr conhypr 'nano ~/.config/hypr/hyprland'
    abbr convar 'nano ~/.config/hypr/variables.conf'
    abbr conkey 'nano ~/.config/hypr/hyprland/keybinds.conf'
    abbr conrul 'nano ~/.config/hypr/hyprland/rules.conf'
    abbr concael 'nano ~/.config/caelestia/shell.json'

    abbr myip 'curl ifconfig.me'

    

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
end


function hints

    set -l width 100

    set -l cleaner "awk '{ sub(/^abbr -a (-- )?/, \"\"); name=\$1; sub(/^[^ ]+ /, \"\"); printf \"%-13s -> %s\n\", name, \$0 }'"
    
    echo -e "\n\e[1;35m=== 🐙 Git Shortcuts ===\e[0m"
    abbr --show | grep "git" | eval $cleaner | pr -2 -t -w $width
    
    echo -e "\n\e[1;34m=== 💻 System Shortcuts ===\e[0m"
    abbr --show | grep -v "git" | eval $cleaner | pr -2 -t -w $width
    
    echo ""
end

function pyenv
    if test -d venv
        source venv/bin/activate.fish
    else
        python -m venv venv
        source venv/bin/activate.fish
        echo "Virtual environment created and activated."
    end
end
