#!/bin/sh

git clone $(git remote get-url origin) public
cd public/
git checkout --orphan gh-pages
git rm --cached -r .
mv .satisignore .gitignore
cd ..

composer install
satis build satis.json public --no-interaction

cd public/
git add --all
git commit -m "Deploy Satis"
git push -f origin gh-pages
cd ..
rm -rf public
