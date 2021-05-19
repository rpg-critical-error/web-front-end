FROM node:14.16.0-alpine

# Create app directory

WORKDIR /home/node/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY front-end/package*.json ./
COPY front-end/yarn.lock ./

# Bundle app source
COPY front-end/ .

RUN yarn
RUN yarn global add serve

# If you are building your code for production
# RUN npm ci --only=production

CMD [ "serve", "-s", "build", "-l", "4200"]

