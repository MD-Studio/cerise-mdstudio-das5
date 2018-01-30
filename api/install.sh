#!/bin/bash

CERISE_API_FILES="${1}"
CERISE_DATA="cerise-mdstudio-share-data"

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
GROMACS_PATH="$CERISE_API_FILES/mdstudio/gromacs/gromacs-2016.4"
if [ ! -d $GROMACS_PATH ]; then
    cd $CERISE_API_FILES/mdstudio
    git clone git://github.com/MD-Studio/cerise-mdstudio-das5.git
    # mv cerise-mdstudio-das5/gromacs .
    # rm -rf cerise-mdstudio-das5
fi

# Define PATH to gromacs in DAS
GMXRC_MDSTUDIO="$GROMACS_PATH/scripts/GMXRC.bash"

# ADD ENV variable if it is not already there
pred=$(grep -m 1 'GMXRC_MDSTUDIO' ~/.bashrc)
if [[ -z $pred ]]; then
    echo >>~/.bashrc
    echo '# Added by cerise-mdstudio, sorry!' >>~/.bashrc
    echo 'module load openmpi/gcc/64/1.8.1 cuda90/toolkit/9.0.176'
    echo 'export GMXRC_MDSTUDIO=$GMXRC_MDSTUDIO' >>~/.bashrc
    echo '# End cerise-mdstudio additions' >>~/.bashrc    
fi
