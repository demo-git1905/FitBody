# Use Node.js base image
FROM node:18

# Set working directory inside container
WORKDIR /app

# ⬇️ Copy frontend package files (React, Vite)
COPY package.json package-lock.json ./

# Install frontend dependencies
RUN npm install

# ⬇️ Copy backend package files (Express, Mongoose)
COPY server/package.json server/package-lock.json ./server/

# Install backend dependencies
RUN cd server && npm install

# ⬇️ Copy the rest of the code (frontend + backend)
COPY . .

# Expose backend port
EXPOSE 3000

# Start backend server
CMD ["node", "server/index.js"]
