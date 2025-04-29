#! /bin/python

import torch
import torchvision

print(f"Torch version: {torch.__version__}")
print(f"CUDA version: {torch.version.cuda}")
print(f"Torch CUDA is available: {torch.cuda.is_available()}")
print(f"Torchvision version: {torchvision.__version__}")
