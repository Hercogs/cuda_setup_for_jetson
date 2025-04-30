
# cuda_setup_for_jetson

This repo allows to easily install PyTorch with CUDA support. 

Requirements:

    - Jetpack 5.1.5 (might work on other versions as well)
    - Ubuntu 22.04
    - Jetson AGX Orin (tested)

## Setup

1. Clone the repo:
```
git clone git@github.com:Hercogs/cuda_setup_for_jetson.git
cd cuda_setup_for_jetson
``` 

1. Execute device initialization script: `source init.bash`.  Device is going to restart. 

2. Execute device setup script: `source setup.bash`

3. Execute test script: `python test_cuda_torchvision.py`.
Expected output:
```Torch version: 2.1.0a0+41361538.nv23.06
CUDA version: 11.4
Torch CUDA is available: True
Torchvision version: 0.16.1
```

4. To deactivate python venv, execute: `deactivate`. To activate again, execute: `source pytorch_cuda/bin/activate`. To move venv, use `virtualenv-clone`.

5. To install custom packages, first execute `pip install --upgrade pip wheel`. Then execute `pip install -r requirements.txt --no-cache`. This example file contains libs from yoloV5 and sahi.




