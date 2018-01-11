#!/bin/bash

CERISE_API_FILES="$1"
PROTEIN_PDB="$2"
PROTEIN_TOP="$3"
LIGAND_PDB="$4"
LIGAND_TOP="$5"
FORCEFIELD="$6"
PERIODIC_DISTANCE="$7"
PRESSURE="$8"
PRFC="$9"
PTAU="${10}"
RESOLUTION="${11}"
SALINITY="${12}"
SIM_TIME="${13}"
SOLVENT="${14}"
TEMPERATURE="${15}"
TTAU="${16}"


# Function to evalute if a string is true or false
module load fftw3/openmpi/gcc/64/3.3.4
module load cuda75/blas/7.5.18
module load cuda75/fft/7.5.18
module load cuda75/gdk/352.79
module load cuda75/toolkit/7.5.18
module load openmpi/gcc/64/1.10.1

source $CERISE_API_FILES/miniconda/bin/activate root

GMXRC_FILE="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromacs/gromacs-2016.3/bin/GMXRC.bash"
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromit/gromit_mpi.sh"

. $GMXRC_FILE
$GROMIT -gmxrc $GMXRC_FILE -np 8 -f $PROTEIN_PDB -top $PROTEIN_TOP -l $LIGAND_PDB,$LIGAND_TOP \
	-ff $FORCEFIELD -d $PERIODIC_DISTANCE -p $PRESSURE -prfc $PRFC -ptau $PTAU \
	-at $RESOLUTION -conc $SALINITY -time $SIM_TIME -solvent $SOLVENT \
	-t $TEMPERATURE -ttau $TTAU  -vsite -lie
