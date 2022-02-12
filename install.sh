#!/bin/bash

if [ $# -ne 1 ]; then
    >&1 echo "usage: $0 DEST_DIRECTORY"
    exit 1
fi

DEST=$1

if [ -e "$DEST" -a ! -d "$DEST" ]; then
    >&1 echo "DEST_DIRECTORY exists, but isn't a directory"
    exit 1
elif [ ! -e "$DEST" ]; then
    mkdir -p "$DEST"
fi


shopt -s dotglob

mkdir -p $DEST/.config/{i3,X11,dunst} $DEST/.local/bin $DEST/Pictures/wallpapers $DEST/.xkb/{keymap,symbols}

cp -rL .config/i3/* $DEST/.config/i3
cp -rL .config/X11/* $DEST/.config/X11
cp -rL .config/dunst/* $DEST/.config/dunst
cp .local/bin/load_kb $DEST/.local/bin/load_kb

cp -rL .xkb/keymap/* $DEST/.xkb/keymap
cp -rL .xkb/symbols/* $DEST/.xkb/symbols
cp Pictures/wallpapers/* $DEST/Pictures/wallpapers

echo -e "Success!\n"
echo "add this line to your ~/.bashrc: \`export PATH=\"\$PATH:$(readlink -f "$DEST")/.local/bin\"\`"
echo "you'll need these packages: i3 i3lock dunst"
