FROM node AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# for AWS:
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
