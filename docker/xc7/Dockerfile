FROM debian:stable-slim

RUN apt-get update && apt-get install -y --no-install-recommends
RUN apt-get -y install build-essential llvm clang git bison flex autotools-dev \
    cmake default-jre-headless uuid-dev libantlr4-runtime-dev \
    python3-setuptools cython3 python3-pip python3-venv \
    libboost-iostreams-dev libboost-thread-dev libboost-program-options-dev \
    libboost-filesystem-dev libboost-system-dev \
    libboost-python-dev libeigen3-dev \
    python3-intervaltree python3-numpy python3-openpyxl python3-ordered-set \
    python3-parse python3-progressbar2 python3-json5 python3-pytest python3-yaml \
    python3-pytest-runner python3-scipy python3-simplejson python3-sympy python3-yapf \
    libreadline-dev tcl-dev

WORKDIR /fpga
COPY clone.sh /fpga/
COPY build_yosys.sh /fpga/
COPY build_prjxray.sh /fpga/
COPY build_nextpnr.sh /fpga/

# Create a python venv
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
ENV PYTHONPATH=/venv/lib/python3.13
ENV NEXTPNR_XILINX_PYTHON_DIR=/venv/lib/python3.13
ENV PRJXRAY_DB_DIR=/share/nextpnr/prjxray-db

RUN chmod +x clone.sh && ./clone.sh && \
    chmod +x build_yosys.sh && ./build_yosys.sh && \
    chmod +x build_prjxray.sh && ./build_prjxray.sh && \
    chmod +x build_nextpnr.sh && ./build_nextpnr.sh

CMD ["bash"]
