#!/bin/bash

VERSION=master

# CERISE_API_FILES="${1}"

# Run base install
$CERISE_PROJECT_FILES/install_base.sh

# Set up GROMACS binaries for DAS5
cd $CERISE_PROJECT_FILES
git clone git://github.com/MD-Studio/cerise-mdstudio-das5.git
git checkout $VERSION
mv cerise-mdstudio-das5/gromacs .
rm -rf cerise-mdstudio-das5
cp GMXRC.bash gromacs/bin/
