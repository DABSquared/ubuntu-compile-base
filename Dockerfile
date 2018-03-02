FROM ubuntu:17.10

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y build-essential \
    locate \
    lm-sensors \
    libcomedi0 \
    libcomedi-dev \
    apache2    \
    git \
    g++ \
    apache2 \
    libclang-dev \
    libcgicc-dev \
    libz-dev \
    autoconf \
    automake \
    default-jdk \
    libboost-all-dev \
    ctags \
    texinfo

RUN mkdir -p /usr/local/share/man/man1 && git clone https://github.com/pjmaker/nana.git && cd nana && autoreconf --install && ./configure && make && make install && cd .. && rm -rf nana