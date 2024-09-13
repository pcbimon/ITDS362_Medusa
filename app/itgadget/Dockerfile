FROM node:20

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .

EXPOSE 9000
EXPOSE 8000
EXPOSE 7000
EXPOSE 7001

# build the app
RUN yarn build

CMD [ "yarn", "start" ]