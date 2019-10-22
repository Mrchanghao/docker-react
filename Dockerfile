FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build --> 에 필요한 파일
# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html





#user: docker-react-travis-ci
#accessKeyID: AKIARSPET4OWYFJKU4YR
#secretKey: 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