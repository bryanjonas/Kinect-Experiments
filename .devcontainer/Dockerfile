FROM mcr.microsoft.com/vscode/devcontainers/python:3.8

RUN apt update -y && \
    apt install -y git

RUN git config --global --add safe.directory /workspaces/Kinect-Experiments

RUN git config --global user.email "bryan@crashbang.dev" && \
    git config --global user.name "Bryan Jonas"

RUN apt update -y && \
    apt install -y git-core cmake freeglut3-dev pkg-config build-essential libxmu-dev libxi-dev libusb-1.0-0-dev python3-dev python3-pip

RUN python3 -m pip install numpy cython opencv-python ipykernel matplotlib

RUN git clone https://github.com/OpenKinect/libfreenect.git /libfreenect

WORKDIR /libfreenect

RUN mkdir build

WORKDIR /libfreenect/build

RUN cmake .. -DBUILD_PYTHON3=ON -DBUILD_REDIST_PACKAGE=OFF -DPython3_EXACTVERSION=3.8 && \
    make && \
    make install && \
    ldconfig /usr/local/lib64/

WORKDIR /libfreenect/wrappers/python

RUN python3 setup.py install

COPY ./51-kinect.rules /etc/udev/rules.d/