# Docker Image for Terraform Pipelines

This Docker image is specifically designed to support Terraform delivery pipelines, making it suitable for both on-premises and cloud-based (AWS/GCP) environments.

## Features

- **Update Frequency**: Monthly.
- **Operating System**: Debian Bookworm (12) Slim.
- **Timezone**: Europe/Berlin.

## Pre-installed Tools

The image comes pre-packaged with a set of tools that are commonly used in Terraform pipelines:

- `curl` and `wget`
- `terraform`
- `AWS CLI`
- `GCP CLI + gke-gcloud-auth-plugin`
- `Azure CLI`

## Usage

This image can be used as a base image in your Dockerfiles or in your CI/CD pipelines for deploying applications to Kubernetes.

## URLs

- **GitHub**: https://github.com/BestianCode/docker.terraform.cloud.tools
- **DockerHub**: https://hub.docker.com/r/bestian/terraform.cloud.tools
