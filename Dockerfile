FROM ghcr.io/blueprintframework/blueprint:v1.11.10

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]