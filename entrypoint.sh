#!/bin/bash -l

BASE_BRANCH=$1
RESET_BRANCH=$2

if [[ -z "${BASE_BRANCH}" ]]; then
  echo "Missing \$BASE_BRANCH"
  exit 1
fi

if [[ -z "${RESET_BRANCH}" ]]; then
  echo "Missing \$RESET_BRANCH"
  exit 1
fi

echo "BASE_BRANCH=${BASE_BRANCH}"
echo "RESET_BRANCH=${RESET_BRANCH}"


mkdir _tmp && cd _tmp
git init

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git remote add origin "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git fetch

git checkout $RESET_BRANCH

git reset --hard $BASE_BRANCH

git push --force origin $RESET_BRANCH
