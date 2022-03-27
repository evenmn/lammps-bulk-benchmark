#!/bin/bash -l
  
#SBATCH --job-name=test
#
#SBATCH --partition=normal
#
#SBATCH --ntasks=1
#
#SBATCH --cpus-per-task=2
#
#SBATCH --gres=gpu:1
#
#SBATCH --array=1-10

mpirun -n 1 lmp_test -pk kokkos newton on neigh full -k on g 1 -sf kk -in in.lammps
