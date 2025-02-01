# Gunakan image resmi Node.js versi 22
FROM node:22

# Set direktori kerja dalam container
WORKDIR /home/node

# Salin package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Install dependensi
RUN npm install

# Salin seluruh kode aplikasi ke dalam container
COPY . .

# Expose port (misalnya 3000 untuk aplikasi Express.js)
EXPOSE 3000

# Jalankan aplikasi
CMD ["node", "index.js"]