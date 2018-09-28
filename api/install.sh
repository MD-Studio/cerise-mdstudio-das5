#!/bin/bash

CERISE_API_FILES="${1}"

# Install share data and miniconda
INSTALL_SCRIPT="$CERISE_API_FILES/mdstudio/bin/install_share.sh"

if [ ! -f $INSTALL_SCRIPT ] ; then
    # Download installation
    SCRIPT="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/master/scripts/install_share.sh"
    wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
    chmod u+x "$CERISE_API_FILES/mdstudio/bin/install_share.sh"
fi
$INSTALL_SCRIPT $CERISE_API_FILES

# GROMACS binaries for DAS5
GROMACS_PATH="$CERISE_API_FILES/mdstudio/gromacs"
if [ ! -d $GROMACS_PATH ]; then
    cd $CERISE_API_FILES/mdstudio
    git clone git://github.com/MD-Studio/cerise-mdstudio-das5.git
    mv cerise-mdstudio-das5/gromacs .
    rm -rf cerise-mdstudio-das5
fi
