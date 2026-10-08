#!/bin/bash
#SBATCH --job-name=mnist-workshop         # create a short name for your job
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=8G                 # total memory per node (4 GB per cpu-core is default)
#SBATCH --gres=gpu:A100.80gb:1   # number of gpus per node
#SBATCH --time=00:05:00          # total run time limit (HH:MM:SS)
#SBATCH --output=%x-%N-%j.out    # Output File
#SBATCH --error=%x-%N-%j.err     # Error File 
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends

# which gpu node was used
echo "Running on host" $(hostname)

# INVOKING THE MINIFORGE ENVIRONMENT
source $HOME/miniforge/bin/activate

# ACTIVATING THE CONDA ENVIRONMENT
conda activate torch-env

## RUNNING MNIST
python mnist_basic.py --epochs=3

## PROFILING - SINGLE CPU
#kernprof -o ${SLURM_JOBID}.lprof -l mnist_classify.py --epochs=3

## PROFILING - DISTRIBUTED PROCESSING (MULTI CPU)
# kernprof -o ${SLURM_JOBID}.lprof -l mnist_classify_mcpus.py --epochs=3
