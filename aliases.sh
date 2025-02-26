# Remove local branches that upstreams are gone.
alias gdel="git branch -v | grep gone | awk '{print \$1}' | xargs git branch -D"
# A well-known `diff` command, but shows diff word-by-word.
alias wdiff="git diff -U0 --word-diff --no-index --"
