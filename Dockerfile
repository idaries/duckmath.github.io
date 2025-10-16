# Use the official Node.js image as a base
FROM node:20-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Node.js manifest file (package.json)
# This step fails if package.json is not in the same directory as the Dockerfile
COPY package.json ./

# Install dependencies listed in package.json
RUN npm install

# Copy the rest of the application source code (including server.js)
COPY . .

# Cloud Run requires the container to listen on the port specified by the PORT environment variable.
EXPOSE 8080

# Define the command to run the application (runs 'node server.js')
CMD [ "npm", "start" ]
