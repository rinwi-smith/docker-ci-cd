
# Use the official Node.js image from Docker Hub
FROM node:14

# Create and set the app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]

