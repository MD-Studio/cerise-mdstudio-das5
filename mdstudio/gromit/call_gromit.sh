#!/bin/bash

CERISE_API_FILES="$1"
PROTEIN_PDB="$2"
PROTEIN_TOP="$3"
PROTEIN_ITP="$4"
LIGAND_PDB="$5"
LIGAND_TOP="$6"
LIGAND_ITP="$7"
INCLUDE_IPT="$8"
FORCE_FIELD="$9"
SIM_TIME="$10"

module load fftw3/openmpi/gcc/64/3.3.4
module load cuda75/blas/7.5.18
module load cuda75/fft/7.5.18
module load cuda75/gdk/352.79
module load cuda75/toolkit/7.5.18
module load openmpi/gcc/64/1.10.1
module load python/2.7.13

GMXRC_FILE="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromacs/gromacs-2016.3/bin/GMXRC.bash"
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromit/gromit_mpi.sh"
ENERGIES="$CERISE_API_FILES/mdstudio/getEnergies.py"

. $GMXRC_FILE
$GROMIT -gmxrc $GMXRC_FILE -vsite -np 8 -f $PROTEIN_PDB -top $PROTEIN_TOP -l $LIGAND_PDB,$LIGAND_TOP -ff $FORCE_FIELD -time $SIM_TIME

python $ENERGIES -ene
