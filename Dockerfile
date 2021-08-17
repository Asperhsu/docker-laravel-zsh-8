FROM laravelsail/php80-composer:latest
MAINTAINER Asper

RUN sed -i 's/deb.debian.org/opensource.nchc.org.tw/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y wget
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

COPY ./aliases.sh /root/aliases.sh
RUN echo "source ~/aliases.sh" >> ~/.zshrc

EXPOSE 8000

WORKDIR /opt