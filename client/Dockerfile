# Use Node.js as the base image
FROM node:14

# Set working directory
WORKDIR /client

# Copy package.json and package-lock.json to work directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Vue.js application
RUN npm run build