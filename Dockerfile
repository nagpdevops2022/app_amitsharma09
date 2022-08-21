# FROM node:12.18.1
# WORKDIR /app
# COPY package*.json .
# RUN npm install
# COPY . .
# CMD [ "node", "./bin/www" ]

FROM node:current-alpine3.16
# ENV PORT=3010
# Create app directory
WORKDIR /app
COPY package.json ./
RUN npm install
# Bundle app source
COPY . .
# EXPOSE 3010
EXPOSE 3500
CMD [ "npm", "start" ]