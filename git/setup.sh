#!/bin/sh

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -P ~/.zsh
chmod 744 ~/.zsh/git-completion.zsh

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

echo "Git name:"
read name

echo "Git email:"
read email

git config --global user.email $email
git config --global user.name $name