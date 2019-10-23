FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build --> 에 필요한 파일
# run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
