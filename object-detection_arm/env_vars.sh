#!/bin/sh

export REPO_PATH=/home/lele/Codes/epos/repository  # Folder for the EPOS repository.
export STORE_PATH=/home/lele/Codes/epos/store  # Folder for TFRecord files and trained models.
export BOP_PATH=/home/lele/Codes/epos/datasets  # Folder for BOP datasets (bop.felk.cvut.cz/datasets).

export TF_DATA_PATH=$STORE_PATH/tf_data  # Folder with TFRecord files.
export TF_MODELS_PATH=$STORE_PATH/tf_models  # Folder with trained EPOS models.

export PYTHONPATH=$REPO_PATH:$PYTHONPATH
export PYTHONPATH=$REPO_PATH/external/bop_renderer/build:$PYTHONPATH
export PYTHONPATH=$REPO_PATH/external/bop_toolkit:$PYTHONPATH
export PYTHONPATH=$REPO_PATH/external/progressive-x/build:$PYTHONPATH
export PYTHONPATH=$REPO_PATH/external/slim:$PYTHONPATH

export LD_LIBRARY_PATH=$REPO_PATH/external/llvm/lib:$LD_LIBRARY_PATH


