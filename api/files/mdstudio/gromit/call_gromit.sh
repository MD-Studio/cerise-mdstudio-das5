#!/bin/bash

CERISE_API_FILES="$1"
shift

module load fftw3/openmpi/gcc/64/3.3.4
module load cuda75/blas/7.5.18
module load cuda75/fft/7.5.18
module load cuda75/gdk/352.79
module load cuda75/toolkit/7.5.18
module load openmpi/gcc/64/1.10.1

GMXRC_FILE="$CERISE_API_FILES/mdstudio/gromacs/gromacs-2016.3/bin/GMXRC.bash"
GROMIT="$CERISE_API_FILES/mdstudio/gromit/gromit_mpi.sh"

. $GMXRC_FILE
$GROMIT -gmxrc $GMXRC_FILE $*

