FROM tarampampam/node:14-alpine

RUN apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make
RUN npm install --quiet node-gyp -g

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
COPY public /public
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 5000

CMD [ "npm", "start" ]