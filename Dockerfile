FROM node:12-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node
RUN npm config set registry http://34.66.205.222.nip.io:32001/repository/npm-group/

RUN npm config set _auth YWRtaW46YWRtaW4xMjM=

RUN npm install

COPY --chown=node:node . .

EXPOSE 5000

CMD [ "node", "app.js" ]
