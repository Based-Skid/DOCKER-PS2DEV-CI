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
RUN mkdir /tempdir
RUN git clone git://github.com/ps2dev/ps2toolchain.git /tempdir/toolchain && cd /tempdir/toolchain && ./toolchain-sudo.sh
#git clone git://github.com/ps2dev/ps2eth.git /ps2dev/ps2eth \
#&& make -C /ps2dev/ps2eth \
RUN git clone git://github.com/ps2dev/ps2-packer.git /tempdir/ps2-packer
#RUN make install -C /tempdir/ps2-packer 
RUN rm -rf /tempdir
WORKDIR /src
CMD ["/bin/bash"]
