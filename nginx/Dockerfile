# Use Node.js as the base image
FROM node:21 as build-stage

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

FROM nginx:1.23.0-alpine

WORKDIR /../nginx

COPY ./config /etc/nginx/
COPY ./run.sh /run.sh

COPY --from=build-stage /client/dist /etc/nginx/html

USER root

RUN apk add --no-cache openssl bash
RUN chmod +x /run.sh

VOLUME /vol/static
VOLUME /vol/www

CMD ["/run.sh"]