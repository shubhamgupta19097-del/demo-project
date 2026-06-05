FROM node:20-alpine AS builder

WORKDIR /app

Copy package*.json ./

Run npm ci

COPY . .



FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/packages*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/app.js ./

EXPOSE 3000

USER node

CMD ["node","app.js"]




