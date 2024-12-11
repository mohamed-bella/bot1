FROM node:14.21.3 AS node_base

# Set environment variables
ENV NODE_VERSION=14.21.3

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl ffmpeg imagemagick && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if exists) first to leverage caching
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the entire application source
COPY . .

# Expose the desired port
EXPOSE 5000

# Command to run the application
CMD ["node", "."]
