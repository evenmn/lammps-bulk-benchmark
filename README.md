# Molecular dynamics bulk benchmarks
We run molecular dynamics simulations of bulks using LAMMPS to benchmark the simulation times on various CPUs and GPUs. Also, the computational performance of different force-fields might be compared.

Below, we present the number of timesteps per seconds for the various simulations and for various devices. All simulations were run in the micro-canonical ensemble (NVE), but the number of particles in the simulations vary.

| CPU                   | Cores | Freq.   | LJ       | SW      | TIP4P  | SiC | SiO2 |
|-----------------------|-------|---------|----------|---------|--------|-----|------|
| Intel Xeon W-2295     | 18    | 3.00GHz | 3134.155 | 225.875 | 34.796 |     |      |
| Intel Core i7-4500U   | 4     | 1.80GHz |          |         |        |     |      |
| Intel Xeon E5-2670    | 16    | 2.60GHz |          |         |        |     |      |
| Intel Xeon E5-2683    | 16    | 2.10GHz |          |         |        |     |      |

| GPU                   | Cores | Freq.   | LJ       | SW      | TIP4P  | SiC | SiO2 |
|-----------------------|-------|---------|----------|---------|--------|-----|------|
| Nvidia RTX 2070 Super | 2560  | 1.60GHz |          |         |        |     |      |
| Nvidia P100 Pascal    | 3584  | 1.20GHz |          |         |        |     |      |
| Nvidia A100 Ampere    | 8192  | 1.40GHz |          |         |        |     |      |

## Simulations
The different bulk simulations were chosen to spawn out the force-field space. The Lennard-Jones potential is a two-body potential. The TIP4P is a partly bonded force-field. Stillinger-Weber and Vashishta are non-bonded three-body potentials. 

In the Lennard-Jones simulation, we have 2916 argon atoms. In the Stillinger-Weber simulations, there are 64000 silicon atoms. In the TIP4P, there are 6000 water molecules (24000 particles).

## Devices
The devices were not, by any rule, picked cleverly and they do not spawn out the device space in any possible way. In fact, the devices presented here are just the ones that were available for me when doing the comparison.
