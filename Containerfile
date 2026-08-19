FROM docker.io/ubuntu:26.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y git \
                       g++ \
		       python3 \
                       cmake && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/lammps/lammps.git && \
    cd lammps && \
    cmake -S cmake -B build -D PKG_RIGID=yes -D PKG_MOLECULE=yes -D PKG_KSPACE=yes && \
    cmake --build build && \
    rm -rf /lammps/src && \
    rm -rf /lammps/examples && \
    apt-get remove -y git && \
    apt-get remove -y g++ && \
    apt-get remove -y cmake

ENV PATH="$PATH:/lammps/build"

COPY entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]
