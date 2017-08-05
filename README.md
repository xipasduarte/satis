# Satis setup on GitHub Pages

This is my implementation of a private Satis Composer repository. It allows me to access all my private packages without having to reference too many Git repositories or buying something way too expensive for personal things ;)

## How does it work?

Simple, actually. There are 3 parts to it:

1. The `composer/satis` package delivers Satis so that the static `composer` repository can be generated.
2. The `satis.json` file has all of my private repository links (if this information is too sensitive for you to display, maybe this isn't the thing for you, try [Private Packagist](https://packagist.com/)).
3. A deploy script to make things go to the `gh-pages` branch of this repo, ultimately resulting in our final goal.
