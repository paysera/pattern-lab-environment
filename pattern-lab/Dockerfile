FROM node:4.6.1-slim

RUN apt-get update && apt-get install -y git
RUN rm -rf /var/lib/apt/lists/*

COPY .npmrc /root
COPY src/ /opt/pattern-lab

WORKDIR /opt/pattern-lab

RUN npm install
CMD ["./node_modules/.bin/gulp", "patternlab:serve"]

EXPOSE 3000
