# Stage 1: Build frontstore
FROM node:20 AS frontstore-build
WORKDIR /app/frontstore
COPY ./package*.json ./
COPY ./yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build
CMD ["yarn", "start"]


# Expose ports for backstore and frontstore
EXPOSE 8000