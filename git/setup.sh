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

git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_NAME"

# generate gpg passphrase and save to macos keychain
gpg_passphrase=$(pwgen -s -1 24)

cat >key-config <<EOF
     %echo Generating a OpenPGP key
     Key-Type: RSA
     Key-Length: 4096
     Name-Real: $GITHUB_NAME
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
     default-cache-ttl 86400
     pinentry-program /opt/homebrew/bin/pinentry-mac
EOF

gpg-connect-agent reloadagent /bye

signingkey=$(gpg --list-secret-keys --keyid-format=long | awk '/sec/{if (length($2) > 0) print $2}' | sed -e 's#.*/\(\)#\1#')
keygrip=$(gpg --list-secret-keys --with-keygrip | grep Keygrip | awk '{print $3}')
security add-generic-password -a ${keygrip} -s GnuPG -w ${gpg_passphrase} -l "GPG passphrase $GITHUB_EMAIL" -T /opt/homebrew/bin/pinentry-mac

git config --global commit.gpgsign true
git config --global user.signingkey $signingkey

echo "Remember to add gpg public key to github account:"

gpg --armor --export $signingkey

