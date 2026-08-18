#!/bin/bash
podman run --rm -v $(pwd)/input:/input msse/lammps -in lammps.in
