#!/bin/sh

# Cleanup (for those who don't use a CI).
rm -rf public

# Clone original repository.
git clone $(git remote get-url origin) public


# Attempt to switch to the deployment branch.
cd public/

# Who am I?
git config user.email "${GIT_USER_EMAIL}"
git config user.name "${GIT_USER_PASSWORD}"

git checkout gh-pages
if [ 0 != $? ]; then
  # Create a new orphan branch to track deployments
  git checkout --orphan gh-pages

  # Everything is being tracked, so remove it
  git rm --cached -r ./

  # Use special ignore for deploy.
  mv .satisignore .gitignore
fi


# Build static `composer` repository with `composer/satis`.
cd ..
composer run-script install-deps
composer run-script build

# Deploy to Github Pages.
cd public/
git add --all
git commit -m "Deploy Satis"
git push -f origin gh-pages

# Cleanup (for those who don't use a CI).
cd ..
rm -rf public
