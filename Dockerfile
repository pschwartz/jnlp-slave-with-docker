FROM jenkinsci/jnlp-slave

USER root

RUN apt-get update -qq && apt-get install -qqy  \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

RUN apt-get update -qq && apt-get install -qqy docker-ce && rm -rf /var/lib/apt/lists/*

RUN usermod -a -G docker jenkins

USER jenkins

VOLUME /var/lib/docker
