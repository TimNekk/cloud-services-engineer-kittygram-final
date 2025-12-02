FROM node:18
WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci

COPY . .
RUN npm run build && \
    npm install --global serve

CMD ["serve", "-s", "/app/build", "-l", "8000"]
