FROM node:20

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .


EXPOSE 8000

# add ARG to specify the environment
ARG NEXT_PUBLIC_MEDUSA_BACKEND_URL=${NEXT_PUBLIC_MEDUSA_BACKEND_URL}

# build the app
RUN yarn build

CMD [ "yarn", "start" ]