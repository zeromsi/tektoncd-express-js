FROM node:12-alpine

ARG NEXUS_NPM_GROUP_URL
ARG NEXUS_TOKEN


RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./



RUN npm config set registry $NEXUS_NPM_GROUP_URL

RUN npm config set _auth $NEXUS_TOKEN

RUN npm install

COPY --chown=node:node . .

EXPOSE 5000

CMD [ "node", "app.js" ]
