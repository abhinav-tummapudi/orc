#!/bin/bash

# Loading Module
echo "Loading gnu10 & python modules"
module load gnu10
module load python

# Creating & Activating Python Virtual Environments
echo "Creating Virtual Environment Named - workshop-env"
python -m venv workshop-env

# Activate the environment
source workshop-env/bin/activate

# Adding Python Virtual Environment To Jupyter Kernel
echo "Installing ipykernel to the environment"
pip install ipykernel

echo "Adding the kernel to Jupyter"
python -m ipykernel install --user --name=workshop-kernel --display-name "Python (workshop-env)"

echo "Setup complete!"
