FROM debian:9.6

MAINTAINER Based_Skid <based_sec@protonmail.com>

# ENV TOOLCHAIN_VERSION master

ENV PS2DEV /ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV PATH   $PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin

ENV DEBIAN_FRONTEND noninteractive

#Update Debian

RUN apt-get update && apt-get upgrade -y

# Install Packages

RUN apt-get install -y gcc autoconf bzip2 vim zip make patch git wget nano libjpeg-dev libpng-dev libtiff5-dev libsdl2-image-dev libucl-dev 

WORKDIR /src
CMD ["/bin/bash"]
