# Usar una imagen base de Node.js con Alpine
FROM node:20-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias necesarias para Strapi y Alpine
RUN apk add --no-cache \
  bash \
  g++ \
  make \
  libmagic \
  libpng-dev \
  && npm install --production \
  && rm -rf /var/cache/apk/*

# Copiar el resto de los archivos del proyecto
COPY . .

# Exponer el puerto 1337 para Strapi
EXPOSE 1337

# Establecer las variables de entorno
ENV HOST=0.0.0.0
ENV PORT=1337

# Iniciar Strapi en modo de producción
CMD ["npm", "run", "start"]
