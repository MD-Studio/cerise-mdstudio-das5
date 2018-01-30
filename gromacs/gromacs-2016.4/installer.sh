#!/bin/bash

#SBATCH -N 1
#SBATCH -J compiler
##SBATCH -C TitanX
##SBATCH --gres=gpu:1

module load openmpi/gcc/64/1.8.1
module load cuda90/toolkit/9.0.176
# module load cuda90/blas/9.0.176

CC=/cm/local/apps/gcc/6.3.0/bin/gcc
CPP=/cm/local/apps/gcc/6.3.0/bin/g++

cmake .. -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_MPI=on -DGMX_GPU=on -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CPP -DGMX_BUILD_OWN_FFTW=ON
make
make check
