# Daniel Cressman's Dotfiles

This repo contains my personal dotfiles. The idea is that my setup is as portable as possible and I can recreate my preferred development environment quickly on any UNIX-like OS.

## Principles

If you happen to stumble upon this and think that I'm doing something stupid, I probably am! Please let me know so that my life can be made easier :)

### .bashrc Should Contain Shareable Configuration

Since this repo is designed to be cloned to many different systems, no assumptions should be made about what system I am running on or what the setup is. I will plan to add in system-specific conditionals in `.bashrc` on an as-needed basis.

### .bash_profile and .bashrc_local Are For Non-Shareable Configuration

My current assumption is that everything I need shared can be done in `.bashrc`. Then, anything system-specific (like configuration scripts that need to automatically run from installed programs, or updating PATH with weird install locations) can be done in `.bash_profile` (because this is used as a default on MacOS) or `.bashrc_local` (just a personal convention in case `.bash_profile` seems like a bad choice, since this will be run even in non-login shells).

## Cloning To New System

Steps based on [https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) and [https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/).

### 1. Clone the repo

The `--bare` flag is needed to facilitate "cloning" into a directory that already has files (i.e. my home directory), since you can't run `git clone` into a directory that is not empty. However, this results in additional setup steps.

```bash
git clone --bare https://github.com/danielcressman/dotfiles ~/.dotfiles
```

### 2. Set up the alias to work with the repo for this shell session
```bash
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### 3. Reconfigure the repository to work like normal

Since a bare repository is missing some normal features, let's set them back up

```bash
dot config --local branch.master.remote origin
dot config --local remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
dot branch --set-upstream-to=origin/master master
```

#### 3a. Extra QOL things

Since this is designed to be cloned into my home directory, ignore any files that aren't explicitly added. And then `.tmux.conf` is a base config, but future changes should be ignored, since all common stuff goes in .tmux.conf.common, so do that.

```bash
dot config --local status.showUntrackedFiles no
dot update-index --assume-unchanged .tmux.conf
```

### 4. Checkout the repo in the home directory

```bash
dot checkout
```
If you get the following error:
```text
error: The following untracked working tree files would be overwritten by checkout:
	.bashrc
Please move or remove them before you switch branches.
```
then that means that there's a conflict with an existing `.bashrc` file (or whichever the error message specifies).

In the case of a `.bashrc` conflict, my default approach will be to copy the existing `.bashrc` to `.bashrc_preexisting`, which is included at the top in `.bashrc` if it exists. However, case-by-case adjustments may be needed.

### All Done!

## Bonus Steps

### Install vim plugins

Instructions from [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug).

Install `vim-plug`:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Then open vim and run `:PlugInstall` and you're done!

