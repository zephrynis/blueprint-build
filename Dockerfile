FROM ghcr.io/blueprintframework/blueprint:v1.11.10

ENV BASE_DIR=/srv/pterodactyl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]