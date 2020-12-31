FROM python:3-alpine

RUN apk add --no-cache \
    gcc \
    musl-dev

COPY requirements.txt /
RUN pip3 install -r requirements.txt

COPY plex-auto-genres.py /
COPY generate-collections.sh /
COPY entrypoint.sh /

# give execution permission to scripts
RUN chmod +x /entrypoint.sh && \
    chmod +x /generate-collections.sh && \
    chmod +x /plex-auto-genres.py

RUN echo "0 1 * * * /generate-collections.sh" > /etc/crontabs/root

ENTRYPOINT ["/entrypoint.sh"]