FROM gitlab/dind

ENV KUBE_LATEST_VERSION="v1.10.0"

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN apt-get update && apt-get install -y software-properties-common
RUN curl -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/2.3.0/yq_linux_amd64 && chmod +x /usr/local/bin/yq
RUN apt-get install -y jq build-essential libfontconfig zip git apt-transport-https gettext ca-certificates curl openssl software-properties-common \
    && apt-get autoremove -y