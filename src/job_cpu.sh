#!/bin/bash
#SBATCH --job-name=cpu
#SBATCH --partition=normal
#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --array=1-10

mpirun lmp_test -in in.lammps
