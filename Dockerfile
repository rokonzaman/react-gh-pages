FROM node:16-alpine as builder
MAINTAINER Rokon
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
