#!/bin/bash

CERISE_API_FILES="$1"
PATH_EDR="$2"

source $CERISE_API_FILES/miniconda/bin/activate root
$CERISE_API_FILES/miniconda/bin/python2.7 $CERISE_API_FILES/mdstudio/bin/getEnergies.py energy -edr $PATH_EDR -o energy.ene
