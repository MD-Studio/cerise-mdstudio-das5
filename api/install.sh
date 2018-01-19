#!/bin/bash

CERISE_API_FILES="${1}"
CERISE_DATA="cerise-mdstudio-share-data"

# Install share data and miniconda
SCRIPT="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/master/scripts/install_share.sh"
wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
chmod u+x "$CERISE_API_FILES/mdstudio/bin/install_share.sh"
$CERISE_API_FILES/mdstudio/bin/install_share.sh $CERISE_API_FILES

# Define PATH to gromacs in DAS
GMXRC_MDSTUDIO=$CERISE_API_FILES/mdstudio/github/$CERISE_DATA/mdstudio/gromacs/gromacs-2016.3/bin/GMXRC.bash

# ADD ENV variable if it is not already there
pred=$(grep -m 1 'GMXRC_MDSTUDIO' ~/.bashrc)
if [[ -z $pred ]]; then
    echo >>~/.bashrc
    echo '# Added by cerise-mdstudio, sorry!' >>~/.bashrc
    echo 'export GMXRC_MDSTUDIO=$GMXRC_MDSTUDIO' >>~/.bashrc
    echo '# End cerise-mdstudio additions' >>~/.bashrc    
fi
