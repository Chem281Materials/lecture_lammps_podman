FROM ubuntu:24.04

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y git \
                       g++ \
                       cmake \
                       python3 && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/lammps/lammps.git && \
    mkdir lammps/build && \
    cd lammps/build && \
    cmake -D PKG_RIGID=yes -D PKG_MOLECULE=yes -D PKG_KSPACE=yes ../cmake && \
    make -j 4


ENV PATH="$PATH:/lammps/build"

COPY entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]

