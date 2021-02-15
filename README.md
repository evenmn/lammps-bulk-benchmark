# Molecular dynamics bulk benchmarks
We run molecular dynamics simulations of bulks using LAMMPS to benchmark the simulation times on various CPUs and GPUs. Also, the computational performance of different force-fields might be compared.

Below, we present the number of timesteps per seconds for the various simulations and for various devices. All simulations were run in the micro-canonical ensemble (NVE), but the number of particles in the simulations vary.

|       CPU       | Intel Core i7-4500U | Intel Xeon E5-2620 | Intel Xeon E5-2683 | Intel Xeon E5-2670 | Intel Xeon W-2295 | AMD EPYC 7252 |
|    Computer     | Maxwell             | Bigfacet           | Fram               | Egil               | Rahman            | Hugefacet     |
|      Cores      | 4                   | 16                 | 16                 | 16                 | 18                | 8             |
|     Freq.       | 1.80 GHz            | 2.10 GHz           | 2.10 GHz           | 2.60 GHz           | 3.00 GHz          | 3.10 GHz      |
|-----------------|---------------------|--------------------|--------------------|--------------------|-------------------|---------------|
|     LJ          | 357.790             |                    |                    |                    | 3134.155          | 2082.737      |
|     SW          | 14.694              |                    |                    |                    | 225.875           | 119.200       |
|    TIP4P        | 2.701               |                    |                    |                    | 34.796            | 20.081        |
|    SiC          |                     |                    |                    |                    |                   |               |
|    SiO2         | 0.055               |                    |                    |                    |                   |               |
|    SiO2 (table) | 0.075               |                    |                    |                    |                   |               |

 

| CPU                   | Computer  | Cores | Freq.   | LJ       | SW       | TIP4P  | SiC | SiO2 |
|-----------------------|-----------|-------|---------|----------|----------|--------|-----|------|
| Intel Core i7-4500U   | Maxwell   | 4     | 1.80GHz | 357.790  |  14.694  |  2.701 |     |      |
| Intel Xeon E5-2620    | Bigfacet  | 16    | 2.10GHz |          |          |        |     |      |
| Intel Xeon E5-2683    | Fram      | 16    | 2.10GHz |          |          |        |     |      |
| Intel Xeon E5-2670    | Egil      | 16    | 2.60GHz |          |          |        |     |      |
| Intel Xeon W-2295     | Rahman    | 18    | 3.00GHz | 3134.155 | 225.875  | 34.796 |     |      |
| AMD EPYC 7252         | Hugefacet | 8     | 3.10GHz | 2082.737 | 119.200  | 20.081 |     |      |

| GPU                   | Computer  | Cores | Freq.   | LJ       | SW       | TIP4P  | SiC | SiO2 |
|-----------------------|-----------|-------|---------|----------|----------|--------|-----|------|
| Nvidia RTX 2070 Super | Rahman    | 2560  | 1.60GHz |          |          |        |     |      |
| Nvidia P100 Pascal    | Bigfacet  | 3584  | 1.20GHz | 1604.503 |  925.301 |   -    |     |      |
| Nvidia A100 Ampere    | Hugefacet | 8192  | 1.40GHz | 2180.423 | 2070.548 |   -    |     |      |

## Simulations
The different bulk simulations were chosen to spawn out the force-field space. The Lennard-Jones potential is a two-body potential. The TIP4P is a partly bonded force-field. Stillinger-Weber and Vashishta are non-bonded three-body potentials.

In the Lennard-Jones simulation, we have 2916 argon atoms. In the Stillinger-Weber simulations, there are 64000 silicon atoms. In the TIP4P, there are 6000 water molecules (24000 particles).

## Devices
The devices were not, by any rule, picked cleverly and they do not spawn out the device space in any possible way. In fact, the devices presented here are just the ones that were available for me when doing the comparison.
