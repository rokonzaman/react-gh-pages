FROM node:16-alpine

ENV NODE_ENV production

WORKDIR /app

COPY ./node_modules /app/node_modules/
COPY ./dist /app/dist/
COPY ./package*.json /app/
RUN mkdir /app/public

RUN npm cache clean --force && npm install --only=production

EXPOSE 7003
CMD ["node", "dist/main"]
