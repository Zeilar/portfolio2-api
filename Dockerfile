FROM node:20 as build

WORKDIR /usr/src/app

COPY . .

RUN npm i --platform=linuxmusl

RUN npm run build

FROM node:alpine as main

COPY --from=build /usr/src/app /usr/src/app

WORKDIR /usr/src/app

EXPOSE 1337

CMD ["npm", "start"]
