FROM node:20-alpine

WORKDIR /app

# Copiar todo el proyecto
COPY . .

# Instalar dependencias del servidor
RUN npm install

# Instalar dependencias del cliente y hacer build
RUN npm install --prefix client
RUN npm run build --prefix client

# Exponer puerto
EXPOSE 3001

# Arrancar servidor
CMD ["node", "server/index.js"]
