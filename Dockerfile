FROM debian:bookworm-slim

ARG TARGETARCH

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y \
    curl wget \
    lsb-release apt-transport-https ca-certificates gpg gnupg2 software-properties-common \
    unzip

# AWS CLI
RUN if [ "$TARGETARCH" = "amd64" ]; then \
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
    fi
RUN unzip -oqq awscliv2.zip
RUN ./aws/install

RUN aws --version

# GCP CLI
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get update
RUN apt-get install -y google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin

# Terraform

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt-get update
RUN apt-get install -y terraform

RUN terraform --version
