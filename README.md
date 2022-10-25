# LAMMPS bulk benchmarks
We run molecular dynamics simulations of bulks using LAMMPS to benchmark the simulation times on various CPUs and GPUs. Also, the computational performance of different force-fields might be compared.

Below, we present the number of timesteps per seconds for the various simulations and for various devices. All simulations were run in the micro-canonical ensemble (NVE), but the number of particles in the simulations vary.


| CPU                   | Computer  | Cores  | Freq.   | LJ       | SW       | TIP4P  | SiC    | SiO2  |
|-----------------------|-----------|--------|---------|----------|----------|--------|--------|-------|
| Intel Core i7-4500U   | maxwell   | 4      | 1.80GHz | 357.790  |  14.694  |  2.701 |        | 0.055 |
| Intel Xeon E5-2620    | bigfacet  | 16     | 2.10GHz | 1415.721 |  69.960  |        | 1.177  | 0.250 |
| Intel Xeon E5-2670    | egil      | 16     | 2.60GHz | 1580.308 |  65.556  | 13.210 | 1.792  | 0.269 |
| AMD EPYC 7252         | hugefacet | 16     | 3.10GHz | 2011.210 | 117.416  | 19.943 | 1.995  | 0.441 |
| AMD EPYC 7762         | griffith  | 128    | 2.45GHz | 3837.572 |          |        |        | 5.194 |
| Intel Xeon W-2295     | rahman    | 18     | 3.00GHz | 3134.155 | 225.875  | 34.796 | 3.171  | 0.712 |
| Apple Silicon M1      | laptop    | 8      | 3.20GHz | 1001.461 |  75.730  |        |        | 0.399 |

| GPU                   | Computer  | Cores  | Freq.   | LJ       | SW       | TIP4P  | SiC    | SiO2  |
|-----------------------|-----------|--------|---------|----------|----------|--------|--------|-------|
| Nvidia RTX 2070 Super | rahman    | 2,560  | 1.60GHz | 3103.141 |  207.475 |   -    | 4.169  | memerr|
| Nvidia RTX 2080 Super | bioai     | 3,072  | 1.65GHz |          |          |   -    | 4.598  | memerr|
| Nvidia RTX 3090       | analyze   | 10,496 | 1.40GHz | 4360.802 |  363.375 |   -    | 8.576  | 2.165 |
| Nvidia P100-PCIE-16GB | bigfacet  | 3,584  | 1.20GHz | 4257.105 |  432.307 |   -    | 11.359 | 2.487 |
| Nvidia A100-PCIE-40GB | hugefacet | 8,192  | 1.40GHz | 4820.603 |  962.502 |   -    | 53.733 | 11.637 |

## Simulation details
All simulations above were run with the same LAMMPS version (February 17th, 2022) to make them reasonably comparable. LAMMPS was built with the packages granular, KOKKOS, KSPACE, manybody, molecular, python and rigid. For the CPU simulations, the command 

```bash
mpirun -n N lmp -in in.lammps
```
was run on all cores `N` on a node. The simulations on GPU nodes were run with the KOKKOS package:

```bash
mpirun -n 1 lmp -pk kokkos newton on neigh full -k on g 1 -sf kk -in in.lammps
```
Each system was simulated 10 times, and the presented number is an average of the number of timesteps per seconds for these simulations. To see the spread in simulation time, see each respective simulation directory. 

## The different systems
The different bulk systems were chosen to spawn out the force-field space. The Lennard-Jones potential is a two-body potential. The TIP4P is a partly bonded force-field. Stillinger-Weber and Vashishta are non-bonded three-body potentials. We investigate different system sizes to challenge the different devices.

### Lennard-Jones (LJ)
We simulate Lennard-Jonesium (e.g. Argon) using the Lennard-Jones potential, as first suggested by [A. Rahman][1]. Our initial system is a face-centered cube with 2,916 particles, and is simulated at 1197K (10000 steps). See [src/lennardjones/in.lammps](src/lennardjones/in.lammps) for LAMMPS input script.

### Stillinger-Weber (SW)
Silicon is simulated using the Stillinger-Weber potential and the original parameterization by [Stillinger and Weber][2]. The system consists of 64,000 particles initialized in crystal structure and is simulated at 1000K (10000 steps). See [src/stillingerweber/in.lammps](src/stillingerweber/in.lammps) for LAMMPS input script.

### TIP4P/2005 (TIP4P)
Water is simulated using the popular TIP4P potential and the universal parameterization by [Abascal and Vega][3], known as TIP4P/2005. 6,000 water molecules (24,000 particles) are initialized on a grid, and simulated at 300K (1000 steps). See [src/tip4p/in.lammps](src/tip4p/in.lammps) for LAMMPS input script.

### Vashishta (SiC)
We simulate silicon carbide using the Vashishta potential and the parameterization by [Vashishta et. al.][4]. The system is initialized with 2,000,000 particles and simulated at 2000K (1000 steps). See [src/sic/in.lammps](src/sic/in.lammps) for LAMMPS input script.

### Vashishta (SiO2)
Finally, we simulate quartz using the Vashishta potential and the initial parameterization by [Vashishta et al.][5]. The system is initialized with 3,000,000 SiO2 molecules (9,000,000 particles), and simulated at 300K (100 steps). See [src/sio2/in.lammps](src/sio2/in.lammps) for LAMMPS input script.

## Devices
The devices were not, by any rule, picked with care and they do not spawn out the device space in any possible way. In fact, the devices presented here are just the ones that were available when doing the comparison.

## References
[1]: [A. Rahman, Phys. Rev. A, 136, 405 (1964)](https://journals.aps.org/pr/abstract/10.1103/PhysRev.136.A405)  
[2]: [F. H. Stillinger and T. A. Weber, Phys. Rev. B, 31, 5262 (1985)](https://journals.aps.org/prb/abstract/10.1103/PhysRevB.31.5262)  
[3]: [J. L. F. Abascala) and C. Vega, J. Chem. Phys., 123, 234505 (2005)](https://aip.scitation.org/doi/10.1063/1.2121687)
[4]: [P. Vashishta, R. K. Kalia and A. Nakano, J. Appl. Phys., 101, 103515 (2007)](https://aip.scitation.org/doi/10.1063/1.2724570)
[5]: [P. Vashishta, R. K. Kalia and J. P. Rino, Phys. Rev. B, 41, 12197 (1990)](https://journals.aps.org/prb/abstract/10.1103/PhysRevB.41.12197)  

