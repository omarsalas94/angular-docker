FROM node:16.13.2 as node
WORKDIR /angular-app
COPY ./ /angular-app/
RUN npm install
RUN npm run build --configuration=prod

FROM nginx:alpine
COPY --from=node /angular-app/dist/chuviduvis /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf