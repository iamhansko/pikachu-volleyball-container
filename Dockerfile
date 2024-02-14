FROM node AS builder

WORKDIR /build

COPY . .

RUN npm install

RUN npm run build

FROM node

WORKDIR /app

COPY --from=builder /build/dist ./dist

CMD ["npx", "http-server", "dist"]