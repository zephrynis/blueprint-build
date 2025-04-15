FROM ghcr.io/blueprintframework/blueprint:v1.11.10

ENV BASE_DIR=/srv/pterodactyl

RUN ls

COPY ./github/workspace/. /srv/pterodactyl/.blueprint/dev/

RUN blueprint -build

RUN identifier=$(cat /srv/pterodactyl/.blueprint/dev/conf.yml | grep -m 1 "identifier:" | cut -d ":" -f2 | xargs) && \
    cp /srv/pterodactyl/${identifier}.blueprint /github/workspace/${identifier}.blueprint && \
    echo "${identifier}.blueprint" >> $GITHUB_OUTPUT