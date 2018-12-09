
# ya tiene gitl 
FROM gitlab/dind

ENV KUBE_LATEST_VERSION="v1.10.0"
ARG NODE_VERSION=10.14.1
ARG ARCH=x64

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN apt-get update && \
    apt-get install -y build-essential libfontconfig zip git apt-transport-https gettext ca-certificates curl openssl software-properties-common && \
    curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
    && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
    && rm -f "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    apt-get autoremove -y 