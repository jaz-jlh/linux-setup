# ZSH
plugins=(git history-substring-search zsh-autosuggestions zsh-syntax-highlighting shrink-path)

# GIT
export git_primary_branch='main'
alias gitname='git rev-parse --symbolic-full-name --abbrev-ref HEAD'
alias gits='git status'
alias gitc='git commit -m'
alias gitco='git checkout'
alias gitp='git push origin $(gitname)'
alias gitrbm='gitclean && gitco - && git rebase $git_primary_branch && gitp -f'
alias gitd='git diff --color-words'
alias gitclean='gitco $git_primary_branch && git pull && git prune && git fetch --prune'
alias gitfu='gits && git add . && gits && git commit --amend && gitp -f'
function newbranch {
    git checkout -b $1 && git push --set-upstream origin $1
}
function delbranch {
    git branch -D $1 && git push --delete origin $1
}

# NAVIGATION
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias bbbbb='cd ../../../../..'
alias bbbbbb='cd ../../../../../..'
alias bbbbbbb='cd ../../../../../..'

# META
alias bashrc='vim ~/.zshrc && source ~/.zshrc'

# EDITORS
export EDITOR='vim'
export VISUAL='vim'
