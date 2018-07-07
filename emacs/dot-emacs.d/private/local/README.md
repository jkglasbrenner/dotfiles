# Private directory for local packages

The content of this directory is ignored by Git.

This is the place to store the local packages that you define in
the `dotspacemacs-additional-packages` variable of your dotfile.

## Installing local packages on Github using `git subtree`

Emacs packages not available through MELPA but that are available on Github can be installed using `git subtree`. To download and install a Github package `username/repo` in this way, run the following from the root of the dotfiles repo:

```bash
git remote add username/repo git@github.com:username/repo.git
git subtree add --prefix=emacs/dot-emacs.d/private/local/repo --squash username/repo master
```

This will download, install, and commit the repo as a subfolder in `prefix`. The committing is automatic, so you only need to run `git push` to complete the process.

## Getting updates to a local package managed with `git subtree`

If you've cloned the dotfiles repo on another machine (or re-cloned on the same machine) after installing a local package with `git subtree`, you will need to first re-add the package repo to your list of remote locations:

```bash
git remote add username/repo git@github.com:username/repo.git
```

To pull in any updates, you then run the following from the dotfiles project root:

```bash
git subtree pull --prefix=emacs/dot-emacs.d/private/local/repo --squash username/repo master
```

Like before, this will automatically create a new commit in the dotfiles history, which you can then upload using `git push`.
