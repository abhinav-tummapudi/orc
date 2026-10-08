#!/bin/bash

# 1. Download Miniforge
echo "Downloading Miniforge..."
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

# 2. Install Miniforge in batch mode (-b) to the specified path (-p)
echo "Installing Miniforge..."
bash Miniforge3-Linux-x86_64.sh -b -p "$HOME/miniforge"

# 3. Source the base Miniforge environment
echo "Activating base Miniforge environment..."
source "$HOME/miniforge/bin/activate"

# 4. Create the PyTorch environment
echo "Creating PyTorch environment (torch-env)..."
conda create --name torch-env pytorch torchvision pytorch-cuda=12.1 -c pytorch -c nvidia -y

# 5. Activate the new environment (using source for shell script compatibility)
echo "Activating torch-env..."
source "$HOME/miniforge/bin/activate" torch-env

# 6. Install line_profiler
echo "Installing line_profiler..."
conda install line_profiler --channel conda-forge -y

# 7. Cleanup the installer (Optional, but good practice)
echo "Cleaning up the installer file..."
rm Miniforge3-Linux-x86_64.sh

echo "Setup complete!"
