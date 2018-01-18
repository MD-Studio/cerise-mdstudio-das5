#!/bin/bash

CERISE_API_FILES="$1"
CERISE_DATA=cerise-mdstudio-share-data

if [ -d "$CERISE_API_FILES/mdstudio/github/$CERISE_DATA" ] ; then
    cd "$CERISE_API_FILES/mdstudio/github/$CERISE_DATA"
    git pull
else
    mkdir -p "$CERISE_API_FILES/mdstudio/github"
    cd "$CERISE_API_FILES/mdstudio/github"
    git clone https://github.com/MD-Studio/$CERISE_DATA.git
fi

if [ ! -f "$CERISE_API_FILES/mdstudio/energies/getEnergies.py" ] ; then
    SCRIPT="https://raw.githubusercontent.com/MD-Studio/MDStudio/master/components/lie_md/lie_md/scripts/getEnergies.py"
    wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
fi

if [ ! -d "$CERISE_API_FILES/miniconda" ] ; then
    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $CERISE_API_FILES/miniconda
    conda config --set always_yes yes --set changeps1 no --set auto_update_conda False
    source $CERISE_API_FILES/miniconda/bin/activate root
    conda clean --index-cache
    pip install panedr
fi
