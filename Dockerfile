FROM python:3.7-slim-buster

WORKDIR /root

RUN apt update
RUN apt install -y git make autoconf g++ libfl-dev bison
RUN apt install -y wget
RUN wget http://www.veripool.org/ftp/verilator-4.036.tgz
RUN tar -xzvf verilator-4.036.tgz
WORKDIR /root/verilator-4.036
RUN ./configure
RUN make -j2
RUN make install

RUN pip install py==1.11.0
RUN pip install -U git+https://github.com/tancheng/pymtl3.1@yo-struct-list-fix
RUN pip install --upgrade pip setuptools twine
RUN pip install hypothesis
RUN pip list

RUN apt install -y pkg-config

WORKDIR /root
