# FROM node AS builder
# AWS fix
FROM node
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# for AWS:
EXPOSE 80
# COPY --from=builder /app/build /usr/share/nginx/html
# AWS fix
COPY --from=0 /app/build /usr/share/nginx/html
