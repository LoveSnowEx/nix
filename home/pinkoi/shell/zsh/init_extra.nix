''
eval "$(/opt/homebrew/bin/brew shellenv)"
export EDITOR=$(which micro)
setopt HIST_FIND_NO_DUPS
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export PATH=$HOME/go/bin:$PATH
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
rfz() {
    rg -l "$@" | fzf --preview "rg -C2 -p \"$@\" {}"
}
''
