FROM node:14

# Let's use bash as a default shell
SHELL ["/bin/bash", "-c"]

# Update package list and install necessary libraries
RUN apt-get update && apt-get install -y \
    nano git unzip jq bash-completion \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD . .

# Add necessary stuff to bash autocomplete
RUN echo 'source /usr/share/bash-completion/bash_completion' >> /etc/bash.bashrc

RUN chmod +x docker-entrypoint.sh

EXPOSE 4200

ENTRYPOINT ["/app/docker-entrypoint.sh"]
