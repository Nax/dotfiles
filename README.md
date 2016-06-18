# dotfiles

A dotfile manager, as well as a set of dotfiles.

## Install

Installing the dotfile manager is as simple as running git clone:

    $ git clone https://github.com/Nax/dotfiles.git ~/.dotfiles
    $ export PATH="$HOME/.dotfiles/bin:$PATH"

## Usage

List available dotfile packages:

    $ dotfiles install -l

List installed dotfile packages:

    $ dotfiles install -L

Install a package:

    $ dotfiles install zsh

Install every package:

    $ dotfiles install -a

Remove a package:

    $ dotfiles uninstall zsh

Update dotfiles and packages:

    $ dotfiles update

## License

This program is distributed under the GNU General Public License version 3. (GPLv3)

## Author

These dotfiles were initially created by [Nax](http://github.com/Nax).

