# ZSH
plugins=(git history-substring-search zsh-autosuggestions zsh-syntax-highlighting shrink-path)
ZSH_THEME="powerlevel10k/powerlevel10k"

# GIT
function get_default_branch {
    git remote show origin | grep "HEAD branch" | sed 's/.*: //'
}
alias gitname='git rev-parse --symbolic-full-name --abbrev-ref HEAD'
alias gits='git status'
alias gitc='git commit -m'
alias gitco='git checkout'
compdef gitco='git checkout' # Enable tab completion for git checkout
alias gitp='git push origin $(gitname)'
alias gitrbm='gitclean && gitco - && git rebase $(get_default_branch) && gitp -f'
alias gitd='git diff --color-words'
alias gitclean='gitco $(get_default_branch) && git pull && git prune && git fetch --prune && cleanbranches'
alias gitfu='gits && git add . && gits && git commit --amend && gitp -f'
function newbranch {
    git checkout -b $1 && git push --set-upstream origin $1
}
function delbranch {
    git branch -D $1 && git push --delete origin $1
}
# Cleanup local branches that have been deleted from remote
# Skips worktree branches (with + sign)
alias cleanbranches='git branch -vv | grep ": gone]" | grep -v "^+" | awk "{print \$1}" | xargs git branch -D'

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
