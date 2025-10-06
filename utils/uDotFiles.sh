#!/usr/bin/env bash

# TODO: experiment with adding an argument that not only updates the files but also pushes to the repo

rsync -uL /home/kab/.zshrc /home/kab/Learn/Code/Misc/dot-files
rsync -urL /home/kab/.config/nvim /home/kab/Learn/Code/Misc/dot-files
rsync -urL /home/kab/utils /home/kab/Learn/Code/Misc/dot-files
rsync -urL /home/kab/.config/wezterm /home/kab/Learn/Code/Misc/dot-files

echo "repo files updated successfully"
