# Remove local branches that upstreams are gone.
alias gdel="git branch -v | grep gone | awk '{print \$1}' | xargs git branch -D"
# Show git diff word-by-word.
alias gwdiff="git diff -U0 --word-diff --no-index --"
