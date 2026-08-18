#!/bin/bash
podman run --rm -v $(pwd):/input msse/lammps -in lammps.in
