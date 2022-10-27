FROM openjdk:18-bullseye

RUN set -eux; \
    groupadd -g 1000 cloudcanal; \
    useradd --uid 1000 --gid 1000 --create-home cloudcanal; \
    apt-get update; \
    apt-get install -y file --no-install-recommends \
        file \
    ; \
    rm -rf /var/lib/apt/lists/*

COPY --chown=cloudcanal:cloudcanal ./cloudcanal /home/cloudcanal/cloudcanal
COPY --chown=cloudcanal:cloudcanal ./entrypoint.sh /home/cloudcanal/cloudcanal
RUN chmod +x /home/cloudcanal/cloudcanal/entrypoint.sh
RUN chmod +x /home/cloudcanal/cloudcanal/sidecar/bin/*.sh
RUN chmod +x /home/cloudcanal/cloudcanal/cloudcanal/bin/*.sh
ENV HOME /home/cloudcanal
WORKDIR /home/cloudcanal
USER cloudcanal
CMD ["./cloudcanal/entrypoint.sh"]
