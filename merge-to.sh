#!/bin/bash

# get current branch
branch=$(git symbolic-ref -q HEAD)
branch=${branch##refs/heads/}
branch=${branch:-HEAD}

merge_branch=$1

echo "Merge $branch to $merge_branch:"

#todo handle forgotten merge branch parameter

git checkout $merge_branch
git merge $branch
# todo handle conflicts
git push
git checkout $branch

echo "Done."
