#/bin/bash

cd input

# hard-coded lammps execution commands
#lmp -in lammps.in

# calls lammps with user-provided options
lmp "$@"
