''
eval "$(/opt/homebrew/bin/brew shellenv)"
setopt HIST_FIND_NO_DUPS
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export PATH=$HOME/go/bin:$PATH
rfz() {
    rg -l "$@" | fzf --preview "rg -C2 -p \"$@\" {}"
}
''
