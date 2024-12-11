FROM node:14.21.3

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json to leverage caching
COPY package.json package-lock.json ./

# Install npm dependencies
RUN npm install

# Copy the entire application code into the container
COPY . .

# Expose the port the app will run on
EXPOSE 5000

# Run the application
CMD ["node", "."]