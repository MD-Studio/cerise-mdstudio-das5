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

SCRIPT="https://raw.githubusercontent.com/MD-Studio/MDStudio/prototype/components/lie_md/lie_md/scripts/getEnergies.py"
wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
chmod u+x "$CERISE_API_FILES/mdstudio/bin/getEnergies.py"
pip install panedr --user
