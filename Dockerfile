FROM node:current-alpine3.16
# Create app directory
WORKDIR /app
COPY package.json ./
RUN npm install
# Bundle app source
COPY . .
EXPOSE 7100
CMD [ "npm", "start" ]