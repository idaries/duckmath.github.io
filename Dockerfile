# 1. Use the official Node.js image as a base
FROM node:20-slim

# 2. Set the working directory
WORKDIR /usr/src/app

# 3. Copy package.json and package-lock.json to the working directory
# This step is done separately to leverage Docker's build cache
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the application source code
COPY . .

# 6. Cloud Run requires your container to listen on the port specified by the PORT environment variable,
# which defaults to 8080 if not set.
EXPOSE 8080

# 7. Define the command to run the application
CMD [ "npm", "start" ]
