#!/bin/sh

create_gitconfig () {
    cp .gitconfig_template .gitconfig
    local GPG_PATH=$(which gpg)
    if [ ! $GPG_PATH ]; then return; fi
    local SINGING_KEY=$(gpg --keyid-format SHORT --list-keys | grep rsa4096 | awk {'print $2'} | cut -d/ -f2)
    if [ ! $SINGING_KEY ]; then return; fi
    git config --file .gitconfig user.signingkey $SINGING_KEY
    git config --file .gitconfig commit.gpgsign true
    git config --file .gitconfig gpg.program $GPG_PATH
}

dotfiles() {
    find . -type f \
        -not -path "./.git/*" \
        -a -not -name "README.md" \
        -a -not -name "setup.sh" \
        -a -not -name ".gitconfig_template" \
        -a -not -name ".gitignore"
}

yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

confirmation() {
    echo "$1 (y/n) "
    read -r -n 1
    printf "\n"
}

create_symlink () {
    local dotfile=$1

    if [[ -e "$HOME/$dotfile" ]]; then
        echo "Can't create symlink for $dotfile, file already exists."
        confirmation "Do you want to overwrite $dotfile?"
        if yes; then
            cp -iv $HOME/$dotfile "$HOME/$dotfile.bak"
            rm -i $HOME/$dotfile
        else
            return
        fi
    fi

    echo "Creating symlink for $dotfile"
    ln -s "$PWD/${dotfile}" "$HOME/$dotfile"
}

main () {
    create_gitconfig;
    for file in $(dotfiles); do
        create_symlink "${file#./}"
    done
}

main
