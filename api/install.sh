#!/bin/bash

CERISE_API_FILES="$1"

if [ -d "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5" ] ; then
    cd "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5"
    git pull
else
    mkdir -p "$CERISE_API_FILES/mdstudio/github"
    cd "$CERISE_API_FILES/mdstudio/github"
    git clone https://github.com/MD-Studio/cerise-mdstudio-das5.git
    cd "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5"
    git checkout develop
fi

