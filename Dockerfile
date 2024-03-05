FROM node:14 as Builder

WORKDIR /app

COPY package.json ./

RUN npm install 

COPY . . 

FROM node:14-alpine

WORKDIR /app
COPY --from=Builder /app/package*.json ./
COPY --from=Builder /app/index.js ./
COPY --from=Builder /app/node_modules ./node_modules

EXPOSE 3000
ENTRYPOINT [ "node" , "index.js" ]
