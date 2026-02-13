FROM node:20-slim
ENV NODE_ENV=production
RUN groupadd -r app && useradd -r -g app -m -d /home/app -s /usr/sbin/nologin app
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g steam-hour-farmer@latest
RUN mkdir /data && chown app:app /data
WORKDIR /data
VOLUME ["/data"]
USER app
ENTRYPOINT ["steam-hour-farmer"]
CMD []
