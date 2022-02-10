#!/usr/bin/env bash

main_branch=origin/master

for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  diverge=$(git log "$main_branch".."$branch")
  if [ -z "$diverge" ]; then
    git branch -d "$branch"
  else
    echo "$branch" has diverged
  fi
done
