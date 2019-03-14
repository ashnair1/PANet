FROM nvcr.io/nvidia/pytorch:18.07-py3
MAINTAINER Ashwin Nair

RUN apt-get update && apt-get install -y --no-install-recommends

RUN pip --no-cache-dir install \
	Cython

RUN pip install --upgrade pip
COPY dl_requirements.txt /tmp/

RUN pip install --no-cache-dir -r /tmp/dl_requirements.txt

ADD configs /workspace/PANet/configs
ADD demo /workspace/PANet/demo
ADD data /workspace/PANet/data
ADD lib /workspace/PANet/lib
ADD tools /workspace/PANet/tools 
ADD README.md /workspace/PANet/


WORKDIR /workspace/PANet
RUN ["/bin/bash"]
