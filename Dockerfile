# Usar una imagen base de Alpine
FROM node:20-alpine

# Instalar dependencias necesarias para construir sharp
RUN apk add --no-cache \
    build-base \
    libc6-compat \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    libpng-dev \
    giflib-dev \
    libwebp-dev \
    vips-dev

# Crear directorio de la aplicación
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias
RUN npm install

# Compilar sharp para Alpine
RUN npm rebuild sharp --platform=linuxmusl

# Construir la aplicación
RUN npm run build

# Puerto de la aplicación
EXPOSE 1337

# Iniciar Strapi
CMD ["npm", "run", "start"]
