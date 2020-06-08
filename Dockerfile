# amazonlinx 1 base image
FROM amazonlinux:2018.03

# setting the user
USER root

WORKDIR /build

# Install deps required
RUN yum update -y
RUN yum groupinstall -y "Development Tools"
RUN yum install git wget -y

# Install minimum version of cmake required
# because yum provides just 2.8 and minimum 3.12 required
RUN wget https://cmake.org/files/v3.12/cmake-3.12.0.tar.gz
RUN tar -xvzf cmake-3.12.0.tar.gz && cd cmake-3.12.0 && ./bootstrap && make && make install

# Clone assimp
RUN git clone https://github.com/assimp/assimp.git

# Build assimp
RUN cd assimp && cmake CMakeLists.txt -DBUILD_SHARED_LIBS=OFF -DASSIMP_BUILD_TESTS=OFF && make -j4

RUN zip ../bin.zip ./assimp/bin/*
