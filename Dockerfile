FROM node:18-alpine
WORKDIR /data
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build
# Use Render's PORT env var
CMD sh -c "n8n start --port $PORT"
