# Phase 1 building production app version
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build


# Phase 2 using nginx as production web server, put values from build --> nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
