#!/bin/sh
DOT_DIRECTORY=$(pwd)

for f in .??*
do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = "initialize.sh" ]] && continue
    [[ ${f} = "vim" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

exec $SHELL
