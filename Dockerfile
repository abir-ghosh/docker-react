FROM node:alpine AS builder

WORKDIR /usr/app
COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD ["npm","start"]
#RUN npm start

FROM nginx

COPY --from=builder /usr/app /usr/share/nginx/html
