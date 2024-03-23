FROM ubi9/ubi-minimal

ENV BW_CLI_VERSION=2024.2.1

COPY entrypoint.sh /

RUN microdnf update -y && \
    microdnf install -y unzip && \
    curl -L -O https://github.com/bitwarden/clients/releases/download/cli-v${BW_CLI_VERSION}/bw-linux-${BW_CLI_VERSION}.zip && \
    unzip bw-linux-${BW_CLI_VERSION}.zip && \
    mv bw /usr/local/bin/bw && \
    rm -rfv *.zip && \ 
    microdnf clean all -y && \
    chmod +x entrypoint.sh

EXPOSE 8087

CMD ["./entrypoint.sh"]
