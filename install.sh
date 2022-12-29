#Bare-metal install script

#!/bin/bash

sudo apt update -y
sudo apt install -y git-core cmake freeglut3-dev pkg-config build-essential libxmu-dev libxi-dev libusb-1.0-0-dev python3-dev python3-pip

sudo python3 -m pip install numpy cython opencv-python ipykernel

git clone https://github.com/OpenKinect/libfreenect.git /opt/libfreenect

cd /opt/libfreenect

mkdir build

cd /opt/libfreenect/build

cmake .. -DBUILD_PYTHON3=ON -DBUILD_REDIST_PACKAGE=OFF -DPython3_EXACTVERSION=3.8
make
sudo make install
sudo ldconfig /usr/local/lib64/

cd /opt/libfreenect/wrappers/python
sudo python3 setup.py install
