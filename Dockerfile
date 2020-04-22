FROM node:12-alpine

ARG NEXUS_NPM_GROUP_URL
ARG NEXUS_TOKEN

RUN apk add --update bash
RUN apk --no-cache add curl


RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

COPY repo_checker.sh /repo_checker.sh

RUN /repo_checker.sh

RUN npm install

COPY --chown=node:node . .

EXPOSE 5000

CMD [ "node", "app.js" ]
