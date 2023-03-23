#!/bin/bash
#SBATCH --job-name=serial_job_test   # Job name
#SBATCH --mail-type=END,FAIL         # Mail Events (NONE,BEGIN,FAIL,END,ALL)
#SBATCH --mail-user=sat.tamu@tamu.edu   # Replace with your email address
#SBATCH --ntasks=1                   # Run on a single CPU
#SBATCH --time=12:00:00              # Time limit hh:mm:ss
#SBATCH --output=serial_test_%j.log  # Standard output and error log
#SBATCH --partition=non-gpu          # This job does not use a GPU

echo "Running libquantum trace" 
./run_champsim.sh bin/perceptron-no-ip_stride-no-ship-1core 100 500 traces/462.libquantum-714B.champsimtrace.xz > ipstride_libquantum.txt
 
echo "Running GCC trace" 
./run_champsim.sh bin/perceptron-no-ip_stride-no-ship-1core 100 500 traces/602.gcc_s-2226B.champsimtrace.xz > ipstride_gcctrace.txt

echo "Running MCF trace" 
./run_champsim.sh bin/perceptron-no-ip_stride-no-ship-1core 100 500 traces/605.mcf_s-1644B.champsimtrace.xz > ipstride_mcftrace.txt

echo "Running Leslie-3D trace" 
./run_champsim.sh bin/perceptron-no-ip_stride-no-ship-1core 100 500 traces/437.leslie3d-134B.champsimtrace.xz > ipstride_leslie3D.txt
