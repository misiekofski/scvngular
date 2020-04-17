### STAGE 1: Build ###
FROM node:12.16.2-alpine3.11 AS build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.10-alpine
COPY --from=build /usr/src/app/dist/scvngular /usr/share/nginx/html