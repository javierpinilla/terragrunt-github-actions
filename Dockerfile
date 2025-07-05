FROM alpine:latest

ENV TERRAFORM_VERSION="1.12.2" \
    TERRAGRUNT_VERSION="v0.83.0"

RUN apk update && \
    apk add --no-cache \
      bash \
      unzip \
      curl \
      aws-cli \
      openssh-client

RUN cd /tmp && \
    wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/

RUN cd /tmp && \
    wget "https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" -O terragrunt && \
    chmod +x terragrunt && \
    mv terragrunt /usr/local/bin/

RUN terraform version && terragrunt --version

CMD ["sh"]