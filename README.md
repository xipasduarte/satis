# Satis setup on GitHub Pages

This is my implementation of a private Satis Composer repository. It allows me to access all my private packages without having to reference too many Git repositories or buying something way too expensive for personal things ;)

*Note:* You should not use a custom domain for your satis on GitHub Pages, as this will make the HTTPS option unavailable. Composer's latest version require repositories to be safe (which is a good thing) and you shouldn't go out of your way to make it any different. If you want a custom domain just deploy somewhere else.

## How does it work?

Simple, actually. There are 3 parts to it:

1. The `composer/satis` package delivers Satis so that the static `composer` repository can be generated ([learn more][1]).
2. The `satis.json` file has all of my private repository links (if this information is too sensitive for you to display, maybe this isn't the thing for you, try [Private Packagist][2]).
3. A deploy script, triggered by `composer` ([say woot!?][3]), to make things go to the `gh-pages` branch of this repo, ultimately resulting in our final goal.

[1]: https://getcomposer.org/doc/articles/handling-private-packages-with-satis.md#satis
[2]: https://packagist.com/
[3]: https://getcomposer.org/doc/articles/scripts.md#scripts

## Usage

There are two scripts, triggered via `composer run-script <name>`:

- `build`: If you want to see what the output would be like. This script installs the dependencies and builds your satis static repository on the `public/` folder.
- `deploy`: This triggers the `deploy.sh` script. It's what you would trigger to make deploy, manually or through Continuous Integration, to the `gh-pages` branch of the remote repository to have your Satis hosted on GitHub Pages.
