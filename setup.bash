#!/bin/bash

echo "Installing nvidia-jetpack"
sudo apt install -y nvidia-jetpack

sudo add-apt-repository -y ppa:deadsnakes/ppa

echo "Installing additional packages"
sudo apt install -y software-properties-common python3-venv \
        libjpeg-dev zlib1g-dev libpython3-dev libopenblas-dev \
        libavcodec-dev libavformat-dev libswscale-dev python3-pip \
        libopenblas-base libopenmpi-dev libomp-dev


echo "Create venv"
python -m venv pytorch_cuda
source pytorch_cuda/bin/activate

echo "Installing PyTorch 2.1.0"
pip3 install 'Cython<3'

if [ -f torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl ]; then
	pip install numpy torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl
else
	wget https://developer.download.nvidia.cn/compute/redist/jp/v512/pytorch/torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl -O torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl
	pip3 install numpy torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl
fi

echo "Installing Torchvision"

if [ -f torchvision-0.16.1-cp38-cp38-linux_aarch64.whl ]; then
        pip install torchvision-0.16.1-cp38-cp38-linux_aarch64.whl
        pip install requests pillow
elif [ -f torchvision/dist/torchvision-0.16.1-cp38-cp38-linux_aarch64.whl ]; then
	pip install ./torchvision/dist/torchvision-0.16.1-cp38-cp38-linux_aarch64.whl
else
        git clone --branch v0.16.1 https://github.com/pytorch/vision torchvision
        cd torchvision
        export BUILD_VERSION=0.16.1
        pip install --upgrade setuptools wheel
        # python setup.py install
	python setup.py bdist_wheel
	pip install ./dist/torchvision-0.16.1-cp38-cp38-linux_aarch64.whl
        cd ../  # attempting to load torchvision from build dir will result in import error
        pip install requests pillow
fi

echo "Succesfully finished creating 'pytorch_cuda' env"
