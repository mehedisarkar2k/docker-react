FROM node:20-alpine3.19 AS builder

WORKDIR /home/app
COPY ./package.json ./
RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /home/app/build /usr/share/nginx/html