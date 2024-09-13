# Dockerfile for Medusa Admin
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

# Copy the rest of the code
COPY . .

# Build the admin panel
RUN yarn build

# Expose the port
EXPOSE 7000

# Start the admin panel
CMD ["yarn", "start"]
