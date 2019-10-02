if status --is-interactive
    sh ~/.vim/plugged/cosmic_latte/shell/cosmic_latte_dark.sh
    #eval (dircolors -c ~/.vim/plugged/cosmic_latte/shell/dircolors)
end

source ~/.vim/plugged/cosmic_latte/shell/cosmic_latte_dark.fish

# THEME PURE #
set fish_function_path /Users/tyyiu/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /Users/tyyiu/.config/fish/functions/theme-pure/conf.d/pure.fish

export LC_ALL=en_GB.UTF-8
