# Stage 1: Build backstore
FROM node:20-alpine AS backstore-build
WORKDIR /app/backstore
COPY ./package*.json ./
COPY ./yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# Stage 2: Run backstore
FROM node:20-alpine AS backstore-run
WORKDIR /app/backstore
COPY --from=backstore-build /app/backstore ./
CMD [ "yarn" ,"start"]

# Expose ports for backstore and frontstore
EXPOSE 9000 7000 7001