FROM debian:sid

ENV BW_CLI_VERSION=2024.2.1

COPY entrypoint.sh /

RUN apt update && \
    apt install -y wget unzip && \
    wget https://github.com/bitwarden/clients/releases/download/cli-v${BW_CLI_VERSION}/bw-linux-${BW_CLI_VERSION}.zip && \
    unzip bw-linux-${BW_CLI_VERSION}.zip && \
    chmod +x bw && \
    mv bw /usr/local/bin/bw && \
    rm -rfv *.zip && \ 
    apt autoremove -y --purge && apt clean -y && apt autoclean -y && \ 
    chmod +x entrypoint.sh

EXPOSE 8087

CMD ["./entrypoint.sh"]
