# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias la='ls -la'
alias ll='ls -l'

alias pacu='sudo pacman -Syyuu && sudo pamac update'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -R'

alias migrate='php artisan migrate:fresh'
alias mig='php artisan migrate:fresh && php artisan db:seed --class=BaseSeeder'
alias artisan='php artisan'
alias tinker='php artisan tinker'
alias test='php artisan test --env=testing'
alias pest='./vendor/bin/pest'
alias dusk='php artisan pest:dusk'
alias q:work='php artisan queue:work'
alias q:clear='php artisan queue:clear'
alias log='cat /dev/null > storage/logs/laravel.log && cat /dev/null > storage/logs/admin.log'

alias status='git status'
alias fetch='git fetch --prune'
alias add='git add .'
alias commit='git commit'
alias push='git push'
alias pull='git pull'
alias checkout='git checkout'
alias merge='git merge'
alias delete='git branch -d'
alias lastcom='git show'

alias nviminit='nvim ~/.config/nvim/init.vim'
alias ssh='kitty +kitten ssh'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
