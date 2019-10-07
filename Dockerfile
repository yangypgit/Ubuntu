# ubuntu-1804
# FROM scratch
FROM ubuntu:18.04
MAINTAINER Yangyp <877696729@qq.com>

ENV DEBIAN_FRONTEND noninteractive
COPY sources.list.aly /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    zsh \
    git \
    gzip \
    make \
    gdb \
    cmake \
    tar \
    unzip \
    libssl-dev \
    libxerces-c-dev \
    libreadline-dev \
    ca-certificates \
    libpython2.7-dev \
    libbz2-dev \
    wget \
    curl \
    libssl-dev \
    redis-tools \
    net-tools \
    iputils-ping \
    ssh \
    tzdata \
    global 

# 设置语言
RUN apt-get update && apt-get install -y \
    --no-install-recommends apt-utils locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i zh_CN -c -f UTF-8 \
    -A /usr/share/locale/locale.alias zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装oh-my-zsh
COPY oh-my-zsh /root/.oh-my-zsh
COPY oh-my-zsh/plugins/z/z.sh /root/.z
RUN ln -s /root/.oh-my-zsh/.zshrc /root/.zshrc \
    && chsh -s /bin/zsh

# 安装neovim
# RUN apt-get install -y --no-install-recommends software-properties-common \
#     && add-apt-repository ppa:neovim-ppa/stable \
#     && apt-get update \
#     && apt-get install -y --no-install-recommends neovim

WORKDIR /root

