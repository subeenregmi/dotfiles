# HEDGEHOG 2.0
# By Subeen Regmi!

R=$fg_no_bold[red]       # Red for untracked/unstaged changes
NEON_YELLOW="%F{11}"     # Neon Yellow for staged changes
LIME_GREEN="%F{10}"      # Lime Green for a clean working tree
WHITE='%{%F{#dcdcdc}%}'
RESET=$reset_color       # Reset color

local return_side="%(?..%{$R%}%? %{$RESET%})"

function gitStatusF() {
    local ref user repo branchColor untracked diff_cached diff_unstaged url

    ref=$(git symbolic-ref HEAD 2>/dev/null) || return

    url=$(git config --get remote.origin.url) || return
    user=$(echo "$url" | cut -d'/' -f4)
    repo=$(basename "$url" .git)

    untracked=$(git ls-files --others --exclude-standard)
    diff_cached=$(git diff --cached)
    diff_unstaged=$(git diff)

    if [[ -n $untracked ]]; then
        branchColor=$R
    elif [[ -n $diff_cached ]]; then
        branchColor=$NEON_YELLOW
    elif [[ -z $diff_unstaged ]]; then
        branchColor=$LIME_GREEN
    else
        branchColor=$R
    fi

    echo "(%B%{$branchColor%}${ref#refs/heads/}%{$RESET%}@${user}/${repo}%b%{$RESET%}) "
}

PROMPT='%B%~%b $(gitStatusF)%{$B%}> %{$WHITE%}'
RPS1="${return_side}"

