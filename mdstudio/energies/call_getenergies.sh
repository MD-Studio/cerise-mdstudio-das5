#!/bin/bash

CERISE_API_FILES="$1"
PATH_EDR="$2"

source $CERISE_API_FILES/miniconda/bin/acitvate root
python $CERISE_API_FILES/mdstudio/energies/getEnergies.py energy -edr $PATH_EDR
