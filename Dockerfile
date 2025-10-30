FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 make g++  \
    &&npm install \
    && apt-get remove -y python3 make g++ \
    && apt-get autoremove -y  && rm -rf /var/lib/apt/lists/*
COPY . .
EXPOSE 8006
CMD ["node", "server.js"]