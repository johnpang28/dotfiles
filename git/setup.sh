#!/bin/sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../config.sh

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -O ~/.zsh/_git
chmod 744 ~/.git-completion.bash
chmod 744 ~/.zsh/_git

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

git config --global user.email "$GITHUB_NAME"
git config --global user.name "$GITHUB:wq_NAME"

# generate gpg passphrase and save to macos keychain - can be retrieved by user
gpg_passphrase=$(pwgen -s -1 24)
security add-generic-password -a ${USER} -s gpg_passhrase -w ${gpg_passphrase}

cat >key-config <<EOF
     %echo Generating a OpenPGP key
     Key-Type: RSA
     Key-Length: 4096
     Name-Real: $GITHUB_USER
     Name-Comment: GPG key for signing git commits
     Name-Email: $GITHUB_EMAIL
     Expire-Date: 2y
     Passphrase: $gpg_passphrase
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF

gpg --batch --generate-key key-config

rm key-config

cat >~/.gnupg/gpg-agent.conf <<EOF
     default-cache-ttl 31560000
     pinentry-program /opt/homebrew/bin/pinentry-tty
EOF

echo "Remember to add gpg key to github account."

signingkey=$(gpg --list-secret-keys --keyid-format=long | awk '/sec/{if (length($2) > 0) print $2}' | sed -e 's#.*/\(\)#\1#')

git config --global commit.gpgsign true
git config --global user.signingkey $signingkey
