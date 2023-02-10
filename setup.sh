#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

exec "${SCRIPTPATH}/bin/dotfiles" install -a
