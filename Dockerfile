FROM node:12-alpine

ARG NPM_GROUP
ARG TOKEN


RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./



RUN npm config set registry $NPM_GROUP

RUN npm config set _auth $TOKEN

RUN npm install

COPY --chown=node:node . .

EXPOSE 5000

CMD [ "node", "app.js" ]
