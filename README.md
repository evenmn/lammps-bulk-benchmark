# Molecular dynamics bulk benchmarks
We run molecular dynamics simulations of bulks using LAMMPS to benchmark the simulation times on various CPUs and GPUs. Also, the computational performance of different force-fields might be compared.

Below, we present the number of timesteps per seconds for the various simulations and for various devices. All simulations were run in the micro-canonical ensemble (NVE), but the number of particles in the simulations vary.


| CPU                   | Computer  | Cores | Freq.   | LJ       | SW       | TIP4P  | SiC | SiO2  |
|-----------------------|-----------|-------|---------|----------|----------|--------|-----|-------|
| Intel Core i7-4500U   | Maxwell   | 4     | 1.80GHz | 357.790  |  14.694  |  2.701 |     | 0.055 |
| Intel Xeon E5-2620    | Bigfacet  | 16    | 2.10GHz |          |          |        |     |       |
| Intel Xeon E5-2683    | Fram      | 16    | 2.10GHz |          |          |        |     |       |
| Intel Xeon E5-2670    | Egil      | 16    | 2.60GHz |          |          |        |     |       |
| Intel Xeon W-2295     | Rahman    | 18    | 3.00GHz | 3134.155 | 225.875  | 34.796 |     | 0.666 |
| AMD EPYC 7252         | Hugefacet | 8     | 3.10GHz | 2082.737 | 119.200  | 20.081 |     |       |

| GPU                   | Computer  | Cores | Freq.   | LJ       | SW       | TIP4P  | SiC | SiO2  |
|-----------------------|-----------|-------|---------|----------|----------|--------|-----|-------|
| Nvidia RTX 2070 Super | Rahman    | 2560  | 1.60GHz |          |          |        |     |       |
| Nvidia P100 Pascal    | Bigfacet  | 3584  | 1.20GHz | 1604.503 |  925.301 |   -    |     | 3.013 |
| Nvidia A100 Ampere    | Hugefacet | 8192  | 1.40GHz | 2180.423 | 2070.548 |   -    |     | 14.647|

## Simulations

The different bulk simulations were chosen to spawn out the force-field space. The Lennard-Jones potential is a two-body potential. The TIP4P is a partly bonded force-field. Stillinger-Weber and Vashishta are non-bonded three-body potentials.

#### Lennard-Jones (Ar)
We simulate Lennard-Jonesium (e.g. Argon) using the Lennard-Jones potential, as first suggested by [A. Rahman][1] . 
In the Lennard-Jones simulation, we have 2916 argon atoms.

#### Stillinger-Weber (Si)
In the Stillinger-Weber simulations, there are 64000 silicon atoms.

#### TIP4P/2005 (H2O)
In the TIP4P, there are 6000 water molecules (24000 particles).

#### Vashishta (SiC)

#### Vashishta (SiO2)

## Devices
The devices were not, by any rule, picked cleverly and they do not spawn out the device space in any possible way. In fact, the devices presented here are just the ones that were available for me when doing the comparison.

## References
[1]: [A. Rahman, Phys. Rev. 136, A 405 (1964)](https://journals.aps.org/pr/abstract/10.1103/PhysRev.136.A405)
