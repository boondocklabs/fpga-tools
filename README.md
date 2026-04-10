### FPGA Tools

#### Build XC7 container

Builds the base container with all dependencies, yosys and nextpnr-xilinx from git

```
docker build -t xc7 docker/xc7
```

#### Start the container

This will start the container detached, and commands can be executed within it

```
docker run -dit --name xc7 xc7
```

#### Build blinky demo

The first time the build is run, the chip data will be generated which
can take a few minutes. The chip data will be cached as long as the container
stays running, and will be rebuilt if docker is restarted on the next build.

```
# Build blinky verilog example in the container
docker exec -w /fpga/demo-projects/blinky-stlv7325 xc7 make

# Copy the generated .bit file
docker cp xc7:/fpga/demo-projects/blinky-stlv7325/blinky.bit .

# Program the board using openFPGAloader
openFPGALoader -c digilent_hs2 -b stlv7325 blinky.bit --freq 30000000
```


```
➜  fpga-tools git:(main) ✗ openFPGALoader -c digilent_hs2 -b stlv7325 blinky.bit --freq 30000000

empty
Board default cable overridden with digilent_hs2
Jtag frequency : requested 30.00MHz   -> real 30.00MHz
Open file DONE
Parse file DONE
load program
Load SRAM: [==================================================] 100.00%
Done
Shift IR 35
ir: 1 isc_done 1 isc_ena 0 init 1 done 1
```
